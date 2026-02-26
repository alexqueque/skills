#!/bin/bash

# Hex Use Case Generator
set -e

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${BLUE}╔════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║    Hex Use Case - Expert Generator     ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════╝${NC}"

prompt_input() {
    local prompt="$1"
    local var_name="$2"
    echo -e "${YELLOW}${prompt}${NC}"
    read -r input
    eval "$var_name="$input""
}

# 1. Basic Info
prompt_input "用例名称 (例如: Order a Meal):" UC_NAME
prompt_input "主要参与者 (Primary Actor):" PRIMARY_ACTOR
prompt_input "触发条件 (Trigger):" TRIGGER

OUTPUT_FILE="uc_$(echo "$UC_NAME" | tr ' ' '_' | tr '[:upper:]' '[:lower:]').md"

# Generate
cat > "$OUTPUT_FILE" << EOF
# Use Case: $UC_NAME

## 1. ID and Name
- **ID**: UC-[TBD]
- **Name**: $UC_NAME

## 3. Actors
- **Primary Actor**: $PRIMARY_ACTOR
- **Secondary Actors**: [待定义]

## 4. Description
[简要描述用户如何使用系统实现目标]

## 5. Trigger
$TRIGGER

## 6. Conditions
- **Preconditions**: 用户已登录
- **Postconditions**: 目标已达成，系统状态已更新

## 7. Flows
### 7.1 Normal Flow
1. 用户发起请求
2. 系统响应并验证
3. 系统执行核心逻辑
4. 系统显示成功结果

### 7.2 Alternative Flows
- **A-1 [名称]**: [描述]

### 7.3 Exceptions
- **E-1 [名称]**: [描述]

EOF

echo -e "${GREEN}✓ 用例草稿已生成: $OUTPUT_FILE${NC}"
echo -e "${YELLOW}建议下一步: 详细编写 Normal Flow 并寻找潜在的异常 E-1, E-2。${NC}"
