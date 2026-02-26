#!/bin/bash

# Hex Use Case Validation
set -e

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

FILE="$1"
if [ ! -f "$FILE" ]; then exit 1; fi

echo -e "${BLUE}>> 正在验证用例质量...${NC}"

check_content() {
    local name="$1"
    local pattern="$2"
    if grep -q "$pattern" "$FILE"; then
        echo -e "${GREEN}✓${NC} $name"
    else
        echo -e "${RED}✗${NC} $name (缺失)"
    fi
}

check_content "正常路径 (Normal Flow)" "Normal Flow"
check_content "触发条件 (Trigger)" "Trigger"
check_content "参与者 (Primary Actor)" "Primary Actor"
check_content "前置条件 (Preconditions)" "Preconditions"
check_content "后置条件 (Postconditions)" "Postconditions"
check_content "异常处理 (Exceptions)" "Exceptions"

echo -e "
${BLUE}质量提示: 正常路径是否清晰区分了参与者动作和系统响应？${NC}"
