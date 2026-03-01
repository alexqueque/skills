#!/bin/bash

# 业务规则生成器脚本 (Hex-Business-Rules)
# 通过对话工作流帮助生成业务规则

set -e

# 颜色设置
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}╔════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║     业务规则生成器 - 交互模式          ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════╝${NC}"
echo ""

# 获取脚本目录
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILL_DIR="$(dirname "$SCRIPT_DIR")"

# 检查模板文件是否存在
TEMPLATE_FILE="$SKILL_DIR/references/business_rule_template.md"
if [ ! -f "$TEMPLATE_FILE" ]; then
    echo -e "${RED}✗ 错误: 业务规则模板文件未找到: $TEMPLATE_FILE${NC}"
    exit 1
fi

# 提示输入函数
prompt_input() {
    local prompt="$1"
    local var_name="$2"
    local required="$3"

    while true; do
        echo -e "${YELLOW}${prompt}${NC}"
        read -r input

        if [ -n "$input" ]; then
            eval "$var_name="$input""
            break
        elif [ "$required" != "true" ]; then
            eval "$var_name=''"
            break
        else
            echo -e "${RED}此字段为必填项。请输入值。${NC}"
        fi
    done
}

# 收集基本信息
echo -e "${GREEN}步骤 1: 基本背景信息${NC}"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

prompt_input "项目名称:" PROJECT_NAME true
prompt_input "业务领域 (例如: 电商, 医疗):" DOMAIN true
prompt_input "输出文件名 (默认: ${PROJECT_NAME// /_}_business_rules.md):" OUTPUT_FILE false

# 设置默认输出文件
if [ -z "$OUTPUT_FILE" ]; then
    OUTPUT_FILE="${PROJECT_NAME// /_}_business_rules.md"
    OUTPUT_FILE=$(echo "$OUTPUT_FILE" | tr '[:upper:]' '[:lower:]')
fi

echo ""
echo -e "${GREEN}步骤 2: 关键规则提取${NC}"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

prompt_input "请描述第一个业务规则 (定义):" RULE_DEF_1 true
prompt_input "规则类型 (事实/约束/操作启用器/推论/计算):" RULE_TYPE_1 true
prompt_input "规则来源 (例如: 经理, 政策文件):" RULE_SOURCE_1 true

# 生成基础业务规则文档
echo ""
echo -e "${BLUE}正在生成业务规则目录...${NC}"
echo ""

cat > "$OUTPUT_FILE" << EOF
# 业务规则目录: $PROJECT_NAME

**业务领域:** $DOMAIN
**作者:** $(whoami)
**日期:** $(date +%Y-%m-%d)
**版本:** 1.0

---

## 业务规则目录

| ID | 业务规则定义 | 规则类型 | 静态/动态 | 来源 |
|---|---|---|---|---|
| BR-1 | $RULE_DEF_1 | $RULE_TYPE_1 | [静态/动态] | $RULE_SOURCE_1 |
| BR-2 | [在此输入规则描述] | [类型] | [静态/动态] | [来源] |
| BR-3 | [在此输入规则描述] | [类型] | [静态/动态] | [来源] |

---

## 分类说明

业务规则根据其特性分为以下五类：

1. **事实 (Facts)**: 关于业务为真的陈述。
2. **约束 (Constraints)**: 对操作的限制。
3. **操作启用器 (Action Enablers)**: 条件触发的活动。
4. **推论 (Inferences)**: 基于数据的衍生事实。
5. **计算 (Computations)**: 定义计算逻辑的公式。

---

## 后续步骤

1. **验证原子性**: 确保每个规则 ID 对应一个独立、单一的规则。
2. **补充缺失规则**: 通过用户访谈、文档分析进一步补充。
3. **建立追踪关系**: 将这些规则与对应的功能需求关联。
4. **维护与更新**: 随着业务政策的变化，定期审查规则目录。

---

## 修改日志

| 日期 | 版本 | 修改人 | 修改内容 |
|---|---|---|---|
| $(date +%Y-%m-%d) | 1.0 | $(whoami) | 初始版本生成 |

EOF

echo -e "${GREEN}✓ 业务规则目录已成功生成！${NC}"
echo ""
echo -e "输出文件: ${BLUE}$OUTPUT_FILE${NC}"
echo ""
echo -e "${YELLOW}后续建议:${NC}"
echo "  1. 打开生成的文件，补全占位符"
echo "  2. 确保规则是原子的 (Atomic)"
echo "  3. 分享给利益相关者进行评审"
echo ""
echo -e "${GREEN}✓ 完成！${NC}"
