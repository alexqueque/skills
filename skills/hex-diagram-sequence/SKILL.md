---
name: hex-diagram-sequence
description: Generate high-quality Business Sequence Diagrams (现状和改进业务时序图) based on Hex methodology. Use this skill when users want to model business processes, analyze current status, find improvement points, or design system interactions based on business models.
---

# Hex Business Diagram Sequence Generator

## Overview

Generate high-quality Business Sequence Diagrams (业务序列图) that accurately reflect the current business processes (现状业务序列图) and propose meaningful improvements (改进业务序列图) based on the Hex methodology (潘加宇《软件方法》). This skill helps analysts and developers clearly map out responsibilities among business workers (业务工人), business entities (业务实体), and external business actors (业务执行者).

## Core Workflow

When a user requests to create or analyze a business sequence diagram, follow this workflow:

### Step 1: Gather Context (现状梳理)

Collect essential information about the current business process:
- **Target Organization (目标组织)**: Which organization's process are we modeling?
- **Business Actors (业务执行者)**: Who is outside the organization interacting with it?
- **Business Workers (业务工人)**: Which human roles exist inside the organization?
- **Business Entities (业务实体)**: Which non-human intelligent systems (e.g., existing software, devices) are currently used?
- **Current Process (业务流程)**: What are the exact steps currently taken to complete the business use case?

**Crucial Rules for Current State (现状原则):**
- Do NOT mix imagined improvements into the current state.
- "Current state" does not mean "purely manual" (纯手工). Document existing systems.
- "Current state" does not mean "before our dev team arrived". It means the reality right now.
- Document how people *actually* work, not just what the formal "norm/specification" (规范) says.

### Step 2: Generate Current Business Sequence Diagram (现状业务序列图)

Create a PlantUML sequence diagram mapping the current state.
- **Messages represent responsibility allocation (消息代表责任分配)**, not data flow. A message from A to B means "A requests B to do something".
- **Maintain correct abstraction level (抽象级别)**: Model collaborations between systems/roles. Do not dive into database tables or internal software components.
- **Time is a special entity (时间是特殊的业务实体)**: If something happens periodically, use a "Time" entity sending a message to trigger it.
- **Proper responsibility allocation**: A non-intelligent object (like a paper form) cannot be on the lifeline; it's a message parameter. Word doesn't write a document, a person uses Word to write it.

### Step 3: Identify Improvement Patterns (寻找改进点)

Analyze the current state and apply the following improvement patterns:
1. **Logistics to Information Flow (物流变成信息流)**: Replace physical movement of objects/people with information exchange.
2. **Improve Information Transfer (改善信息流转)**: Introduce a system to mediate between multiple disconnected systems, saving human effort.
3. **Encapsulate Domain Logic (封装领域逻辑)**: Move decision-making, calculation, and complex logic from human brains (business workers) to software systems (business entities).
4. **Abu's Thinking Method (阿布思考法)**: Imagine an ideal solution with infinite resources (like a billionaire), then find a viable "knock-off" (山寨) using current tech.

### Step 4: Generate Improved Business Sequence Diagram (改进业务序列图)

Introduce the **Target System (待引入系统)** as a new Business Entity.
- Reroute messages to shift responsibilities to the target system.
- Ensure the new diagram clearly shows how the new system interacts with existing workers and entities.
- Identify **System Use Cases (系统用例)** from the messages pointing into the Target System.

## Output Format

Always output diagrams using `plantuml` code blocks. 
Reference `references/hex_diagram_sequence_example.md` for styling and structure conventions.

## Best Practices
- **Actors and Entities**: Use PlantUML `actor` for people and `entity` or `database` for systems.
- **Color Coding**: Apply colors to easily distinguish external actors, internal workers, existing systems, and the new system.
- **Business Notes**: Use `note right of` or `note over` to explain the business context or improvement points explicitly.
- **Focus on the Core Domain (核心域)**: Only include systems that are relevant to the core domain improvement. (e.g. usually don't need to model the email client if it's not the focus of improvement, unless it's critical).

## Resources
- **references/theory_business_sequence.md**: Detailed theoretical guidelines and common pitfalls.
- **references/hex_diagram_sequence_example.md**: A high-quality PlantUML example of a deployment sequence diagram.