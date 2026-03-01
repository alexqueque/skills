---
name: hex-diagram-state-transition
description: 帮助产品经理和研发工程师基于需求或图片生成高质量的状态流转图（State-Transition Diagram）。将结果输出到本地 Markdown 文件中，支持 PlantUML、Mermaid 代码，或生成用于 @next-ai-drawio/mcp-server 的 Drawio 提示词。
---

# Hex Diagram: State Transition

## Overview
本技能专门用于从业务需求（文本或视觉参考图）中提取对象或系统的状态及其转换关系，并产出高质量的**状态流转图（State-Transition Diagram）**。基于《Software Requirements 3rd Edition》的理论指导，本技能确保状态流转的严谨性、完整性和无歧义性。最终的成果必须保存为一个本地的 Markdown 文件。

## Core Workflow

### Step 1: 收集上下文与需求 (Gather Context)
首先，通过提问或分析用户提供的需求（或图片），识别关键对象及其生命周期。
**对于文本需求，关注以下关键问题：**
1. 我们正在分析的核心对象或系统是什么？（例如：订单、请假单、商品）
2. 该对象在整个生命周期中有哪些可能的**状态（States）**？
3. 触发状态发生改变的**事件（Events）**或**条件（Conditions）**是什么？
4. 是否存在特定的起点状态（Initial State）和终点状态（Termination States）？

**对于图片输入 (Handling Image Inputs)，执行细致的视觉分析：**
1. **节点提取**：提取所有形状（矩形、圆形等）及其内部文本，明确标出起点（通常是实心圆）和终点（通常是同心圆）。
2. **连线提取**：提取所有箭头及其上的标签文字（触发事件/条件），绝不能遗漏**回退路线**或**异常分支**（如拒绝、取消等跨越多个层级的连线）。
3. **视觉特征提取**：注意提取图中为了区分而使用的特定颜色或布局逻辑（如自上而下为主流程，侧边为异常流），以便在 Drawio 提示词中复现。

### Step 2: 状态表分析 (State Table Analysis) - 理论验证
为了确保没有遗漏任何状态转换，在脑海中或草稿中构建一个**状态表（State Table）**：
- 行和列代表所有状态。
- 检查从每一个状态（左侧行）到另一个状态（顶部列）的转换是否合法，并识别出触发该转换的事件。
- **注意**：终点状态（如已取消、已完成）通常不能再转换到其他状态。

### Step 3: 选择输出格式并生成图表 (Generate Diagram)
根据用户的偏好，生成以下一种或多种格式的文本内容：

#### Option A: PlantUML 代码
使用 `[*] --> State` 表示开始，`--> [*]` 表示结束的 PlantUML 代码。针对多行文字可以使用 `\n` 进行换行。

#### Option B: Mermaid 代码
使用 Mermaid 的 `stateDiagram-v2` 代码，适合在 Markdown 中直接预览。针对多行文字可以使用 `<br>` 进行换行。

#### Option C: Draw.io 提示词 (配合 MCP Server)
生成结构化的提示词，以便用户可以调用 `@next-ai-drawio/mcp-server` MCP 工具来自动生成并渲染 Drawio 图形。必须明确节点形状、颜色（若有）、连线标签、以及整体的排版布局建议。

### Step 4: 将结果保存为本地 Markdown 文件 (Save to Local File)
**【必须执行】** 不要仅仅在对话框中输出代码，你必须调用文件写入工具（如 `write_file` 或相关系统指令），将最终确认的需求描述、状态表（可选）以及生成的图表代码/提示词保存到本地工作区中。
- **文件命名建议**：`[对象名称]_state_transition.md` （例如 `meal_order_state_transition.md`）。
- **文件内容结构**：应包含标题、需求简述、状态列表、图表代码（包裹在对应的代码块中），以及必要的使用说明。

## 理论基础 (Theory & Best Practices)
来源于《Software Requirements 3rd Edition》：
- **状态流转图 (STD) 和状态表 (State Table)** 提供了关于对象或系统状态的简洁、完整、无歧义的表示。
- **组成元素**：
  1. **状态 (States)**：对象在某一时间点所处的状况。
  2. **转换 (Transitions)**：从一个状态到另一个状态的合法路径。
  3. **条件/事件 (Conditions/Events)**：触发状态改变的具体业务事件。
