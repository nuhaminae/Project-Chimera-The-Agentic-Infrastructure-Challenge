
# OpenClaw Integration Specification

## Overview

This document outlines how Project Chimera agents will publish their availability and status to the OpenClaw network. The goal is to enable coordination between autonomous agents by providing a standardised way to broadcast presence, health, and activity.

---

## 1. Purpose

- Allow Chimera agents to announce when they are online, idle, or busy.
- Provide a heartbeat mechanism so other agents can discover and trust availability.
- Enable OpenClaw to act as a registry for agent status, supporting collaboration across networks.

---

## 2. Status Format

Agents will publish status updates in JSON format:

```json
{
  "agent_id": "trend_fetcher_01",
  "role": "trend_fetcher",
  "status": "online",
  "last_update": "2026-02-06T04:35:00Z",
  "capabilities": ["fetch_trends", "analyse_engagement"],
  "uptime_seconds": 3600
}
```

### Fields

- `agent_id`: Unique identifier for the agent.
- `role`: Functional role (e.g., trend_fetcher, content_generator).
- `status`: Online, offline, idle, busy.
- `last_update`: Timestamp of the last status broadcast.
- `capabilities`: List of supported actions.
- `uptime_seconds`: How long the agent has been running.

---

## 3. Communication Protocol

- **Transport:** HTTPS POST requests to OpenClaw’s status endpoint.  
- **Frequency:** Every 5 minutes (heartbeat) or immediately upon status change.  
- **Authentication:** OAuth 2.0 bearer tokens issued by OpenClaw.  
- **Retries:** Exponential backoff if the network is unavailable.  

---

## 4. Discovery

- Agents query OpenClaw’s registry to discover other agents.  
- Registry returns a list of active agents with their roles and statuses.  
- Example query/response:

**Request:**

```json
{ "query": "available_agents", "role": "content_generator" }
```

**Response:**

```json
[
  {
    "agent_id": "content_gen_02",
    "status": "online",
    "last_update": "2026-02-06T04:30:00Z"
  }
]
```

---

## 5. Constraints

- Status updates must not exceed 1 KB per agent.  
- Agents must not broadcast sensitive data (only operational metadata).  
- Registry must enforce rate limits to prevent flooding.  
- All timestamps must be in UTC ISO‑8601 format.  

---

## 6. Future Extensions

- Add support for **event‑based triggers** (e.g., “agent completed task”).  
- Enable **encrypted peer‑to‑peer messaging** between agents via OpenClaw.  
- Provide **visual dashboards** for monitoring agent availability.  
