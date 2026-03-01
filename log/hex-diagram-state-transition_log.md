# hex-diagram-state-transition 修改日志

## 2026-03-01

- **通过图片测试验证并优化 `SKILL.md`**: `skills/hex-diagram-state-transition/SKILL.md`
  - 在 `Step 1: 收集上下文与需求 (Gather Context)` 增加了**处理图片输入 (Handling Image Inputs)** 的详细指引。要求模型仔细提取所有节点形状和文字、连线箭头及其标签文字、以及回退、异常等非快乐路径。同时要求提取图片中为了区分而使用的颜色、排版逻辑等。
  - 在 `Step 3` 和 `Examples` 的 Drawio MCP 提示词中，加入了描述节点背景色、形状，以及连线排版走向（如主体垂直、回退流程折线绕回等）的要求，确保后续借助 mcp-server 时可以产出更高还原度的 draw.io 图形。
  - 进行了实际的图片识别测试，生成了测试文件 `meal_order_state_transition_test.md`。
- **优化技能说明文档**: `skills/hex-diagram-state-transition/SKILL.md`
  - 增加并明确了 `Step 4: 将结果保存为本地 Markdown 文件 (Save to Local File)` 的强制要求。
  - 更新了示例以演示保存到本地 markdown 文件的具体内容格式和命名规范。
  - 在使用指南中补充了输出验证的注意事项，要求务必将结果写入磁盘并告知用户。
- **创建新技能目录**: `skills/hex-diagram-state-transition/`
- **创建技能说明文档**: `skills/hex-diagram-state-transition/SKILL.md`
  - 提取了《Software Requirements 3rd Edition》中关于状态流转图 (State-Transition Diagram) 和状态表 (State Table) 的理论依据。
  - 基于 `SoftwareRequirements_3rd/Hex-Diagram-StateTransition-example.md` 中关于餐饮订单状态流转 (Meal Order Status) 的范例，设计了标准的核心工作流。
  - 支持输出三种形态的图形格式：PlantUML 格式代码、Mermaid 格式代码、以及配合 `@next-ai-drawio/mcp-server@latest` 自动生成图表的 Drawio 提示词。
  - 定义了技能使用过程中的提问流程（如收集对象状态、转换事件、终止条件等）以及质量审查标准。