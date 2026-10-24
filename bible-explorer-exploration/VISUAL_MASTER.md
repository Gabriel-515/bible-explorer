# BIBLE EXPLORER — VISUAL & ART DIRECTION MASTER
> 给 Claude 视觉 chat 用的 handoff · Version 2.0 · Oct 2026
> 每次开新 chat，把这份文件 + MASTER_BRAIN.md 一起丢进去。
> 这份文件负责：视觉 DNA、美术方向、色彩系统、光线、UI、Godot 场景氛围。
> 不负责：剧本对话、代码实现、游戏系统设计。
>
> v2.0 changes: Added Canon Amendment M04-A — Creation Tablets I–VI visual specifications,
> Day 2 six-movement restoration constraints, REST UI rules, and placeholder asset rules.

---

# 这份文件的职责

**你（Claude 视觉 chat）负责：**
- 视觉 DNA 和美术风格方向
- 色彩系统和光线语言
- UI / 扫描仪界面设计方向
- 场景氛围和层次构图
- Godot 场景的视觉实现建议
- 角色和环境的视觉表达
- Creation Tablet 最终视觉 canon（M04-A 授权）

**你不负责：**
- 剧本和对话写作
- 游戏系统逻辑
- Godot 代码

**所有视觉决定必须回答：这在视觉上是否服务了 AGAPE 的脊梁？**

---

# 视觉 DNA — 最核心的感觉

> **世界很大，人很小，答案不总是清楚，但永远有光。**

每一帧画面都必须传达：
- 敬畏感（来自尺度，不来自解释）
- 谦卑感（ARCHIVIST 在宏大面前的渺小）
- 希望感（即使在废墟里，也有光）
- 谜的感觉（不是所有东西都清晰可见）

---

# 色彩语言系统（已锁定）

## 主色系

| 颜色 | 名称 | 用途 | 含义 |
|---|---|---|---|
| **Cyan 系** | 系统蓝 | 扫描仪 UI、系统文字、ARCHIVIST 的技术界面 | 理性、系统、ARCHIVIST 的母语、计算 |
| **Gold / 有机暖色** | 生命金 | 芽、遗物、不能被系统归类的东西、AGAPE 出现时 | 生命、希望、意义、系统无法分类的东西 |
| **Warm Amber** | 家的琥珀 | 飞船起居室、温暖空间 | 家、休息、安全 |
| **深蓝 / 宇宙黑** | 太空深色 | 太空、宇宙、主菜单背景 | 无尽、未知、旅程 |
| **暖雾 / 苔绿** | 伊甸暖色 | 废墟伊甸园的雾、枯死植被的残留暖意 | 曾经活着的痕迹 |

## 最重要的色彩规则

**Gold 不是神迹的颜色。**

Gold 代表：某样不能完全归入机器分类的东西。

✅ Gold 用在：芽、古老种子、AGAPE 第一次出现在界面上、遗物
❌ Gold 不用在：一般环境装饰、普通 UI 元素、随意的发光效果

**第一次出现 Gold 的时机必须被保护。**
它是整个游戏视觉语言里最有重量的颜色变化。不能被稀释。

---

# 光线语言（已锁定）

## 光线是叙事工具，不是装饰

| 场景 | 光线方向 | 光线感觉 |
|---|---|---|
| 废墟伊甸园 | 漫射、柔和、有雾 | 曾经有过光，但现在只剩余光 |
| 活着的伊甸园 | 从上方倾泻、温暖、丰富 | 真实的创造之光 |
| 飞船内部 | 暖色人造光、局部照明 | 人类的庇护所 |
| 圣经阅读器 | Cyan 焦点光晕 | 知识、探索、搜索 |
| 太空 / 宇宙 | 点状星光、深邃 | 无限的未知 |
| 腐败序列 | 光线撕裂、闪烁、cyan 几何体暴露 | 系统崩溃、真实与模拟的边界消失 |

## 关键光线时刻

