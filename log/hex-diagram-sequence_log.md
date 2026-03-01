# hex-diagram-sequence 修改日志

## 2026年3月1日
**修改内容:**
- 创建了 `skills/hex-diagram-sequence/` 目录结构。
- 新增 `skills/hex-diagram-sequence/SKILL.md`: 提供了基于 Hex 方法论（《软件方法》）生成和分析业务序列图的详细指令，定义了4大步骤（收集现状、绘制现状业务序列图、发现改进点、绘制改进业务序列图）。
- 新增 `skills/hex-diagram-sequence/references/hex_diagram_sequence_example.md`: 包含了给定的高水准 `华夏pms` PlantUML 业务序列图样例代码。
- 新增 `skills/hex-diagram-sequence/references/theory_business_sequence.md`: 浓缩了潘加宇书籍第4章的核心理论（如消息代表责任而非数据流，时间是外系统，4种改进模式等）。
- 新增 `skills/hex-diagram-sequence/scripts/generate_diagram.sh`: 提供通过终端对话辅助生成基础 PlantUML 模板的脚本。
- 新增 `skills/hex-diagram-sequence/scripts/validate_diagram.sh`: 提供检验图表中是否可能存在初级错误（如使用了“定时器”、“数据”流动或未定义纯手工对应的系统）的校验脚本。
- 赋予了上述两个 `.sh` 脚本可执行权限。