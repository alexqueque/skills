# hex-business-rules 沟通讨论记录 (Discussion)

## [2026-03-01]

### 主题: 创建 hex-business-rules Skill

**背景**:
用户要求仿照 `@skills/prd-generator/**` 创建一个新 Skill `hex-business-rules`。
该 Skill 需要基于《软件需求（第 3 版）》及其提供的 `Hex-Business-Rules.md` 范例生成高质量业务规则。

**主要讨论点**:
- **分类标准**:
    - 确定业务规则分类法为：事实 (Facts)、约束 (Constraints)、操作启用器 (Action Enablers)、推论 (Inferences) 和计算 (Computations)。
    - 这些分类直接来源于《软件需求（第 3 版）》第 9 章“Playing by the Rules”。
- **文件结构**:
    - 为了保持一致性，决定采用 `SKILL.md` + `references/` + `scripts/` 的结构。
    - 核心文件 `SKILL.md` 定义了发现（Discovery）、识别（Identify）、分类（Categorize）和验证（Validate）的工作流。
- **脚本实现**:
    - 编写了 `generate_rules.sh` 脚本，用于交互式收集基本项目信息及首条规则，自动生成 Markdown 文档。
- **关键原则**:
    - 强调“原子性 (Atomicity)”，即每个 ID 应仅包含一个独立的规则，避免规则过大。
    - 强调“可追踪性”，将业务规则与功能需求挂钩。

**最终决定**:
- 完成上述文件创建，并根据项目首要原则（GEMINI.md）使用中文简体进行响应，并将修改记录在 `log/` 目录下。
- 该 Skill 已准备就绪，可以帮助用户处理复杂的业务逻辑规则。