**芽出现的那一刻：**
- 不是爆光
- 不是特效
- 是一株小小的、真实的生命，在废墟的环境光里安静存在
- 它的光来自它本身的有机质感，不是系统给它打的光

---

# 场景视觉构图原则

## 尺度法则
ARCHIVIST 必须永远看起来很小。

世界必须永远看起来比他大得多。

不是让他感觉弱小——是让世界感觉**宏大和值得敬畏**。

## 层次法则
每个场景至少三个视觉层次：
- **前景**（近处细节、植被、地面纹理）
- **中景**（ARCHIVIST 活动的空间）
- **远景**（宏大的背景、天空、远山、树的上部）

当前已实现的 Godot 实现：Layered parallax（通过视觉验证）

## 雾和不清晰
雾不是技术限制，它是叙事决定。

不是所有东西都需要清晰可见。

谜的感觉来自：什么在雾里，什么从雾里出来。

---

# ARCHIVIST 视觉（已锁定方向）

## 外观原则
- 小小的人形，在巨大环境里
- 宇航员 / 科考员的实用服装，不是英雄盔甲
- 工具性的装备（扫描仪、传输信标）
- 没有过多装饰

## 动作表达
他的幽默和性格通过**物理动作**表达，不通过语言：
- 被枯藤绊倒（降落时）
- 拍传输信标（敲 → 敲 → 拍 → ONLINE）
- 安静地假装什么都没发生

**在重大神圣时刻，他的动作变得静止和专注。**

---

# 扫描仪 UI 视觉语言（已锁定）

## 风格
- 极简
- Cyan 系主色
- 等宽字体（monospace）
- 数字和数据为主
- 没有装饰性图形

## 示例格式

```
ORGANIC STATUS:
VIABLE

CELLULAR ACTIVITY:
ACTIVE

SOURCE:
UNKNOWN
```

## AGAPE 第一次出现时的视觉特殊处理

背景：冷蓝色 Cyan UI（标准）
AGAPE 词条：第一次克制使用 **Gold 高亮**

```
QUERY: AGAPE

TRANSLATION: LOVE // UNCONDITIONAL // SELF-GIVING
[Gold text]

UTILITY: UNRESOLVED
[Gold text, 有微弱的金色光晕]
```

**Gold 不是粗体、不是闪烁、不是动画。它只是颜色不同。克制。**

---

# 飞船内部视觉（已锁定布局和光线）

## 空间布局
```
衣柜 / 储物空间
起居室（暖琥珀色）
圣经阅读器（Cyan 焦点光晕）— 主要互动
日志（温暖 + 克制的屏幕光）— 紧邻圣经阅读器
遗物档案（物理展示空间）
卧室（上方，梯子或垂直通道）
导航 / 驾驶舱（技术感 Cyan / Orange）
```

## 光线层级

| 区域 | 光线 | 感觉 |
|---|---|---|
| 圣经阅读器 | Cyan 焦点光晕 | 知识、探索的起点 |
| 起居室 | 暖琥珀色 | 家、减压 |
| 卧室 | 偏暗 | 休息、安静 |
| 日志 | 暖色 + 克制的屏幕光 | 反思、私密 |
| 驾驶舱 | 技术感 Cyan / Orange | 任务、旅行 |

## 飞船的核心感觉
> "我回来了。"

不是冷冰冰的太空船。是一个有温度的移动家园。

随着游戏进行，飞船里的遗物档案会慢慢被填满——这个视觉变化是ARCHIVIST成长的物理记录。

---

# 伊甸园视觉分两个状态（已锁定）

## 状态 1：废墟伊甸园（Day 1 / 现在）

当前已实现：分层视差 parallax，通过视觉验证。

感觉：
- 古老
- 美丽（不是丑陋的废墟）
- 有雾
- 部分休眠
- 以巨大的知识之树为主体
- ARCHIVIST 相比之下非常渺小

