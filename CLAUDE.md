# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## 首要原则
- Always respond in Chinese-simplified.
- 每次修改后将修改的内容记录在log/xxx_log.md,xxx为主题名称；
- 每次沟通的内容记录在log/xxx_discussion.md,xxx为主题名称；

## Project Overview

**Skills Plugin & Marketplace for Claude Code** - A collection of 24 custom skills covering engineering, Apple development, product management, design, content, trading, database, QA, and educational domains.

## Installation Commands

```bash
# Install complete bundle (all 24 skills)
/plugin marketplace add jamesrochabrun/skills
/plugin install all-skills@skills-marketplace

# Install individual skills
/plugin install anthropic-architect@skills-marketplace
/plugin install hex-srs@skills-marketplace
/plugin install hex-use-case@skills-marketplace
/plugin install hex-vision-scope@skills-marketplace
# ... see marketplace.json for all 24 individual skills
```

## Project Structure

```
skills/
├── .claude-plugin/
│   ├── plugin.json          # Plugin metadata
│   └── marketplace.json     # Marketplace config (25 options: 1 bundle + 24 individual)
├── skills/                   # 24 skill directories
│   ├── hex-srs/
│   ├── hex-use-case/
│   ├── hex-vision-scope/
│   ├── anthropic-architect/
│   ├── swift-concurrency/
│   └── ... (20 more)
├── SoftwareRequirements_3rd/ # Karl Wiegers reference materials
├── README.md                 # Main documentation (55KB)
└── GEMINI.md                 # Project context
```

## Skill Structure

Each skill directory contains:
- `SKILL.md` - Main instruction file with YAML frontmatter
- `scripts/` - Shell automation scripts
- `references/` - Supplementary documentation

## Hex Series Skills (Latest)

Three skills based on Karl Wiegers' "Software Requirements" (3rd Edition):

| Skill | Purpose |
|-------|---------|
| `hex-vision-scope` | Vision and Scope documents - business requirements, stakeholders, success metrics |
| `hex-srs` | Software Requirements Specifications - functional/non-functional requirements |
| `hex-use-case` | Use Cases - user-system interaction scenarios |

**Workflow dependency**: `hex-vision-scope` → `hex-srs` → `hex-use-case`

## Key Conventions

- All skill docs use structured Markdown with YAML frontmatter
- Response language: Simplified Chinese (简体中文)
- Coding style: Immutable patterns, small files (<800 lines), high cohesion
- Error handling: Comprehensive try-catch with user-friendly messages
- Input validation: Zod schema validation

## Git Workflow

Commit message format: `<type>: <description>`
- Types: feat, fix, refactor, docs, test, chore, perf, ci

## Version

Current: 2.2.0 (see marketplace.json)