- **验证完整性**：可以借用状态表的矩阵思维，逐一验证“状态A”能否流转到“状态B”，以防遗漏。

## 示例 (Examples)

### 场景：餐饮订单状态流转 (Meal Order Status - Image Input)
**需求描述**：
通过分析原图，起始状态为未完成 (Incomplete)。用户取消或完成特定阶段后会扭转到各个子状态。最终将走向交付 (Delivered) 或取消 (Canceled)。包含一个拒绝接收导致的跨级回退流转。

**本地文件生成示例** (`meal_order_state_transition.md`):

```markdown
# 餐饮订单状态流转图 (Meal Order)

## 需求描述
根据提供的流转图示例，餐饮订单的状态生命周期及转移规则如下：
- 初始状态进入 **未完成 (Incomplete)**。
- 从 **未完成 (Incomplete)**:
  - 发生事件“System accepts completed order” -> 转移至 **已接受 (Accepted)**。
  - 发生事件“Patron cancels; do not charge” -> 转移至 **已取消 (Canceled)**。
- 从 **待送达 (Pending Delivery)**:
  - 发生事件“Meal Deliverer delivers meal” -> 转移至 **已送达 (Delivered)**。
  - 发生事件“Patron refuses to accept delivery” -> **回退至 已接受 (Accepted)**。
- **已取消 (Canceled)** 和 **已送达 (Delivered)** 为最终的终止状态。

## PlantUML 格式
\`\`\`plantuml
@startuml
hide empty description

[*] --> Incomplete

Incomplete --> Accepted : System accepts completed order
Incomplete --> Canceled : Patron cancels;\ndo not charge

Accepted --> Prepared : Cafeteria Staff prepares food
Accepted --> Canceled : Patron cancels;\ndo not charge

Prepared --> Pending Delivery : Cafeteria Staff requests delivery
Prepared --> Canceled : Patron cancels;\ncharge payment

Pending Delivery --> Delivered : Meal Deliverer delivers meal
Pending Delivery --> Accepted : Patron refuses to accept delivery

Delivered --> [*]
Canceled --> [*]

@enduml
\`\`\`

## Mermaid 格式
\`\`\`mermaid
stateDiagram-v2
    [*] --> Incomplete
    Incomplete --> Accepted : System accepts completed order
    Incomplete --> Canceled : Patron cancels;<br>do not charge
    Accepted --> Prepared : Cafeteria Staff prepares food
    Accepted --> Canceled : Patron cancels;<br>do not charge
    Prepared --> Pending Delivery : Cafeteria Staff requests delivery
    Prepared --> Canceled : Patron cancels;<br>charge payment
    Pending Delivery --> Delivered : Meal Deliverer delivers meal
    Pending Delivery --> Accepted : Patron refuses to accept delivery
    Delivered --> [*]
    Canceled --> [*]
\`\`\`

## Draw.io MCP 提示词
请使用 draw.io 生成一个状态流转图。包含以下节点和连接线：
- **节点**：起点（黑圆），终点（同心圆），以及 Incomplete, Accepted, Prepared, Pending Delivery, Delivered, Canceled（均为矩形，背景色可设为浅黄色）。
- **连线及标签**：
  - 起点 -> Incomplete
  - Incomplete -> Accepted，标签“System accepts completed order”
  - Pending Delivery -> Accepted，标签“Patron refuses to accept delivery”
  - ...其余连线描述...
请保持布局清晰，建议主体流程自上而下垂直排列，取消状态（Canceled）放置在右侧，回退流程（Pending Delivery -> Accepted）使用从左侧绕回的折线。
```

## 使用指南 (Usage Guidelines)
1. **输入明确**：如果用户的输入很模糊，请主动询问状态列表及其转移条件。如果输入的是图片，务必小心解析回退路线和异常事件。
2. **审查异常流**：除了“快乐路径（Happy Path）”，必须询问或在图中寻找是否存在回退、拒绝、取消等异常状态流转。
3. **保持内聚**：单一图表最好只描述**一个核心对象**的生命周期。如果是多个对象的复杂交互，考虑建议用户使用系统交互图或泳道图。
4. **输出验证**：务必确认最终产出已写入本地磁盘，并在对话中告知用户文件生成的具体路径。