**它不是活着的伊甸园。但它保留了曾经美好的痕迹。**

## 状态 2：活着的伊甸园（Day 2 重建）

重建顺序（六创造运动，与 M04-A Creation Tablets 对应，已锁定）：

```
运动 1 — 光与分离（对应 Tablet I）
  音效先行：静默打破
  低能见度中，光将可通行空间与黑暗分开，揭示路径
  ↓
运动 2 — 天空与水（对应 Tablet II）
  雾霾消散为可见天空层
  水渠和水盆表面重现流水
  现有水渠恢复为主要视觉节拍
  ↓
运动 3 — 地面、草、花与植被（对应 Tablet III）
  地面轮廓增强
  草、花、更大植被按已接受顺序回归
  现有植被资产和前后对比保留
  ↓
运动 4 — 天体节律（对应 Tablet IV）
  极慢色温过渡：更暖的太阳方向，更冷的阴影，淡淡的星月记忆
  这是环境过渡，不是时间流逝小游戏
  绝不出现快进、日夜循环、或可见的"时间经过"效果
  ↓
运动 5 — 水中生命与鸟（对应 Tablet V）
  水面出现扰动、折射、隐约水下运动
  鸟鸣声先于轮廓出现，再出现鸟的轮廓进入树冠
  不需要鱼类模型；水的骚动暗示生命即可
  现有鸟类恢复资产完整保留
  ↓
运动 6 — 动物与人（对应 Tablet VI）
  前五个运动建立后，动物才进入
  远处出现亚当和夏娃的半透明档案投影
  他们遥远、沉默、不可互动
  ↓
树冠展开（知识之树完全绽放）
↓
完整的活着的伊甸园 — 4–6 分钟自由漫步
```

感觉（必须达到）：

# 宏伟 / 仙境 / 鸟语花香

视觉方向：
- 比废墟状态**明显更亮**
- 暖金色的光从上方倾泻
- 植被茂盛、有深度和层次
- 动物和鸟类给场景增加动态感
- 知识之树在充分的光线下感觉神圣而非威胁

**玩家必须感觉：这里曾经存在过某样珍贵的东西。**

---

# ═══════════════════════════════════════════
# M04-A CANON AMENDMENT — CREATION TABLETS
# Approved by Gabriel · 23 Oct 2026
# Claude Visual Master owns this section
# ═══════════════════════════════════════════

## Creation Tablet 视觉总原则

**Tablet 不是收藏品。**
它们是废墟里已经存在的东西——不是被放置的谜题，是被发现的证据。

**关于 tablet 视觉资产的所有权规则（已锁定）：**
- Claude Visual Master 拥有所有六块 tablet 的最终视觉 canon
- Codex（实现聊天）只能使用中性占位符锚点
- 所有临时节点 / 占位符资产必须清晰标记为 `[PLACEHOLDER — VISUAL REVIEW REQUIRED]`
- Codex 不得生成、绘制或宣布最终 tablet 视觉
- 新 tablet 视觉设计在 Codex 提交之前必须交由 Claude Visual Master 进行视觉 canon 审查

## Tablet 物理状态通则

六块 tablet 都是损坏的人造档案文物，被扫描仪识别为"出处未解决"。

通用物理语言：
- 石质表面，非金属，非科技感
- 文字大部分损坏或缺失——碎片，不是完整文本
- 每块 tablet 的损坏方式不同（参见各 tablet 具体说明）
- 颜色：石灰色、沙岩色、矿物色——用于废墟 Day 1
- Day 2 counterpart 不是"修复的石板"，而是 tablet 所对应的创造运动在环境中实现

**Tablet 不发光。它们不是神奇的发光石板。它们是古老的档案材料。**

## Tablet 扫描仪 UI 通则

所有六块 tablet 的扫描 UI 遵循标准扫描仪语言（Cyan 系，monospace）：

