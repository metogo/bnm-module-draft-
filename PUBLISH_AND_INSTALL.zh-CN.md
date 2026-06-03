# BNM 发布与安装指南

## 当前结论

BNM 当前可以作为 BMad custom-source 包发布给其他人使用。它还不是 BMad 官方社区模块，但已经通过 BMad 6.8.0 的本地安装验证。

对用户来说，真正的可安装单元是：

```text
bnm-module-draft/
```

这个目录必须保持完整，尤其是：

- `.claude-plugin/marketplace.json`
- `bnm-setup/assets/module.yaml`
- `bnm-setup/assets/module-help.csv`
- `bnm-*/SKILL.md`
- `bnm-*/resources/shared-resources/`
- `shared-resources/`

## 发布方式一：发布为独立 GitHub 仓库

这是最推荐方式。

仓库根目录直接放 `bnm-module-draft/` 里的内容。也就是说，发布仓库根目录应该长这样：

```text
.
├── .claude-plugin/
│   └── marketplace.json
├── bnm-setup/
├── bnm-novel-conductor/
├── bnm-draft-chapter/
├── shared-resources/
├── tests/
└── scripts/
```

不要把整个 `outputs/bmad-novel-method/` 当作安装源发布。那个目录包含产品说明、示例、release 包和开发证据，不是最干净的安装源。

发布后，用户安装命令：

```bash
npx bmad-method install --directory /path/to/user-project --custom-source https://github.com/<org>/<repo> --tools claude-code --yes
```

## 发布方式二：发布在大仓库子目录

如果你必须把 BNM 放在某个大仓库的子目录，例如：

```text
repo/
└── bnm-module-draft/
```

用户安装时要使用带子目录的 GitHub URL：

```bash
npx bmad-method install --directory /path/to/user-project --custom-source https://github.com/<org>/<repo>/tree/main/bnm-module-draft --tools claude-code --yes
```

这个方式可用，但不如独立仓库清楚。用户更容易复制错路径。

## 发布方式三：发布压缩包

当前 release 包位置：

```text
release/bmad-novel-method-0.1.0.tar.gz
```

发布压缩包时，同时提供：

```text
release/SHA256SUMS
```

用户下载后解压，再用解压出来的 `bnm-module-draft` 作为 custom-source：

```bash
tar -xzf bmad-novel-method-0.1.0.tar.gz
npx bmad-method install --directory /path/to/user-project --custom-source /absolute/path/to/bnm-module-draft --tools claude-code --yes
```

## 发布前检查

在 `outputs/bmad-novel-method/` 目录运行：

```bash
ruby bnm-module-draft/scripts/validate_module.rb
ruby scripts/validate_all.rb
```

成功输出应包含：

```text
BNM module draft validation passed
registered skills: 24
BNM full validation passed
```

检查 release 包校验：

```bash
cd release
shasum -a 256 -c SHA256SUMS
```

成功输出：

```text
bmad-novel-method-0.1.0.tar.gz: OK
```

## 安装方式

### 本地安装

从 `bnm-module-draft` 的父目录安装：

```bash
npx bmad-method install --directory /path/to/user-project --custom-source ./bnm-module-draft --tools claude-code --yes
```

或者用绝对路径：

```bash
npx bmad-method install --directory /path/to/user-project --custom-source /absolute/path/to/bnm-module-draft --tools claude-code --yes
```

不要使用裸相对路径：

```bash
npx bmad-method install --directory /path/to/user-project --custom-source bnm-module-draft --tools claude-code --yes
```

BMad 6.8.0 可能把裸 `bnm-module-draft` 判定为无效源。必须写 `./bnm-module-draft` 或绝对路径。

### GitHub 安装

独立仓库：

```bash
npx bmad-method install --directory /path/to/user-project --custom-source https://github.com/<org>/<repo> --tools claude-code --yes
```

子目录仓库：

```bash
npx bmad-method install --directory /path/to/user-project --custom-source https://github.com/<org>/<repo>/tree/main/bnm-module-draft --tools claude-code --yes
```

## 安装成功标准

成功安装后，用户项目里应该出现：

```text
_bmad/bnm/
.claude/skills/bnm-novel-conductor/
.claude/skills/bnm-draft-chapter/
```

`.claude/skills` 中应该有 24 个 `bnm-*` 可调用 skill。

不应该出现：

```text
.claude/skills/bnm-setup/
```

`bnm-setup` 是内部 setup skill。它必须存在于安装源里，但不能暴露给用户。

## 已知升级问题

如果某个项目安装过早期实验版，可能残留：

```text
_bmad/bmad-novel-method/
```

这会让 BMad 在更新时保留旧模块并发出警告。处理方式：

1. 删除旧的生成模块 `_bmad/bmad-novel-method/`。
2. 从 `_bmad/_config/manifest.yaml` 移除 `bmad-novel-method` 模块条目。
3. 重新运行安装命令。

这是早期实验包升级问题，不是当前 clean install 问题。

## 用户安装后怎么启动

安装完成后，在用户项目里启动支持 Claude Code skills 的 agent，然后直接调用：

```text
bnm-novel-conductor
```

用户不用先学习角色名。直接说小说问题即可。
