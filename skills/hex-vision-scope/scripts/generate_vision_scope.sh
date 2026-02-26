#!/bin/bash

# Hex Vision Scope Generator (Expert Mode)
set -e

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${BLUE}╔════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║    Hex Vision Scope - Expert Generator ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════╝${NC}"

prompt_input() {
    local prompt="$1"
    local var_name="$2"
    echo -e "${YELLOW}${prompt}${NC}"
    read -r input
    eval "$var_name=\"$input\""
}

# 1. Basic Info
prompt_input "项目名称 (Project Name):" PROJECT_NAME
OUTPUT_FILE="vision_scope_${PROJECT_NAME// /_}.md"

# 2. Business Objectives (Deep Dive)
echo -e "${GREEN}>> 业务目标探讨 (Business Objectives)${NC}"
prompt_input "导致此项目的核心问题是什么？" BACKGROUND
prompt_input "如果项目成功，你最想看到哪个指标发生变化？(如: 降低成本20%)" BO_GOAL
prompt_input "目前的基准值是多少？" BO_PAST

# 3. Vision Statement (Structure)
echo -e "${GREEN}>> 愿景陈述 (Vision Statement)${NC}"
prompt_input "目标用户是谁？" V_FOR
prompt_input "解决了什么痛点？" V_WHO
prompt_input "相对于现有方案的最大优势是什么？" V_UNLIKE

# 4. Project Priorities
echo -e "${GREEN}>> 项目优先级 (Project Priorities)${NC}"
echo "请指定最重要的驱动因素 (Driver) (1:进度, 2:成本, 3:功能, 4:质量):"
read -r PRIORITY_CHOICE

case $PRIORITY_CHOICE in
    1) DRIVER="Schedule";;
    2) DRIVER="Cost";;
    3) DRIVER="Features";;
    4) DRIVER="Quality";;
    *) DRIVER="Features";;
esac

# Generate
cat > "$OUTPUT_FILE" << EOF
# Vision and Scope Document: $PROJECT_NAME

## 1. Business Requirements
### 1.1 Background
$BACKGROUND

### 1.3 Business Objectives
- **BO-1**: 实现 $BO_GOAL
  - **Past**: $BO_PAST
  - **Goal**: $BO_GOAL

### 1.5 Vision Statement
For $V_FOR
Who $V_WHO
The $PROJECT_NAME is a product
That solves $V_WHO
Unlike $V_UNLIKE
Our product provides a superior experience.

## 2. Scope and Limitations
### 2.1 Major Features
- [ ] FE-1: [待定义核心功能]

## 3. Business Context
### 3.2 Project Priorities
| Dimension | Constraint | Driver | Degree of Freedom |
|-----------|------------|--------|-------------------|
| Features  |            | $( [ "$DRIVER" == "Features" ] && echo "X" ) | |
| Quality   |            | $( [ "$DRIVER" == "Quality" ] && echo "X" ) | |
| Schedule  |            | $( [ "$DRIVER" == "Schedule" ] && echo "X" ) | |
| Cost      |            | $( [ "$DRIVER" == "Cost" ] && echo "X" ) | |
| Staff     |            | | |

EOF

echo -e "${GREEN}✓ 专家级文档初稿已生成: $OUTPUT_FILE${NC}"
