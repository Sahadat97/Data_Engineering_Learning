# 🏔️ Data Engineering Learning Journey

> A structured, hands-on learning repo documenting my path through modern Data Engineering —
> starting with **Snowflake**, expanding into the full DE stack.

[![Learning Status](https://img.shields.io/badge/status-actively%20learning-brightgreen)](.)
[![Started](https://img.shields.io/badge/started-April%202026-blue)](.)
[![Notion Notes](https://img.shields.io/badge/notes-Notion-black?logo=notion)](https://www.notion.so/sahadat97/Full-Stack-Data-Science-Roadmap-12625eb9f64380ec9642ea3ed7d24763)

---

## 👋 Why This Repo Exists

I'm building real, hands-on experience in Data Engineering by learning in public.
This repo contains my SQL scripts, Python experiments, mini-projects, and reflections
as I work through each tool and concept — starting with Snowflake.

📓 **Deep-dive notes, diagrams & reflections** → [Notion Knowledge Base](https://www.notion.so/sahadat97/Full-Stack-Data-Science-Roadmap-12625eb9f64380ec9642ea3ed7d24763)

---

## 🗺️ Learning Roadmap

### Phase 1 — Snowflake (Current)

📓 **All Snowflake notes in one place** → [Snowflake Notion Page](https://www.notion.so/sahadat97/Snowflake-1bc25eb9f64380aab556d5750e12e348)

| Week | Topic | Status |
|------|-------|--------|
| 1 | Architecture, Virtual Warehouses, Databases & Schemas | ✅ Done |
| 2 | Data Loading — COPY INTO, Stages, File Formats | ✅ Done |
| 3 | Semi-structured Data — VARIANT, FLATTEN, JSON | 🔄 In Progress |
| 4 | Time Travel, Fail-safe, Cloning | ⬜ Planned |
| 5 | Performance — Clustering, Result Cache, Query Profiling | ⬜ Planned |
| 6 | Snowpipe, Tasks, Streams (CDC) | ⬜ Planned |
| 7 | Snowpark (Python in Snowflake) | ⬜ Planned |
| 8 | RBAC, Data Sharing, Security Best Practices | ⬜ Planned |

### Phase 2 — Orchestration (Upcoming)
- [ ] Apache Airflow — DAGs, Operators, XComs
- [ ] dbt (data build tool) — Models, Tests, Documentation

### Phase 3 — Data Movement & Storage (Planned)
- [ ] Apache Kafka — Producers, Consumers, Topics
- [ ] Delta Lake / Iceberg — Table formats
- [ ] AWS S3 / Azure Blob — Cloud storage patterns

### Phase 4 — Capstone Project (Planned)
- [ ] End-to-end pipeline: ingestion → transformation → serving layer

---

## 📁 Repo Structure

```
data-engineering-journey/
│
├── snowflake/
│   ├── 01-basics/                  # Warehouses, databases, schemas
│   ├── 02-data-loading/            # Stages, COPY INTO, file formats
│   ├── 03-semi-structured/         # JSON, VARIANT, FLATTEN
│   ├── 04-time-travel/             # Time Travel & Fail-safe
│   ├── 05-performance/             # Clustering, caching, query profiling
│   ├── 06-streams-tasks/           # Snowpipe, Tasks, Streams
│   ├── 07-snowpark/                # Python in Snowflake
│   └── projects/                   # Mini end-to-end projects
│
├── airflow/                        # (Coming soon)
├── dbt/                            # (Coming soon)
├── kafka/                          # (Coming soon)
│
└── resources.md                    # Curated links, docs, courses
```

---

## ❄️ Snowflake — Key Concepts Covered

### Architecture
- Snowflake's **three-layer architecture**: Storage / Compute / Cloud Services
- **Virtual Warehouses** — sizing, auto-suspend, auto-resume
- **Multi-cluster warehouses** for concurrency scaling

### Data Loading
- Internal & External **Stages**
- **COPY INTO** with CSV, JSON, Parquet
- **File Format objects** and options

> More concepts added weekly. Follow along ⭐

---

## 🛠️ Tools & Stack

| Tool | Purpose | Level |
|------|---------|-------|
| Snowflake | Cloud Data Warehouse | 🔄 Learning |
| SQL | Query & transformation language | ✅ Comfortable |
| Python | Scripting & Snowpark | ✅ Comfortable |
| dbt | Data transformation framework | ⬜ Planned |
| Apache Airflow | Orchestration | ⬜ Planned |
| Apache Kafka | Streaming ingestion | ⬜ Planned |
| Git / GitHub | Version control & learning in public | ✅ Using |
| Docker | Containerisation & local dev environments | 🔄 Learning |
| GitHub Actions | CI/CD pipelines & workflow automation | 🔄 Learning |
| Terraform | Infrastructure as Code (IaC) | ⬜ Planned |
| Linux / Bash | Scripting & server operations | ⬜ Planned|
| Power BI | Dashboard building | ✅ Comfortable |

---

## 📓 Notion Knowledge Base

I maintain detailed notes alongside this repo — including:
- Concept explanations in my own words
- Diagrams & architecture sketches
- "Gotchas" and lessons learned
- Topic-by-topic summaries

👉 [Open Notion Notes](https://www.notion.so/sahadat97/Full-Stack-Data-Science-Roadmap-12625eb9f64380ec9642ea3ed7d24763)

---

## 📌 How I Learn (My Process)

1. **Read** official docs / watch a focused tutorial
2. **Write notes** in Notion — explain it like I'd teach it
3. **Code it** — reproduce the concept from scratch in this repo
4. **Reflect** — commit with a meaningful message describing what I learned
5. **Review** — revisit tricky concepts a week later

---

## 📬 Connect

If you're on a similar learning path, I'd love to connect.

- 💼 [LinkedIn](https://www.linkedin.com/in/mohammad-sahadat-hossain/)
- 📓 [Notion Notes](https://www.notion.so/sahadat97/Full-Stack-Data-Science-Roadmap-12625eb9f64380ec9642ea3ed7d24763)

---

*Updated regularly as I progress. Last updated:  29.04.  2026.*
