#!/bin/bash

# Hex Vision Scope Validation (Expert Version)
set -e

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

FILE="$1"
if [ ! -f "$FILE" ]; then exit 1; fi

echo -e "${BLUE}>> 正在根据《软件需求》标准验证文档...${NC}"

check_content() {
    local name="$1"
    local pattern="$2"
    if grep -q "$pattern" "$FILE"; then
        echo -e "${GREEN}✓${NC} $name"
    else
        echo -e "${RED}✗${NC} $name (缺失或格式不正确)"
    fi
}

check_content "愿景陈述 (For/Who/The/Unlike 结构)" "For.*Who.*The.*Unlike"
check_content "业务目标测量 (Scale/Meter/Goal)" "Scale\|Meter\|Goal"
check_content "项目优先级矩阵" "Dimension.*Constraint.*Driver"
check_content "利益相关者画像" "Stakeholder.*Attitudes.*Interests"
check_content "排除项 (Exclusions)" "Exclusions\|LI-"

echo -e "\n${BLUE}建议: 确保所有 BO (业务目标) 都有对应的 SM (成功指标)。${NC}"
