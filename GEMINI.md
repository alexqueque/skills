# GEMINI.md - Project Context for Skills Plugin & Marketplace

## 首要原则
- Always respond in Chinese-simplified.
- 每次修改后将修改的内容记录在log/xxx_log.md,xxx为主题名称；
- 每次沟通的内容记录在log/xxx_discussion.md,xxx为主题名称；

## Project Overview
This repository is a **Claude Code Plugin & Marketplace** containing a collection of 24 specialized "skills" designed to provide Claude Code with domain-specific knowledge, workflows, and interactive tools.

- **Main Technologies:** Claude Code Plugin System, Markdown (for instructions), Shell Scripts (for automation).
- **Domains Covered:** AI Architecture, Prompt Engineering, Engineering (Git, LLM routing), Apple Development (Swift, SwiftUI), Product Management, Design, Content Writing, Trading, Database Querying, QA Testing, and Education (Math, Reading, LeetCode).

## Project Type
This is a **non-code-heavy project** (primarily instructions and automation scripts) organized as a Claude Code plugin collection.

## Directory Structure

- `.claude-plugin/`: Core configuration for the plugin and marketplace.
  - `plugin.json`: General metadata about the plugin.
  - `marketplace.json`: Comprehensive configuration exposing 25 installable options (1 bundle + 24 individual skills).
- `skills/`: The source of all specialized knowledge. Each subdirectory is a standalone "skill".
  - `[skill-name]/SKILL.md`: The primary instruction file for the skill.
  - `[skill-name]/references/`: Supplementary Markdown or text documentation.
  - `[skill-name]/scripts/`: Shell scripts providing interactive functionality.
- `SoftwareRequirements_3rd/`: Supplemental directory containing reference images/material (likely a third-party resource for requirements engineering).
- `README.md`: High-level user-facing documentation and skill index.
- `LICENSE`: MIT License information.

## Building and Running

### Installation
As a Claude Code plugin, the collection or individual skills are installed directly within Claude Code:

```bash
# To browse and install the bundle:
/plugin marketplace add jamesrochabrun/skills
/plugin install all-skills@skills-marketplace

# To install individual skills (e.g., anthropic-architect):
/plugin install anthropic-architect@skills-marketplace
```

### Usage
Once installed, skills are activated by their specific instructions or triggers within Claude Code. See `README.md` or individual `SKILL.md` files for trigger examples.

## Development Conventions

- **Skill Entry Point:** Every skill must have a `SKILL.md` file at its root.
- **Progressive Disclosure:** Large sets of information are often broken down into files within a `references/` directory and loaded only when relevant to the current task.
- **Automation:** Shell scripts are kept in a `scripts/` directory and are used for interactive workflows (e.g., `create_worktree.sh`, `generate_playground.sh`).
- **Standard Formatting:** All documentation is written in clear, structured Markdown with appropriate headers and code blocks.
- **Versioning:** The plugin and marketplace versions are managed in `.claude-plugin/plugin.json` and `.claude-plugin/marketplace.json`.
