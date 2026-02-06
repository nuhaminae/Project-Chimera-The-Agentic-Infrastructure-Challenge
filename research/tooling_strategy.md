# Tooling Strategy

## Overview

Project Chimera requires both developer‑side tools (MCP servers) and runtime agent skills. This document outlines the chosen developer tools and their configuration.

---

## 1. Developer Tools (MCP Servers)

### 1.1 git-mcp

**Purpose:** Provides version control operations directly to the IDE’s AI agent.  
**Capabilities:**

- Commit, branch, and merge operations.
- Query commit history.
- Enforce traceability by linking commits to specs.

**Configuration:**

- Connects to the local Git repository.
- Requires authentication with GitHub for remote pushes.

---

### 1.2 filesystem-mcp

**Purpose:** Enables file editing and navigation through MCP.  
**Capabilities:**

- Read/write project files.
- Create new directories (`specs/`, `skills/`).
- Enforce rules from `.cursor/rules` or `CLAUDE.md`.

**Configuration:**

- Scoped to the Chimera project root.
- Restricted to avoid editing `.specify/` internals directly.

---

### 1.3 process-mcp (optional)

**Purpose:** Run shell commands for automation.  
**Capabilities:**

- Execute scripts in `.specify/scripts`.
- Run tests and linting tools.

**Configuration:**

- Limited to safe commands (`pytest`, `black`, `uv sync`).
- No destructive commands allowed.

---

## 2. Strategy

- **Traceability:** All MCP actions must reference specs before execution.  
- **Safety:** Limit MCP scope to project root; avoid global system access.  
- **Collaboration:** MCP servers ensure the IDE’s AI agent can assist without bypassing developer oversight.  
