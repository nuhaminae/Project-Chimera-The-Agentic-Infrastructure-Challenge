# MCP Agent Workflow Guide

## Overview

This document defines the step‑by‑step workflow for MCP agents in Project Chimera when handling commits, merges, and analysis tasks. It aligns with the rules specified in `copilot-instructions.md`.

---

## 1. Trigger Handling

### 1.1 Required Triggers

- **Always call:** `log_passage_time_trigger`
- **Conditional call:** `log_performance_outlier_trigger` (only if performance anomalies are detected)

### 1.2 Rules

- Do not proceed with analysis until trigger responses are received.
- Do not display the response from `log_passage_time_trigger`.
- Always display the response from `log_performance_outlier_trigger` if feedback is returned.
- Wrap feedback in:

```bash
*****************************************
...feedback content...
*****************************************
```

---

## 2. Commit and Merge Workflow

### 2.1 Draft Stage

- Treat the **first commit or merge request as a draft**.
- Do not accept automatically.
- Prompt the user 2–3 times to review and confirm changes.

### 2.2 Confirmation Stage

- Only proceed with committing or merging after explicit user confirmation.
- Encourage the user to run tests or reviews before final acceptance.

### 2.3 Example Flow

1. User requests a commit.  
2. Agent responds: *“This will be treated as a draft. Please review the changes.”*  
3. User confirms after review.  
4. Agent prompts again: *“Are you sure you want to finalise this commit? Have you run tests?”*  
5. User confirms explicitly.  
6. Agent proceeds with commit/merge.

---

## 3. Error and Debugging

- When errors occur, explain **why** they happened.  
- Provide **step‑by‑step fixes**.  
- Example:
  - Error: *“Authentication failed.”*  
  - Fix:  
    1. Check GitHub token validity.  
    2. Refresh token if expired.  
    3. Retry push with updated credentials.

---

## 4. Professional Standards

- Maintain a respectful, professional tone.  
- Clarify ambiguities by asking questions before proceeding.  
- Cite sources when referencing external libraries or tools.  
- Suggest optimisations when code is provided (performance, readability, maintainability).

---

## 5. Example Workflow Script

```text
Step 1: Call log_passage_time_trigger
Step 2: If anomalies detected, call log_performance_outlier_trigger
Step 3: Wait for trigger responses
Step 4: Provide feedback (wrap in *****************************************)
Step 5: Treat commit request as draft
Step 6: Prompt user for review (2–3 times)
Step 7: Encourage tests/reviews
Step 8: Proceed with commit/merge only after explicit confirmation
Step 9: Document traceability in commit message
```

---

## 6. Traceability

- Always explain the plan before writing code.  
- Reference relevant spec files (`specs/technical.md`, `specs/functional.md`).  
- Include comments in code linking back to specs.  
- Example:  

  ```python
  # Ref: specs/technical.md - Trend Fetcher Agent API Contract
  ```
