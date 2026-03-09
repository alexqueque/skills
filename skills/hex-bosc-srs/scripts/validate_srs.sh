#!/bin/bash

# BOSC SRS Validation Script
# Checks completeness and quality for Bank of Shanghai Requirements (V4.8)

set -e

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

PRD_FILE="$1"

# Check if file exists
if [ ! -f "$PRD_FILE" ]; then
    echo -e "${RED}✗ Error: File not found: $PRD_FILE${NC}"
    exit 1
fi

echo -e "${BLUE}╔════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║      BOSC SRS 验证报告 (V4.8)          ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════╝${NC}"
echo ""
echo -e "文件: ${BLUE}$PRD_FILE${NC}"
echo ""

# Counters
ISSUES_FOUND=0
WARNINGS=0
CHECKS_PASSED=0

# Function to check section exists
check_section() {
    local section_name="$1"
    local section_pattern="$2"
    local required="$3"

    if grep -q "$section_pattern" "$PRD_FILE"; then
        echo -e "${GREEN}✓${NC} $section_name 章节已找到"
        ((CHECKS_PASSED++))
        return 0
    else
        if [ "$required" = "true" ]; then
            echo -e "${RED}✗${NC} $section_name 章节缺失 (必需)"
            ((ISSUES_FOUND++))
        else
            echo -e "${YELLOW}⚠${NC} $section_name 章节缺失 (推荐)"
            ((WARNINGS++))
        fi
        return 1
    fi
}

echo -e "${BLUE}━━━ 核心章节检查 ━━━${NC}"
check_section "需求背景" "##.*需求背景" true
check_section "需求目标" "##.*需求目标" true
check_section "总体需求描述" "##.*总体需求描述" true
check_section "需求条目清单" "##.*需求条目清单" true
check_section "功能详述" "#.*功能详述" true
check_section "关联影响" "#.*关联影响" true

echo ""
echo -e "${BLUE}━━━ 详细内容检查 ━━━${NC}"
check_section "业务功能需求模板" "###.*业务功能需求模板" true
check_section "输入输出要素" "###.*输入输出要素" true
check_section "流程埋点" "###.*流程埋点" true

echo ""
echo -e "${BLUE}╔════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║            验证结果汇总                ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════╝${NC}"
echo ""
echo -e "通过检查:  ${GREEN}$CHECKS_PASSED${NC}"
echo -e "警告项:    ${YELLOW}$WARNINGS${NC}"
echo -e "关键错误:  ${RED}$ISSUES_FOUND${NC}"
echo ""

if [ "$ISSUES_FOUND" -gt 0 ]; then
    echo -e "${RED}❌ 业务需求书验证失败${NC}"
    exit 1
else
    echo -e "${GREEN}✅ 业务需求书通过验证！${NC}"
    exit 0
fi
