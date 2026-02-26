#!/bin/bash

# Vision and Scope Validation Script
# Checks completeness and quality of Vision and Scope documents

set -e

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

if [ $# -lt 1 ]; then
    echo "Usage: $0 <vision_scope_file.md>"
    exit 1
fi

FILE="$1"

if [ ! -f "$FILE" ]; then
    echo -e "${RED}✗ Error: File not found: $FILE${NC}"
    exit 1
fi

echo -e "${BLUE}╔════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║    Vision and Scope Validation         ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════╝${NC}"
echo ""

ISSUES=0
CHECKS=0

check_section() {
    local name="$1"
    local pattern="$2"
    ((CHECKS++))
    if grep -q "$pattern" "$FILE"; then
        echo -e "${GREEN}✓${NC} $name section found"
    else
        echo -e "${RED}✗${NC} $name section missing"
        ((ISSUES++))
    fi
}

check_section "Business Requirements" "##.*Business Requirements"
check_section "Business Objectives" "###.*Business Objectives"
check_section "Vision Statement" "###.*Vision Statement"
check_section "Scope and Limitations" "##.*Scope and Limitations"
check_section "Major Features" "###.*Major Features"
check_section "Release Plan" "Release 1.*Release 2"
check_section "Stakeholder Profiles" "###.*Stakeholder Profiles"

echo ""
if [ $ISSUES -eq 0 ]; then
    echo -e "${GREEN}✅ Document structure is valid!${NC}"
    exit 0
else
    echo -e "${RED}❌ Found $ISSUES issues. Please check the document structure.${NC}"
    exit 1
fi
