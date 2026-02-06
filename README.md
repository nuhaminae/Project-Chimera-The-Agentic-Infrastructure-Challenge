# Project Chimera: The Agentic Infrastructure Challenge

![CI/CD](https://img.shields.io/badge/CI-CD-blue)

## Overview

Project Chimera is an experimental Autonomous Influencer Network designed to explore how AI agents can generate, evaluate, and distribute content in alignment with formal specifications and governance policies. The project integrates **SpecKit scaffolding**, **custom skills**, and **AI review automation** to ensure that every deliverable is traceable to the system requirements specification (SRS) and free from common security vulnerabilities.

This repository demonstrates a full lifecycle setup:

- Specification and documentation of functional and technical requirements.
- Containerisation and automation with Docker and Makefile.  
- CI/CD pipeline and AI governance policy enforcement.  

---

## Key Features

- **Specification-Driven Development**  
  All skills and agents reference the `specs/` folder, ensuring traceability to the SRS.

- **SpecKit Native Agents & Prompts**  
  Provides scaffolding for analysis, planning, and implementation workflows without modification.

- **Containerisation & Automation**  
  Dockerfile and Makefile streamline environment setup and execution.

- **Continuous Integration (CI/CD)**  
  GitHub Actions workflow (`.github/workflows/main.yml`) runs tests automatically on every push.

- **AI Review Policy**  
  `.coderabbit.yml` enforces spec alignment and security checks (flags `eval`, `exec`, unsafe imports, and dependency CVEs).

- **Testing Framework**  
  Python tests in `tests/` validate skill interfaces and trend fetcher functionality.

---

## Table of Contents

- [Project Background](#project-background)  
- [Objectives](#objectives)  
- [Project Structure](#project-structure)  
- [Installation](#installation)  
- [Usage](#usage)  
- [Governance & Review](#governance--review)  
- [Contribution](#contribution)  
- [Project Status](#project-status)  

---

## Project Background

The Autonomous Influencer Network concept explores how AI agents can autonomously generate and distribute content while remaining aligned with human‑defined specifications. To ensure safety and reliability, the project integrates AI governance policies that enforce spec alignment and security checks at every stage of development.

---

## Objectives

1. **Specification Alignment**  
   - Document system requirements in `specs/`.  
   - Ensure all skills and agents reference the SRS.  

2. **Automation & Containerisation**  
   - Provide reproducible environments via Docker and Makefile.  
   - Automate setup scripts with PowerShell.  

3. **CI/CD & Governance**  
   - Implement GitHub Actions pipeline (`main.yml`).  
   - Enforce AI review policy with `.coderabbit.yml`.  

---

## Project Structure

```bash
PROJECT-CHIMERA-THE-...
├── .github/                         # GitHub metadata and SpecKit scaffolding
│   ├── agents/                      # SpecKit native agent definitions (not committed)
│   ├── prompts/                     # SpecKit native prompt definitions (not committed)
│   └── workflows/                   # CI/CD workflows
│       ├── main.yml
│       └── copilot-instructions.md
├── .pytest_cache/                   # Pytest cache (not committed)
├── .specify/                        # SpecKit metadata (not committed)
│   ├──memory/
│   │   └── constitution.md
│   ├──scripts/
│   │   └── powershell/
│   └── templates/                   # SpecKit templates (not committed)
├── .venv/                           # Virtual environment (not committed)
├── .vscode/
│   ├── mcp.json
│   └── settings.json
├── research/
│   └── tooling_strategy.md
├── skills/                          # Custom skill implementations
│   └── README.md
├── specs/                           # System requirements specifications
│   ├── _specs.md
│   ├── functional.md
│   ├── openclaw_integration.md
│   └── technical.md
├── tests/                           # Python test suite
│   ├── __pycache__/
│   ├── test_skills_interface.py
│   └── test_trend_fetcher.py
├── .coderabbit.yml                  # AI review policy
├── .gitignore
├── chimera.ps1                      # Setup script
├── CLAUDE.md
├── Dockerfile                       # Containerization
├── Makefile                         # Automation
├── mcp-connection.log
├── README.md                        # Project overview
└── requirements.txt                 # Python dependencies
```

---

## Installation

### Prerequisites

- Python 3.9+  
- Docker  
- Git  

### Setup

```bash
# Clone repo
git clone https://github.com/nuhaminae/Project-Chimera-The-Agentic-Infrastructure-Challenge
cd project-chimera

# Install dependencies
pip install -r requirements.txt

# Build Docker container
docker build -t chimera .

# Run container
docker run -it chimera
```

---

## Usage

1. **Run Skills**  
   Implement and test skills in `skills/`.  

2. **Execute Tests**

   ```bash
   pytest tests/
   ```

3. **CI/CD Pipeline**  
   Every push triggers GitHub Actions (`main.yml`) to run tests and enforce governance.  

### Docker Usage and Setup

Before running commands, ensure:

- **Docker Desktop** is installed and running.
- Dependencies are listed in `requirements.txt`.

**Windows (PowerShell)** Use the provided PowerShell script:

```powershell
# Build Docker image
.\chimera.ps1 setup

# Run tests (expected to fail until implementation)
.\chimera.ps1 test

# Check code for spec references
.\chimera.ps1 spec-check
```

**Linux / macOS** Use the Makefile:

```bash
# Build Docker image
make setup

# Run tests (expected to fail until implementation)
make test

# Check code for spec references
make spec-check
```

### Expected Behavior

- **Tests should fail** initially .  
- This confirms the TDD cycle: failing tests → implement skills → passing tests.  
- Containerisation ensures consistency across all environments.

---

## Governance & Review

- **Spec Alignment:**  
  Code in `skills/` and `agents/` must reference the SRS (`# Ref: specs section ...`).  

- **Security Vulnerabilities:**  
  `.coderabbit.yml` flags unsafe imports (`pickle`, `subprocess`) and patterns (`eval`, `exec`).  
  Dependencies in `requirements.txt` are scanned for CVEs.  

---

## Contribution

Contributions are welcome! Please fork the repository and submit a pull request.  
Do not modify SpecKit native files (`agents/`, `prompts/`).  
Focus contributions on `skills/`, `specs/`, `tests/`, and governance configs.  

![Video_Walkthrough](mproject_walkthrough.mp4)

---

## Project Status

The following tasks are complete:

- Specifications documented  
- Containerisation and automation implemented  
- CI/CD and AI governance configured  

The next phase will focus on implementing and iterating custom skills and agents to pass the test suite.
