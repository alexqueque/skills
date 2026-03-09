#!/bin/bash

# BOSC SRS Generator Script (V4.8)
# Interactive workflow for generating Requirements Documents

set -e

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}╔════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║    BOSC SRS 生成器 (V4.8) - 交互模式   ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════╝${NC}"
echo ""

# Function to prompt for input
prompt_input() {
    local prompt="$1"
    local var_name="$2"
    local required="$3"

    while true; do
        echo -e "${YELLOW}${prompt}${NC}"
        read -r input

        if [ -n "$input" ]; then
            eval "$var_name='$input'"
            break
        elif [ "$required" != "true" ]; then
            eval "$var_name=''"
            break
        else
            echo -e "${RED}此字段为必填项。${NC}"
        fi
    done
}

prompt_input "需求名称:" REQ_NAME true
prompt_input "需求背景 (简述):" BACKGROUND true
prompt_input "目标用户/客群:" TARGET_USERS true

OUTPUT_FILE="${REQ_NAME// /_}_SRS.md"

# Generate SRS from template
cat > "$OUTPUT_FILE" << EOF
# 需求概述

## 需求背景[必需]

$BACKGROUND

## 需求目标[必需]

[请根据价值评估项目写明度量指标和计算口径，明确线上化、数字化、智能化提升。]

## 总体需求描述[必需]

[建议以逻辑图+文字形式直观阐述本需求内容]

## 需求条目清单[必需]

| 序号 | 条目（功能/交易）名称 | 需求简述 | 新增/优化 | 意向系统 |
| :--- | :--- | :--- | :--- | :--- |
| 1 | $REQ_NAME | [简述] | 新增 | [系统] |

# 功能详述

## $REQ_NAME[必需]

### 业务功能需求模板

#### 用户信息

| 项目 | 内容 | 项目 | 内容 |
|:---|:---|:---|:---|
| **用户信息** | 行内/行外 | **用户数:** | ***人 |
| **渠道** | 手机银行/网银/柜面等 |

#### 功能概述

| 项目 | 内容 |
|:---|:---|
| **功能概述** | [补充具体功能概述] |

#### 控制逻辑

| 流程环节 | 业务规则 | 说明 |
|:---|:---|:---|
| | | |

### 输入输出要素/业务数据要素

| 交易名称 | 字段名 | 新增/修改 | 长度/精度/取值范围 | 输入方式 | 是否必输 | 默认值 | 下拉选项 |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| | | | | | | | |

# 关联影响

*关联影响分析表格[必需]

[请填写关联影响表格，描述会计核算、监管风险等影响]

EOF

echo -e "${GREEN}✓ SRS 框架生成成功！${NC}"
echo -e "输出文件: ${BLUE}$OUTPUT_FILE${NC}"
echo ""
echo -e "${YELLOW}后续步骤:${NC}"
echo "  1. 完善各章节具体内容"
echo "  2. 填写关联影响分析表"
echo "  3. 运行验证: scripts/validate_srs.sh $OUTPUT_FILE"