```
[MATERIAL ANALYSIS]
[ARCHIVAL CONFIDENCE]
CORRELATION: GENESIS [range]
SEQUENCE MARKER: [I–VI]
FULL RANGE QUEUED FOR ARCHIVE RECONSTRUCTION
```

**绝对不显示：**
- "Tablet collected"
- "Creation Day complete"
- 进度分数（如 1/6, 2/6）
- 神学解释
- 测验题
- 奖励或数值

每次扫描目标时长：**6–10 秒**，ARCHIVIST 保持可见移动，无模态阅读界面。

---

## Creation Tablet I — 光与黑暗

**Scripture range:** Genesis 1:1–5
**Fragment:** "Let there be light."
**ARCHIVIST reaction:** "The burn pattern has no heat source."

### 物理外观（视觉 canon）
- 石板沿对角线断裂
- 一半：烟黑色、玻璃化（受极高温影响）
- 另一半：浅色石材，能捕捉扫描光束
- 大部分文字在断裂处丢失
- 尺寸：中等，ARCHIVIST 及肩高度或略矮

### 环境证据
- 石板周围：烧焦阴影与光反应矿物生长之间的锐利边界
- 这种对比太清晰，不像普通风化
- 光从那一侧落下来——不是人工光，是扫描时场景自然的漫射光

### 扫描仪 UI 文本
```
ARCHIVAL TEXT: PARTIAL
CORRELATION: GENESIS 1:1–5
SEQUENCE MARKER: I
FULL RANGE QUEUED FOR ARCHIVE RECONSTRUCTION
```

### Day 2 对应（运动 1 — 光与分离）
- 不是"修复的石板"
- 是光本身将可通行空间从黑暗中分离
- 低能见度中，一道光揭示路径
- 感觉：静默被光打破，不是戏剧性，是安静的、根本性的

---

## Creation Tablet II — 天空与水

**Scripture range:** Genesis 1:6–8
**Fragment:** "waters above … waters below."
**ARCHIVIST reaction:** "This basin records water in two directions."

### 物理外观（视觉 canon）
- 水侵蚀，部分淹没在矿物淤泥中
- 上边缘：漂白（水分蒸发后的矿物残留，浅白色）
- 下表面：蓝绿色沉积物 + 水平潮痕
- 两种不兼容的水历史记录在同一块石头上

### 环境证据
- 悬浮矿物痕迹在上（表示曾有水悬在上方？）
- 渠道侵蚀在下（正常的地表水流动）
- 这两种模式在物理上不应该同时存在于同一结构

### 扫描仪 UI 文本
```
HYDROLOGICAL LAYERS: INCONSISTENT
CORRELATION: GENESIS 1:6–8
SEQUENCE MARKER: II
ATMOSPHERIC MODEL: INCOMPLETE
```

### Day 2 对应（运动 2 — 天空与水）
- 雾霾消散为可见天空层
- 水渠和水盆表面重现清水流动（有光的折射）
- 这是 Day 2 最重要的单一视觉节拍之一

---

## Creation Tablet III — 土地与植被

**Scripture range:** Genesis 1:9–13
**Fragment:** "Let the earth bring forth."
**ARCHIVIST reaction:** "The soil is capable. Nothing is using it."

### 物理外观（视觉 canon）
- 大部分被埋，被枯死的根系抬起
- 表面压印：种子形状、叶脉痕迹（压入石中，不是雕刻）
- 只有顶部三分之一最初可见
- 需要靠近或扫描才能完全识别它

### 环境证据
- 休眠花粉迹象、古老根系路径
- 土壤化学分析：适合生命，但没有活着的植物使用
- 地面似乎已经准备好迎接生命，但生命缺席

### 扫描仪 UI 文本
```
SOIL VIABILITY: ABNORMAL
BIOLOGICAL OUTPUT: NONE
CORRELATION: GENESIS 1:9–13
SEQUENCE MARKER: III
```

