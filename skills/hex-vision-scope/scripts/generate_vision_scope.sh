#!/bin/bash

# Vision and Scope Document Generator Script
# Interactive workflow for generating Vision and Scope Documents

set -e

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}╔════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║  Hex Vision Scope - Interactive Mode   ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════╝${NC}"
echo ""

# Get script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILL_DIR="$(dirname "$SCRIPT_DIR")"

# Check if template exists
TEMPLATE_FILE="$SKILL_DIR/references/vision_scope_template.md"
if [ ! -f "$TEMPLATE_FILE" ]; then
    echo -e "${RED}✗ Error: Vision Scope template not found at $TEMPLATE_FILE${NC}"
    exit 1
fi

# Function to prompt for input
prompt_input() {
    local prompt="$1"
    local var_name="$2"
    local required="$3"

    while true; do
        echo -e "${YELLOW}${prompt}${NC}"
        read -r input

        if [ -n "$input" ]; then
            eval "$var_name='$input'"
            break
        elif [ "$required" != "true" ]; then
            eval "$var_name=''"
            break
        else
            echo -e "${RED}This field is required. Please provide a value.${NC}"
        fi
    done
}

# Step 1: Basic Information
echo -e "${GREEN}Step 1: Basic Information${NC}"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

prompt_input "Project Name:" PROJECT_NAME true
prompt_input "Output Filename (default: vision_scope_${PROJECT_NAME// /_}.md):" OUTPUT_FILE false

if [ -z "$OUTPUT_FILE" ]; then
    OUTPUT_FILE="vision_scope_${PROJECT_NAME// /_}.md"
    OUTPUT_FILE=$(echo "$OUTPUT_FILE" | tr '[:upper:]' '[:lower:]')
fi

# Step 2: Business Requirements
echo ""
echo -e "${GREEN}Step 2: Business Requirements${NC}"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

prompt_input "Current Situation/Background:" BACKGROUND true
prompt_input "Business Opportunity:" OPPORTUNITY true
prompt_input "Key Business Objective (BO-1):" BO1 true
prompt_input "Vision Statement (For [users] who [need]...):" VISION true

# Step 3: Scope
echo ""
echo -e "${GREEN}Step 3: Scope and Features${NC}"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

prompt_input "Major Feature 1 (FE-1):" FE1 true
prompt_input "Limitations and Exclusions (LI-1):" LIMITATIONS false

# Generate Document
echo ""
echo -e "${BLUE}Generating Vision and Scope Document...${NC}"

cat > "$OUTPUT_FILE" << EOF
# Vision and Scope Document: $PROJECT_NAME

**Date:** $(date +%Y-%m-%d)
**Author:** $(whoami)

---

## 1. Business Requirements

### 1.1 Background
$BACKGROUND

### 1.2 Business Opportunity
$OPPORTUNITY

### 1.3 Business Objectives
- **BO-1**: $BO1

### 1.4 Success Metrics
- **SM-1**: [Placeholder Metric]

### 1.5 Vision Statement
$VISION

### 1.6 Business Risks
- **RI-1**: [Placeholder Risk]

### 1.7 Business Assumptions and Dependencies
- **AS-1**: [Placeholder Assumption]

## 2. Scope and Limitations

### 2.1 Major Features
- **FE-1**: $FE1

### 2.2 Scope of Initial and Subsequent Releases
| Feature | Release 1 | Release 2 | Release 3 |
|---------|-----------|-----------|-----------|
| FE-1    | Core Impl | Optimized | Fully Impl|

### 2.3 Limitations and Exclusions
- **LI-1**: $LIMITATIONS

## 3. Business Context

### 3.1 Stakeholder Profiles
| Stakeholder | Major Value | Attitudes | Major Interests | Constraints |
|-------------|-------------|-----------|-----------------|-------------|
| [Role]      | [Value]     | Receptive | Efficiency      | None        |

### 3.2 Project Priorities
| Dimension | Constraint | Driver | Degree of Freedom |
|-----------|------------|--------|-------------------|
| Features  |            | X      |                   |
| Quality   | X          |        |                   |

### 3.3 Deployment Considerations
[Placeholder Deployment Info]
EOF

echo -e "${GREEN}✓ Document generated successfully!${NC}"
echo -e "Output file: ${BLUE}$OUTPUT_FILE${NC}"
echo ""
chmod +x "$SCRIPT_DIR/validate_vision_scope.sh" 2>/dev/null || true
echo -e "${YELLOW}Next steps:${NC}"
echo "  1. Open $OUTPUT_FILE and fill in the placeholders."
echo "  2. Run validation: skills/hex-vision-scope/scripts/validate_vision_scope.sh $OUTPUT_FILE"
