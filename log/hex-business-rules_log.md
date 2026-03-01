# hex-business-rules 修改日志 (Log)

## [2026-03-01]

### 新增 Skill: hex-business-rules
- **创建目录**: `skills/hex-business-rules/`, `skills/hex-business-rules/references/`, `skills/hex-business-rules/scripts/`。
- **创建文件**:
    - `skills/hex-business-rules/SKILL.md`: Skill 的主说明文档。
    - `skills/hex-business-rules/references/business_rule_taxonomy.md`: 业务规则分类说明（参考《软件需求（第3版）》第 9 章）。
    - `skills/hex-business-rules/references/business_rule_template.md`: 业务规则标准模板。
    - `skills/hex-business-rules/scripts/generate_rules.sh`: 交互式规则生成脚本。
- **权限管理**: 赋予 `generate_rules.sh` 执行权限。
- **分类依据**:
    - 事实 (Facts)
    - 约束 (Constraints)
    - 操作启用器 (Action Enablers)
    - 推论 (Inferences)
    - 计算 (Computations)
- **主要目标**: 帮助用户从模糊的需求中提取高质量、原子化的业务规则。
