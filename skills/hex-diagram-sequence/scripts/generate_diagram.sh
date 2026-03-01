#!/bin/bash

# Hex Diagram Sequence Generator Script
# Interactive workflow for generating Business Sequence Diagrams

set -e

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}╔════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║  Hex Diagram Sequence - Generator Mode ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════╝${NC}"
echo ""

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

prompt_input "Target Organization (目标组织):" TARGET_ORG true
prompt_input "Business Process Name (业务流程名称):" PROCESS_NAME true
prompt_input "Diagram Type (现状/改进 - Current/Improved):" DIAGRAM_TYPE true
prompt_input "Output Filename (default: ${PROCESS_NAME// /_}_diagram.md):" OUTPUT_FILE false

if [ -z "$OUTPUT_FILE" ]; then
    OUTPUT_FILE="${PROCESS_NAME// /_}_diagram.md"
    OUTPUT_FILE=$(echo "$OUTPUT_FILE" | tr '[:upper:]' '[:lower:]')
fi

echo -e "${BLUE}Generating Template...${NC}"

cat > "$OUTPUT_FILE" << EOF
# ${TARGET_ORG} - ${PROCESS_NAME} (${DIAGRAM_TYPE})

```plantuml
@startuml ${PROCESS_NAME}
!theme toy
skinparam SequenceMessageAlignment right

' Actors and Entities
actor "业务执行者 (External)" as external #blue
actor "业务工人 (Internal)" as worker #red
entity "现有系统 (Existing System)" as system #green
' entity "待引入系统 (Target System)" as target #orange

' Flow
note right of external: Replace with actual business steps
external -> worker: 发起请求()
activate worker
worker -> system: 处理数据()
deactivate worker

@enduml
```
EOF

echo -e "${GREEN}✓ Template generated successfully at $OUTPUT_FILE!${NC}"