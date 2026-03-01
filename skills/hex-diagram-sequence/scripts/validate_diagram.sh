#!/bin/bash

# Validate Hex Diagram Sequence

set -e

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

if [ -z "$1" ]; then
    echo "Usage: $0 <markdown_file_with_plantuml>"
    exit 1
fi

DIAGRAM_FILE="$1"
if [ ! -f "$DIAGRAM_FILE" ]; then
    echo -e "${RED}Error: File $DIAGRAM_FILE not found.${NC}"
    exit 1
fi

echo -e "${BLUE}Validating $DIAGRAM_FILE...${NC}"

WARNINGS=0
ERRORS=0

if ! grep -q "@startuml" "$DIAGRAM_FILE"; then
    echo -e "${RED}✗ Missing @startuml tag${NC}"
    ((ERRORS++))
fi

if grep -q "\-\->" "$DIAGRAM_FILE" && grep -q "数据" "$DIAGRAM_FILE"; then
    echo -e "${YELLOW}⚠ Warning: Possible data flow instead of responsibility allocation detected. Messages should represent requests/actions, not just data transfers.${NC}"
    ((WARNINGS++))
fi

if grep -q "定时器" "$DIAGRAM_FILE"; then
    echo -e "${YELLOW}⚠ Warning: Found '定时器' (Timer). Consider using '时间' (Time) as a business entity instead.${NC}"
    ((WARNINGS++))
fi

if grep -q "纯手工" "$DIAGRAM_FILE"; then
    echo -e "${YELLOW}⚠ Warning: Ensure 'pure manual' isn't ignoring existing systems.${NC}"
    ((WARNINGS++))
fi

if [ $ERRORS -gt 0 ]; then
    echo -e "${RED}Validation Failed with $ERRORS errors and $WARNINGS warnings.${NC}"
    exit 1
elif [ $WARNINGS -gt 0 ]; then
    echo -e "${YELLOW}Validation Passed with $WARNINGS warnings.${NC}"
    exit 0
else
    echo -e "${GREEN}Validation Passed!${NC}"
    exit 0
fi