#!/bin/bash

# Hex SRS Generator
set -e

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${BLUE}╔════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║      Hex SRS - Expert Generator        ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════╝${NC}"

prompt_input() {
    echo -e "${YELLOW}$1${NC}"
    read -r input
    eval "$2="$input""
}

prompt_input "产品/系统名称:" PROD_NAME
prompt_input "当前 Release 版本 (例如: 1.0):" VERSION

FILENAME="srs_$(echo "$PROD_NAME" | tr ' ' '_' | tr '[:upper:]' '[:lower:]')_v${VERSION}.md"

# Generate
cat > "$FILENAME" << EOF
# Software Requirements Specification: $PROD_NAME

## 1. Introduction
### 1.1 Purpose
本文档描述了 $PROD_NAME $VERSION 版本的系统需求。

## 2. Overall Description
### 2.2 User Classes
- [ ] 定义关键用户群体

## 3. System Features
### 3.1 [核心功能名称]
#### 3.1.2 Functional Requirements
- **FR-1**: 系统应支持...

## 6. Quality Attributes
### 6.2 Performance
- **PER-1**: 在 100 用户并发时，平均响应时间应低于 2 秒。

EOF

echo -e "${GREEN}✓ SRS 基础文档已生成: $FILENAME${NC}"
