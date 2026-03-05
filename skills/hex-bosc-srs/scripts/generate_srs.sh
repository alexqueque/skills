#!/bin/bash

# BOSC SRS Generator Script
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
prompt_input "目标用户:" TARGET_USERS true

OUTPUT_FILE="${REQ_NAME// /_}_SRS.md"

# Generate SRS from template
cat > "$OUTPUT_FILE" << EOF
# 上海银行（BOSC）业务需求书: $REQ_NAME

**状态:** Draft
**编写者:** $(whoami)
**日期:** $(date +%Y-%m-%d)

---

## 1. 文档更改记录
| 版本号 | 修改日期 | 更改内容 | 修改人 |
|---|---|---|---|
| V1.0 | $(date +%Y-%m-%d) | 初始版本 | $(whoami) |

---

## 2. 需求概述

### 2.1 需求背景
$BACKGROUND

### 2.2 需求目标
[明确可量化的后评估指标。]

### 2.3 需求分类与价值评估
| 需求分类 | 价值评估项 | 度量指标 | 计算口径 |
|---|---|---|---|
| 业务功能 | 业务创利 | 存贷增量 | [填写] |
| 风险合规 | 风险监控率 | 合规审核通过率 | [填写] |

---

## 5. 功能详述

### 5.1 核心功能: $REQ_NAME
- **用户信息**：$TARGET_USERS
- **发起渠道**：手机银行/网银/柜面
- **功能概述**：[补充描述]
- **控制逻辑**：
  | 流程环节 | 业务规则说明 | 异常处理/特殊说明 |
  |---|---|---|
  | [环节1] | [规则] | [处理] |

---

## 6. 关联影响分析
[请参考 srs_template.md 完善会计、监管、数据应用影响分析]

EOF

echo -e "${GREEN}✓ SRS 框架生成成功！${NC}"
echo -e "输出文件: ${BLUE}$OUTPUT_FILE${NC}"
echo ""
echo -e "${YELLOW}后续步骤:${NC}"
echo "  1. 完善各章节具体内容"
echo "  2. 详细列出输入输出要素"
echo "  3. 运行验证: scripts/validate_srs.sh $OUTPUT_FILE"
