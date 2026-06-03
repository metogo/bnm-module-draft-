# BNM 使用流程

## 一句话

用户负责创作意图，BNM 负责专业流程。

用户不需要先知道 BNM 有哪些角色。最推荐入口永远是：

```text
bnm-novel-conductor
```

## 标准项目流程

### 0. 直接描述小说目标

用户可以这样说：

```text
我想写一个近未来城市悬疑故事。城市每天要选择一个明天成为现实，其余明天会被烧掉供能。主角是负责验证明天的人。
```

BNM 应该自动判断：

- 这是概念问题
- 这是类型定位问题
- 这是世界规则问题
- 这是长篇故事发动机问题
- 当前不应该直接写完整正文

输出目标：

- `author-intent.md`
- `genre-positioning.md`
- 轻量故事简报
- 风险判断
- 待作者拍板设定

### 1. 做前提验证

调用方式：

```text
bnm-novel-conductor：验证这个小说前提能不能撑长篇，直接指出硬伤。
```

BNM 应该检查：

- 主角是否有当前压力
- 世界规则是否有代价
- 故事是否能持续产生新局面
- 读者是否能理解并期待下一章
- 设定是否只是概念展示

输出目标：

- `story-bible.md` 初版
- 前提诊断
- 中央戏剧问题
- 故事发动机

### 2. 建立三大圣经

长篇项目正式开写前，至少需要：

- `story-bible.md`
- `character-bible.md`
- `world-bible.md`

推荐指令：

```text
bnm-novel-conductor：基于目前设定，建立故事圣经、人物圣经、世界观圣经。所有未确认设定标成工作假设。
```

质量标准：

- 人物不是形容词集合，而是有欲望、恐惧、错误信念和当前压力。
- 世界规则不能方便主角，必须有成本。
- 故事圣经必须有“每章/每卷如何继续产生冲突”的发动机。

### 3. 做情节架构

推荐指令：

```text
bnm-novel-conductor：做第一季或第一卷情节架构，列出转折、中点、低谷、高潮和必须回收的伏笔。
```

输出目标：

- `plot-architecture.md`
- 卷结构
- 关键转折
- 伏笔义务
- 每卷读者承诺

不要一上来列 100 章目录。没有人物压力和规则代价的目录只是事件清单。

### 4. 写章节前先做章节卡

推荐指令：

```text
bnm-novel-conductor：写第一章之前，先生成章节卡，说明本章开头状态、结尾状态、场景目标、冲突、转折和后果。
```

章节卡必须回答：

- 本章为什么存在
- 主角在本章做了什么选择
- 本章结束后局面哪里变了
- 哪些信息能透露
- 哪些 canon 不能违反

输出目标：

- `chapters/chapter-001-brief.md`

### 5. 写正文

推荐指令：

```text
bnm-novel-conductor：根据章节卡写第一章。不要解释设定，用场景、行动、规则和后果呈现。
```

正文要求：

- 不用总结代替场景。
- 不用抽象情绪代替动作。
- 不让所有角色一个腔调。
- 不用假悬念结尾。
- 章节结尾必须是后果，不只是信息钩子。

输出目标：

- `chapters/chapter-001-draft.md`

### 6. 每章后更新连续性台账

推荐指令：

```text
bnm-novel-conductor：更新连续性台账，记录本章新增 canon、工作假设、人物知道的信息、伏笔和回收义务。
```

输出目标：

- `continuity-ledger.md`

必须登记：

- 新事实
- 时间线变化
- 人物知道了什么
- 道具状态
- 伤病状态
- 关系变化
- 伏笔
- 待作者拍板项

### 7. 修订时先判断失败层级

如果用户说：

```text
这一章不好看，帮我改。
```

BNM 不应该直接润色。应该先判断失败层级：

- 故事结构问题
- 人物动机问题
- 场景目标问题
- 规则解释问题
- 节奏问题
- 文风问题
- 连续性问题

推荐指令：

```text
bnm-novel-conductor：先诊断这一章的问题层级，不要直接重写。告诉我读者会在哪里失去兴趣或信任。
```

输出目标：

- `reviews/chapter-diagnosis.md`
- `reviews/developmental-edit-report.md`
- `reviews/pacing-map.md`
- `reviews/contradiction-report.md`

### 8. 去 AI 味

推荐指令：

```text
bnm-novel-conductor：这段太像 AI 写的。只处理文风、场景呈现和人物声线，不要改剧情 canon。
```

BNM 应该处理：

- 具体物件
- 身体动作
- 信息控制
- 句子节奏
- 人物声线差异
- 场景内压力

BNM 不应该擅自：

- 改人物关系
- 改剧情结果
- 新增世界规则
- 新增伏笔
- 改结局方向

## 常用自然语言指令

### 从零开始

```text
我只有一个小说点子，请你按 BNM 流程帮我判断它能不能撑长篇。
```

### 做故事圣经

```text
基于已有设定，建立 story-bible。未确认内容都标成工作假设。
```

### 做人物

```text
我的主角现在太扁，请诊断他缺什么当前压力，不要只加人设标签。
```

### 做世界观

```text
帮我检查这个世界规则有没有代价，哪些地方太方便主角。
```

### 写章节

```text
先生成第一章章节卡，再写第一章正文。正文不要大段解释设定。
```

### 修订章节

```text
先判断这一章的问题是结构、人物、节奏、连续性还是文风，再决定怎么改。
```

## 产物目录建议

推荐目录：

```text
docs/novel/
├── author-intent.md
├── genre-positioning.md
├── story-bible.md
├── character-bible.md
├── world-bible.md
├── plot-architecture.md
├── style-guide.md
├── continuity-ledger.md
├── chapters/
│   ├── chapter-001-brief.md
│   └── chapter-001-draft.md
└── reviews/
    ├── chapter-diagnosis.md
    ├── developmental-edit-report.md
    ├── pacing-map.md
    └── contradiction-report.md
```

## 合格输出标准

BNM 合格输出应该：

- 直接指出读者在哪里失去兴趣或信任。
- 把问题归到正确层级。
- 明确哪些设定是 canon，哪些只是工作假设。
- 给出可继续写作的产物。
- 不要求用户理解内部角色。
- 不用漂亮废话代替故事判断。

BNM 不合格输出通常表现为：

- “这个设定很有潜力”但不指出风险。
- “可以加强冲突”但不说明当前冲突为什么不成立。
- 不做章节卡直接写正文。
- 只润色句子，不处理结构失败。
- 擅自改变剧情 canon。

## 最短可用流程

如果用户只想快速开始，按这个顺序：

1. `bnm-novel-conductor`：讲清楚小说点子。
2. 生成 `story-bible.md`。
3. 生成 `character-bible.md`。
4. 生成 `world-bible.md`。
5. 生成 `chapter-001-brief.md`。
6. 写 `chapter-001-draft.md`。
7. 更新 `continuity-ledger.md`。

这就是 BNM 的最小专业闭环。