### Day 2 对应（运动 3 — 地面、草、花与植被）
- 地面轮廓增强
- 草、花、更大植被按已接受顺序回归
- 现有植被资产和 Day 1 → Day 2 对比视觉完整保留
- 石化的花变为鲜艳盛开；干涸水渠变为流水；枯黄植被变为翠绿

---

## Creation Tablet IV — 日、月与星

**Scripture range:** Genesis 1:14–19
**Fragment:** "for signs and seasons."
**ARCHIVIST reaction:** "It was built to measure a sky that no longer moves."

### 物理外观（视觉 canon）
- 表面是**磨光**的，而不是深雕刻
- 圆形镶嵌物已丢失，留下凹陷：一个大圆盘槽、一个小圆盘槽、大量小圆孔（星）
- 一条断裂的瞄准槽穿过树冠指向天空
- 外观像一件精密天文仪器，不像普通石刻

### 关键视觉注意
- 这块石板精度最高，损坏方式最为刻意（圆盘被取走，而不是自然脱落）
- 它的对齐方向是有意义的——它指着天空

### 扫描仪 UI 文本
```
CELESTIAL ALIGNMENT: PRESERVED
LOCAL SKY DATA: NONRESPONSIVE
CORRELATION: GENESIS 1:14–19
SEQUENCE MARKER: IV
```

### Day 2 对应（运动 4 — 天体节律）— 最严格的视觉约束

**极慢色温过渡规则（已锁定，不可违反）：**
- 太阳方向轻微移动（更暖的角度）
- 阴影轻微冷却
- 淡淡的星月记忆出现在天空（不是完整的星空，是残留的记忆）
- 整个过渡必须极慢——跨越完整的 4–6 分钟自由漫步期
- 绝对不能有：快进时钟、快速日夜切换、明显的"时间流逝"
- 如果玩家不刻意观察天空，他们可能察觉不到——这是对的

---

## Creation Tablet V — 水中与天空的生命

**Scripture range:** Genesis 1:20–23
**Fragment:** "let the waters teem … let birds fly."
**ARCHIVIST reaction:** "Two habitats. The same absence."

### 物理外观（视觉 canon）
- 下半部分：水侵蚀磨圆
- 上半部分：碎裂、暴露
- 鱼的形状和翅膀的形状在石板上几乎隐形——只有当扫描光从特定角度照射时才可见
- 这种"需要光才能看见"的效果是这块石板的独特视觉语言

### 环境证据
- 鳞片印记：在旧水位以下
- 羽毛痕迹：在鳞片印记上方
- 两个栖息地都记录了，但没有活着的生物

### 扫描仪 UI 文本
```
FAUNAL TRACES: AQUATIC / AERIAL
CURRENT LIFE SIGNS: ZERO
CORRELATION: GENESIS 1:20–23
SEQUENCE MARKER: V
```

### Day 2 对应（运动 5 — 水中生命与鸟）— 已锁定的视觉约束

**水中生命的视觉处理规则（已锁定）：**
- 用水的骚动、折射、或隐约的水下阴影暗示生命
- **不需要鱼类模型**
- 如果制作范围允许，可以有隐约的水下运动，但不是必须的
- 鸟类：鸟鸣声先于轮廓，轮廓先于具体的鸟
- 现有鸟类恢复资产完整保留

---

## Creation Tablet VI — 动物与人类

**Scripture range:** Genesis 1:24–31
**Fragment:** "It was very good." ← 已锁定（Gabriel 23 Oct 2026 确认）
**ARCHIVIST reaction:** "The animal forms survived. The human record did not."

### 物理外观（视觉 canon）
- 比其他五块**损坏更严重**——这是刻意的
- 周边：动物浮雕完整保留（清晰可辨的动物形态）
- 中央：两个直立的人形轮廓已被击碎或风化成近乎消失
- 它是整个系列里最破碎的石板，也是视觉上最有重量的

### 环境证据
- 多种动物足迹向树汇聚
- 两个直立脚印在树前停下
- 没有遗骸，没有活着的读数

