#!/usr/bin/env ruby
# frozen_string_literal: true

require "csv"
require "json"
require "yaml"

root = File.expand_path("..", __dir__)
setup = File.join(root, "bnm-setup")
module_yaml = File.join(setup, "assets", "module.yaml")
module_help = File.join(setup, "assets", "module-help.csv")
marketplace = File.join(root, ".claude-plugin", "marketplace.json")
routing_cases_file = File.join(root, "tests", "routing-cases.json")

errors = []

begin
  config = YAML.load_file(module_yaml)
  errors << "module.yaml missing code: bnm" unless config["code"] == "bnm"
  errors << "module.yaml missing module_version" unless config["module_version"]
rescue StandardError => e
  errors << "module.yaml invalid: #{e.message}"
end

rows = []
begin
  rows = CSV.read(module_help, headers: true)
  expected_headers = %w[module skill display-name menu-code description action args phase preceded-by followed-by required output-location outputs]
  errors << "module-help.csv headers mismatch" unless rows.headers == expected_headers
rescue StandardError => e
  errors << "module-help.csv invalid: #{e.message}"
end

begin
  marketplace_config = JSON.parse(File.read(marketplace))
  plugin = marketplace_config.fetch("plugins").first
  marketplace_skills = plugin.fetch("skills").sort
  errors << "marketplace plugin name must be bmad-novel-method" unless plugin["name"] == "bmad-novel-method"
rescue StandardError => e
  errors << "marketplace.json invalid: #{e.message}"
  marketplace_skills = []
end

begin
  routing_cases = JSON.parse(File.read(routing_cases_file))
  errors << "routing-cases.json must be an array" unless routing_cases.is_a?(Array)
rescue StandardError => e
  errors << "routing-cases.json invalid: #{e.message}"
  routing_cases = []
end

skill_dirs = Dir.children(root)
                .select { |name| name.start_with?("bnm-") }
                .reject { |name| name == "bnm-setup" }
                .select { |name| File.directory?(File.join(root, name)) }
                .sort

skill_dirs.each do |dir|
  skill_path = File.join(root, dir, "SKILL.md")
  if File.file?(skill_path)
    skill_text = File.read(skill_path)
    errors << "#{dir} SKILL.md missing YAML frontmatter" unless skill_text.start_with?("---\n")
    errors << "#{dir} SKILL.md frontmatter missing name" unless skill_text.match?(/^name:\s+#{Regexp.escape(dir)}$/)
    errors << "#{dir} SKILL.md frontmatter missing description" unless skill_text.match?(/^description:\s+\S/)
    errors << "#{dir} SKILL.md missing runtime contract" unless skill_text.include?("_bmad/bnm/shared-resources/runtime-contract.md")
    errors << "#{dir} SKILL.md missing bundled shared resources path" unless skill_text.include?("resources/shared-resources/runtime-contract.md")
    errors << "#{dir} SKILL.md has malformed markdown backticks" if skill_text.include?("``resources/")
  else
    errors << "#{dir} missing SKILL.md"
  end

  shared_runtime = File.join(root, dir, "resources", "shared-resources", "runtime-contract.md")
  shared_chinese_policy = File.join(root, dir, "resources", "shared-resources", "chinese-output-policy.md")
  errors << "#{dir} missing bundled runtime contract" unless File.file?(shared_runtime)
  errors << "#{dir} missing bundled Chinese output policy" unless File.file?(shared_chinese_policy)
end

required_resource_files = [
  "bnm-novel-conductor/resources/routing-matrix.md",
  "bnm-novel-conductor/resources/artifact-registry.md",
  "bnm-novel-conductor/resources/artifact-update-policy.md",
  "bnm-novel-conductor/resources/routing-test-policy.md",
  "shared-resources/chinese-output-policy.md",
  "shared-resources/anti-ai-prose-rules.md",
  "shared-resources/anti-ai-prose-checklist.md",
  "shared-resources/evaluation-rubric.md",
  "shared-resources/project-structure-zh-CN.md",
  "shared-resources/runtime-contract.md",
  "TROUBLESHOOTING.md",
  "INSTALL_VALIDATION.md"
]

required_resource_files.each do |relative|
  path = File.join(root, relative)
  errors << "missing module resource: #{relative}" unless File.file?(path)
end

Dir.glob(File.join(root, "**", "*")).each do |path|
  next unless File.file?(path)
  next if path.end_with?(".tar.gz")

  content = File.read(path)
  workspace_prefix = File.join("", "Users", "fanhua", "")
  errors << "workspace absolute path leaked into #{path.sub("#{root}/", "")}" if content.include?(workspace_prefix)
end

registered = rows.map { |row| row["skill"] }.compact.reject { |skill| skill == "_meta" }.sort
unregistered = skill_dirs - registered
missing_dirs = registered - skill_dirs
marketplace_expected = (skill_dirs + ["bnm-setup"]).sort
marketplace_extra = marketplace_skills - marketplace_expected
marketplace_missing = marketplace_expected - marketplace_skills

errors << "unregistered skill dirs: #{unregistered.join(", ")}" unless unregistered.empty?
errors << "registered commands without dirs: #{missing_dirs.join(", ")}" unless missing_dirs.empty?
errors << "marketplace skills without dirs: #{marketplace_extra.join(", ")}" unless marketplace_extra.empty?
errors << "skill dirs missing from marketplace: #{marketplace_missing.join(", ")}" unless marketplace_missing.empty?

setup_skill_text = File.read(File.join(setup, "SKILL.md"))
errors << "bnm-setup must be included in marketplace skills so BMad uses setup-strategy module.yaml" unless marketplace_skills.include?("bnm-setup")
errors << "bnm-setup must not have YAML frontmatter; otherwise it appears as a user skill" if setup_skill_text.start_with?("---\n")

rows.each do |row|
  errors << "row for #{row["skill"] || "unknown"} has extra CSV fields" if row[nil]&.any?
  next if row["skill"] == "_meta"

  %w[module skill display-name menu-code description phase required].each do |field|
    value = row[field]
    errors << "row for #{row["skill"] || "unknown"} missing #{field}" if value.nil? || value.strip.empty?
  end
  output_location = row["output-location"]
  if output_location&.include?("{output_folder}/novel")
    errors << "row for #{row["skill"]} uses generic output_folder instead of bnm_output_folder"
  end
end

routing_cases.each do |test_case|
  id = test_case["id"] || "unknown"
  %w[user_request mode intent_layers expected_commands expected_roles expected_artifacts must_not].each do |field|
    value = test_case[field]
    errors << "routing case #{id} missing #{field}" if value.nil? || (value.respond_to?(:empty?) && value.empty?)
  end

  expected_commands = test_case["expected_commands"] || []
  expected_roles = test_case["expected_roles"] || []
  available_commands = registered + ["bnm-novel-conductor"]
  missing_expected_commands = expected_commands - available_commands
  missing_expected_roles = expected_roles - skill_dirs
  errors << "routing case #{id} references unregistered commands: #{missing_expected_commands.join(", ")}" unless missing_expected_commands.empty?
  errors << "routing case #{id} references missing roles: #{missing_expected_roles.join(", ")}" unless missing_expected_roles.empty?
end

if errors.empty?
  puts "BNM module draft validation passed"
  puts "registered skills: #{registered.length}"
else
  warn "BNM module draft validation failed"
  errors.each { |error| warn "- #{error}" }
  exit 1
end
