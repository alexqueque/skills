#!/bin/bash

# BOSC SRS Validation Script
# Checks completeness and quality for Bank of Shanghai Requirements

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
check_section "文档更改记录" "##.*文档更改记录" true
check_section "需求概述" "##.*需求概述" true
check_section "需求分类与价值评估" "###.*需求分类与价值评估" true
check_section "总体需求描述" "##.*总体需求描述" true
check_section "需求条目清单" "##.*需求条目清单" true
check_section "功能详述" "##.*功能详述" true
check_section "关联影响分析" "##.*关联影响分析" true

echo ""
echo -e "${BLUE}━━━ BOSC 特色检查 ━━━${NC}"
# Check for accounting requirements
if grep -qi "会计核算\|借贷\|中收" "$PRD_FILE"; then
    echo -e "${GREEN}✓${NC} 包含会计/核算分析"
    ((CHECKS_PASSED++))
else
    echo -e "${YELLOW}⚠${NC} 未明确会计/核算影响"
    ((WARNINGS++))
fi

# Check for regulatory requirements
if grep -qi "监管\|EAST\|报送\|征信" "$PRD_FILE"; then
    echo -e "${GREEN}✓${NC} 包含监管/报送分析"
    ((CHECKS_PASSED++))
else
    echo -e "${YELLOW}⚠${NC} 未明确监管/报送影响"
    ((WARNINGS++))
fi

# Check for audit logs
if grep -qi "审计\|日志\|操作日志" "$PRD_FILE"; then
    echo -e "${GREEN}✓${NC} 包含审计日志需求"
    ((CHECKS_PASSED++))
else
    echo -e "${RED}✗${NC} 缺失审计日志记录说明"
    ((ISSUES_FOUND++))
fi

# Check for placeholders
if grep -q "\[.*\]" "$PRD_FILE"; then
    echo -e "${YELLOW}⚠${NC} 发现占位符文本 [brackets] - 请填写完整"
    ((WARNINGS++))
fi

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