### 扫描仪 UI 文本
```
ARCHIVAL SOURCE CORRELATION: GENESIS
CORRELATION RANGE: GENESIS 1:24–31
SEQUENCE MARKER: VI
PRIMARY RECORD: LOCKED
RETURN TO SHIP TERMINAL
```

### Day 2 对应（运动 6 — 动物与人类）
- 前五个运动完全建立之后，动物才进入
- 远处：亚当和夏娃以半透明档案投影形式出现
  - 遥远（在远景，不是中景或前景）
  - 沉默（无对话，无文字）
  - 非互动（没有可扫描的对象，没有点击区域）
  - 半透明（像档案数据的投影，不是实体人物）
  - 原型式（不要过度具体化成某一种族或外貌）
  - 不完整（像数据残缺的影像）

---

# REST — 安息日视觉规则（M04-A 已锁定）

Genesis 2:1–3 开启 Day 1 结束时的主要圣经阅读。
阅读和可选日志之后，玩家在飞船主界面选择 **REST**。

**REST UI 和视觉规则（已锁定，不可违反）：**

✅ 允许的：
- 飞船里的温暖感
- 减少的系统噪音（UI 元素变少或变暗）
- 动画速度放慢
- 这些元素用视觉和感受传达安息的含义

❌ 绝对不允许的：
- 把按钮标记为"第七天"或"Seventh Day"
- 保留为 **REST**（仅此标签）
- 颁发安息日徽章或完成奖励
- 通过 ARCHIVIST 对话解释安息日
- 展示"第 7/7 天完成"类似的进度
- 创造第七块石板（Tablet VII 不存在）

**安息是行为，不是收藏品。玩家通过选择它来体验它。**

---

# 五个线索的视觉对比（Day 1 → Day 2）

现在重新框架为 Tablets I–V 的环境证据（M04-A）：

| 线索 / Tablet | Day 1（死） | Day 2（活） |
|---|---|---|
| 石化的花（Tablet III 周边） | 灰色、僵硬、保存过度 | 颜色鲜艳、花瓣舒展 |
| 水渠（Tablet II 位置） | 干涸、裂纹、有尘 | 清水流动、有光的折射 |
| 植被残骸（Tablet III 区域） | 枯黄、倒伏 | 翠绿挺立、摇动 |
| 空巢/化石（Tablet V 周边） | 空巢、枯枝 | 活鸟归巢、羽毛、声音 |
| 石质结构（已整合进各 Tablet） | 用途不明、被植物覆盖 | 结构清晰、揭示原来的功能 |

**这个前后对比是 Chapter 1 最重要的视觉情感时刻。Tablets 是这个对比的叙事锚点。**

---

# 亚当 & 夏娃视觉（已锁定方向）

- 遥远
- 沉默
- 半透明（不完全实体）
- 不完整（像档案数据的投影）
- 原型式（不要过度具体化成某一种族或外貌）

**他们是记忆的影子，不是真实的人物角色。**

不要让他们说话或做复杂的动作。他们的存在本身就是叙事。

---

# 腐败序列视觉（已锁定方向）

不是爆炸。不是恐怖片。

**是系统崩溃的样子：**
- 花消失（不是燃烧，是像数据被删除）
- 河流分段消失
- 树开始闪烁
- 人形图像撕裂成 cyan 几何体
- 天堂的颜色和废墟的颜色开始重叠
- Cyan 重建结构暴露在原本有机的表面之下

感觉：**真实与模拟之间的边界正在消失。**

系统文字：

```
ARCHIVE INTEGRITY FAILURE
SOURCE DATA CORRUPTED
RECONSTRUCTION UNSTABLE
→ RECONSTRUCTION TERMINATED
```

---

# 芽的视觉（已锁定，最重要）

这是 Chapter 1 最后的视觉时刻。

**芽的视觉规则：**
- 没有 Cyan 色
- 没有全息感
- 没有扫描线
- 没有闪烁
- 没有粒子特效

