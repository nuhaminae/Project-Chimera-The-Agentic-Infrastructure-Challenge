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
- Enforce rules from `CLAUDE.md`.

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

---

## Sub‑Task B: Agent Skills (Runtime)

You need a `skills/` directory with a `README.md` defining at least 3 critical skills. These are runtime capabilities for Chimera.

Here’s a draft `skills/README.md`:

```markdown
# Chimera Agent Skills

## Overview
Skills are modular capability packages that Chimera agents use at runtime. Each skill defines its input/output contract but does not yet implement full logic.

---

## 1. skill_fetch_trends
**Purpose:** Retrieve trending topics from social platforms.

**Input (JSON):**
```json
{ "platform": "tiktok", "topic": "fashion" }
```

**Output (JSON):**

```json
{ "trend": "oversised jackets", "engagement_score": 0.87 }
```

---

## 2. skill_generate_content

**Purpose:** Generate influencer‑style media based on trends.

**Input (JSON):**

```json
{ "trend": "oversised jackets", "format": "video", "duration": 60 }
```

**Output (JSON):**

```json
{ "video_id": "vid_12345", "status": "generated" }
```

---

## 3. skill_analyse_engagement

**Purpose:** Track and analyse performance metrics of published content.

**Input (JSON):**

```json
{ "video_id": "vid_12345" }
```

**Output (JSON):**

```json
{ "views": 12000, "likes": 1500, "shares": 300, "engagement_rate": 0.15 }
```

---

## Future Skills

- `skill_transcribe_audio` (convert speech to text).  
- `skill_publish_openclaw` (broadcast agent status to OpenClaw).  
- `skill_sentiment_analysis` (analyse audience reactions).  
