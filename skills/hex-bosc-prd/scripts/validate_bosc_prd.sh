#!/bin/bash

# BOSC PRD 校验脚本
# 检查 PRD 文档是否符合上海银行 (BOSC) V4.8 业务功能类模板标准

set -e

# 颜色定义
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # 无颜色

if [ $# -lt 1 ]; then
    echo "用法: $0 <prd_file.md>"
    exit 1
fi

PRD_FILE="$1"

if [ ! -f "$PRD_FILE" ]; then
    echo -e "${RED}✗ 错误: 文件不存在: $PRD_FILE${NC}"
    exit 1
fi

echo -e "${BLUE}╔════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║       BOSC PRD (V4.8) 模板校验报告     ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════╝${NC}"
echo ""

# 计数器
ISSUES=0
WARNINGS=0
PASSED=0

check_section() {
    local name="$1"
    local pattern="$2"
    if grep -q "$pattern" "$PRD_FILE"; then
        echo -e "${GREEN}✓${NC} 发现部分: $name"
        ((PASSED++))
    else
        echo -e "${RED}✗${NC} 缺失关键部分: $name (必需)"
        ((ISSUES++))
    fi
}

echo -e "${BLUE}━━━ 核心章节完整性校验 ━━━${NC}"
check_section "需求背景" "## 需求背景"
check_section "需求目标" "## 需求目标"
check_section "总体需求描述" "## 总体需求描述"
check_section "需求条目清单" "## 需求条目清单"
check_section "用户信息" "#### 用户信息"
check_section "功能概述" "#### 功能概述"
check_section "控制逻辑" "#### 控制逻辑"
check_section "后端数据处理" "#### 后端数据处理"
check_section "业务数据要素表" "### 输入输出要素/业务数据要素"

echo ""
echo -e "${BLUE}━━━ 内容质量检测 ━━━${NC}"

# 检查占位符
if grep -q "【.*】\|\[.*\]" "$PRD_FILE"; then
    echo -e "${YELLOW}⚠${NC} 发现未填写的占位符 (【 】或 [ ])"
    ((WARNINGS++))
else
    echo -e "${GREEN}✓${NC} 未发现占位符"
    ((PASSED++))
fi

# 检查 Mermaid 流程图
if grep -q "```mermaid" "$PRD_FILE" || grep -q "graph TD" "$PRD_FILE"; then
    echo -e "${GREEN}✓${NC} 包含流程图"
    ((PASSED++))
else
    echo -e "${YELLOW}⚠${NC} 缺失流程图 (建议添加以描述复杂业务流程)"
    ((WARNINGS++))
fi

echo ""
echo -e "${BLUE}╔════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║               校验结果汇总             ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════╝${NC}"
echo ""
echo -e "通过检查:  ${GREEN}$PASSED${NC}"
echo -e "警告事项:  ${YELLOW}$WARNINGS${NC}"
echo -e "严重问题:  ${RED}$ISSUES${NC}"
echo ""

if [ "$ISSUES" -gt 0 ]; then
    echo -e "${RED}❌ 校验未通过：请根据上述提示补充缺失的章节。${NC}"
    exit 1
else
    echo -e "${GREEN}✅ 校验通过！文档符合 BOSC V4.8 核心模板标准。${NC}"
    exit 0
fi