**只是：**
一株真实的、有机的小芽，安静地从地面长出来。

它的存在本身就是异常。它不需要特效来强调这一点。

**周围的环境是废墟。它是唯一真实活着的东西。**

扫描仪读数：

```
ORGANIC STATUS: VIABLE
CELLULAR ACTIVITY: ACTIVE
SOURCE: UNKNOWN
```

---

# 音乐视觉配合（方向参考）

## "After the Double Sunrise" 音效 / 氛围
用于：主菜单、加载、太空旅行、行星接近
不适合：卧室、灵修时间

## "Room with a Galaxy View" 氛围
用于：卧室、休息、河边、水井、平静的洞穴、反思空间

这可能成为：**休息 / 反思的视觉动机**

---

# 遗物档案视觉系统

## 原则
- 每个重要章节最多 1–2 件遗物
- 不要制造收集品杂物
- 遗物不是武器、数值道具、或增益物品

**遗物是：旅程的物理记忆。**

## 档案展示
遗物应该有物理展示空间（不只是菜单列表）。

随着游戏进行，它们**在视觉上积累**——飞船里的遗物档案空间慢慢被填满。

这个视觉变化是 ARCHIVIST 成长的物理记录。

## 第一件遗物 — 古老种子

```
RELIC 01
ANCIENT SEED
ORIGIN: EDEN
VIABILITY AT RECOVERY: 0.03%
```

视觉质感：不是完美的、光滑的宝石。是一颗看起来非常古老、非常脆弱、但仍然存在的种子。

---

# 当前 Godot 实现状态

## 已通过视觉验证
- 废墟伊甸园分层视差背景（parallax）
- eden_far.png / eden_mid.png / eden_foreground.png 等层次
- ARCHIVIST 角色（astronaut.gd）
- Eden Spike 场景（eden_spike.tscn）

## 待实现的视觉系统
- Six Creation Tablet 物理外观（Claude Visual Master 最终审查后方可实现）
- 活着的伊甸园六运动恢复（需要新的资产和过渡动画）
- Tablet IV 天体节律过渡（极慢色温变化）
- Tablet V 水中隐含生命（水面扰动/折射）
- 飞船内部完整空间设计
- 扫描仪 UI（Cyan 系，极简）
- AGAPE Gold 色彩变化
- 遗物档案展示空间
- 芽的出现（无特效，纯有机质感）
- REST 视觉状态（温暖、减少噪音、动画减缓）

---

# 视觉决定的过滤问题

在做任何视觉决定之前，问：

1. **这在视觉上是否让 ARCHIVIST 感觉渺小、世界感觉宏大？**
2. **这是否服务了"谜保留"的原则——不解释太多，让玩家感受？**
3. **这是否体现了神的 AGAPE——即使在废墟里，也有光；即使系统崩溃了，也有一株芽？**
4. **Gold / 有机色调是否被克制地使用，保持它的重量？**
5. **（M04-A 新增）这块 Tablet 或恢复运动，是否在视觉上诚实地反映了"废墟 → 记忆" 而不是"发现 → 奖励"？**

全部是：保留。任何一个否：重新考虑。

---

# 这个游戏的视觉不是

- 不是黑暗的赛博朋克
- 不是明亮的卡通风格
- 不是写实主义照片质感
- 不是恐怖游戏
- 不是 boss 战游戏的风格

**它是：安静的、宏大的、有诗意的、带着希望的。**

---

*这份文件是视觉 canon。*
*当你不确定一个视觉方向是否正确——用五条过滤问题检验。*
*当你想改变任何已锁定的视觉元素——先问创作者。*
*M04-A 的六块 Creation Tablets 视觉 canon 由 Claude Visual Master 拥有。Codex 使用占位符，不声明最终视觉。*
*所有视觉决定必须服务于同一个脊梁：神在人类千百次选择离开之后，仍然选择留下。那就是 AGAPE。*
