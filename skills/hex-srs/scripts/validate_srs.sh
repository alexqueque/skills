#!/bin/bash

# Hex SRS Consistency Validator
set -e

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

FILE="$1"
if [ ! -f "$FILE" ]; then exit 1; fi

echo -e "${BLUE}>> 正在扫描 SRS 文档质量...${NC}"

check_content() {
    local name="$1"
    local pattern="$2"
    if grep -qi "$pattern" "$FILE"; then
        echo -e "${GREEN}✓${NC} $name"
    else
        echo -e "${RED}✗${NC} $name (缺失关键部分)"
    fi
}

check_content "功能需求 ID (Unique Labels)" "FR-\|Order.\|PER-\|SEC-"
check_content "非功能需求 (Quality Attributes)" "##.*Quality Attributes"
check_content "外部接口定义 (External Interfaces)" "##.*External Interface"
check_content "运行环境 (Operating Environment)" "OE-"
check_content "数据字典 (Data Dictionary)" "Data Dictionary"

echo -e "
${BLUE}质量检查: 确保没有使用模糊词汇（如：大致、应该、快速）。${NC}"
