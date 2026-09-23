# Skills catalog

A vetted list of installable AI skills, taken from the AGNT article "The 100 Best AI Agent Skills in 2026" (https://agnt.gg/articles/agents/100-best-ai-agent-skills) and checked on 2026-09-16.

**How the AI uses this file:** when a VA asks for something the AI cannot do well with what it has, it looks here, picks the matching skill, explains it to the VA in plain words, and installs it into `.claude/skills/` after the VA says yes. See `CLAUDE.md`, section "When you can't do something".

**Columns:** *VA relevance* is how useful the skill is for agency VA work (social media, web, GHL, admin). *Source* is where to get it. *In a collection* means the link is a big list and the skill must be found by name inside it.

**Validation summary:** 100 skills, 48 unique source links checked. 45 live, 3 dead, 1 repository archived. Star counts and last-update dates are from GitHub on the check date.

**Added since:** entries 101 onwards were added later, on request, and checked on the date shown in their row. Some bring their own installer — follow the notes next to them rather than the general steps at the bottom.

## Development & Coding

| # | Skill | What it does | VA relevance | Source | Status |
|---|---|---|---|---|---|
| 1 | Code Reviewer / Simplify | Runs a structured quality review pass over any code the agent writes or modifies. | Medium | [github.com/anthropics/skills](https://github.com/anthropics/skills) (in a collection) | OK, 176,643 stars, updated 2026-09-10 |
| 2 | Test-Driven Development (TDD) | Enforces a red-green-refactor workflow before any implementation code is written. | Low | [github.com/obra/superpowers](https://github.com/obra/superpowers) | OK, 287,459 stars, updated 2026-09-14 |
| 3 | Browser Use / Playwright Automation | Connects the agent to a headless browser instance. | High | [github.com/browser-use/browser-use](https://github.com/browser-use/browser-use) | OK, 114,790 stars, updated 2026-09-15 |
| 4 | MCP Builder | Guides creation of high-quality MCP (Model Context Protocol) servers for integrating external APIs and services with LLMs. | Low | [github.com/anthropics/skills/tree/main/skills/mcp-builder](https://github.com/anthropics/skills/tree/main/skills/mcp-builder) | OK, 176,643 stars, updated 2026-09-10 |
| 5 | Software Architecture | Implements design patterns including Clean Architecture, SOLID principles, Domain-Driven Design, and comprehensive software design best practices. | Low | [github.com/NeoLabHQ/context-engineering-kit](https://github.com/NeoLabHQ/context-engineering-kit) | OK, 1,702 stars, updated 2026-08-26 |
| 6 | Systematic Debugging | Provides a structured debugging methodology: reproduce, isolate, hypothesize, test, fix. | Low | [github.com/obra/superpowers](https://github.com/obra/superpowers) | OK, 287,459 stars, updated 2026-09-14 |
| 7 | Git Worktrees & Branch Management | Creates isolated git worktrees for feature work with smart directory selection. | Low | [github.com/obra/superpowers](https://github.com/obra/superpowers) | OK, 287,459 stars, updated 2026-09-14 |
| 8 | Subagent-Driven Development | Dispatches independent subagents for individual tasks with code review checkpoints between iterations. | Low | [github.com/NeoLabHQ/context-engineering-kit](https://github.com/NeoLabHQ/context-engineering-kit) | OK, 1,702 stars, updated 2026-08-26 |
| 9 | Prompt Engineering | Teaches well-known prompt engineering techniques and patterns, including Anthropic best practices, chain-of-thought reasoning, few-shot learning, and agent persuasion principles. | Low | [github.com/NeoLabHQ/context-engineering-kit](https://github.com/NeoLabHQ/context-engineering-kit) | OK, 1,702 stars, updated 2026-08-26 |
| 10 | Changelog Generator | Automatically creates user-facing changelogs from git commits by analyzing commit history and transforming technical commits into customer-friendly release notes. | Medium | [github.com/ComposioHQ/awesome-claude-skills](https://github.com/ComposioHQ/awesome-claude-skills) (in a collection) | OK, 75,190 stars, updated 2026-08-10 |
| 11 | PlanetScale Database Skills | Teaches agents deep context about serverless databases, branching workflows, schema design conventions, index optimization, and query performance. | Low | [github.com/planetscale/agent-skill](https://github.com/planetscale/agent-skill) | DEAD LINK |
| 12 | iOS Simulator | Enables AI agents to interact with iOS Simulator for testing and debugging iOS applications. | Low | [github.com/conorluddy/ios-simulator-skill](https://github.com/conorluddy/ios-simulator-skill) | OK, 1,253 stars, updated 2026-09-13 |
| 13 | PICT Test Case Design | Designs comprehensive test cases using Pairwise Independent Combinatorial Testing (PICT). | Low | [github.com/omkamal/pypict-claude-skill](https://github.com/omkamal/pypict-claude-skill) | OK, 95 stars, updated 2026-03-22 |
| 14 | LangSmith Fetch & Debug | Debugs LangChain and LangGraph agents by automatically fetching and analyzing execution traces from LangSmith Studio. | Low | [github.com/ComposioHQ/awesome-claude-skills](https://github.com/ComposioHQ/awesome-claude-skills) (in a collection) | OK, 75,190 stars, updated 2026-08-10 |
| 15 | Antigravity Awesome Skills Library | A community-maintained library of 1,234+ agentic skills compatible with every major AI coding assistant. | Low | [github.com/anthropics/skills](https://github.com/anthropics/skills) (in a collection) | OK, 176,643 stars, updated 2026-09-10 |
## Design & Frontend

| # | Skill | What it does | VA relevance | Source | Status |
|---|---|---|---|---|---|
| 16 | Frontend Design | Anthropic's official skill that breaks the "distributional convergence" pattern — where every AI-generated UI looks the same (Inter font, purple gradient, minimal animations). | High | [github.com/anthropics/skills/blob/main/skills/frontend-design](https://github.com/anthropics/skills/blob/main/skills/frontend-design) | OK, 176,643 stars, updated 2026-09-10 |
| 17 | Web Artifacts Builder | Suite of tools for creating elaborate, multi-component HTML artifacts using React, Tailwind CSS, and shadcn/ui components. | Medium | [github.com/anthropics/skills/tree/main/skills/web-artifacts-builder](https://github.com/anthropics/skills/tree/main/skills/web-artifacts-builder) | OK, 176,643 stars, updated 2026-09-10 |
| 18 | D3.js Visualization | Teaches agents to produce D3 charts, interactive data visualizations, treemaps, force-directed graphs, and custom SVG layouts. | Medium | [github.com/chrisvoncsefalvay/claude-d3js-skill](https://github.com/chrisvoncsefalvay/claude-d3js-skill) | OK, 230 stars, updated 2025-10-18 |
| 19 | Canvas Design | Creates beautiful visual art in PNG and PDF formats using design philosophies and aesthetic principles. | High | [github.com/anthropics/skills/tree/main/skills/canvas-design](https://github.com/anthropics/skills/tree/main/skills/canvas-design) | OK, 176,643 stars, updated 2026-09-10 |
| 20 | Theme Factory | Applies professional font and color themes to artifacts including slides, docs, reports, and HTML landing pages. | Medium | [github.com/ComposioHQ/awesome-claude-skills](https://github.com/ComposioHQ/awesome-claude-skills) (in a collection) | OK, 75,190 stars, updated 2026-08-10 |
| 21 | Brand Guidelines | Applies specific brand colors, typography, spacing rules, and design standards to any artifact the agent creates. | High | [github.com/anthropics/skills/tree/main/skills/brand-guidelines](https://github.com/anthropics/skills/tree/main/skills/brand-guidelines) | OK, 176,643 stars, updated 2026-09-10 |
| 22 | Excalidraw Diagram Generator | Generates production-quality architecture diagrams, system designs, and data flow visualizations from natural language. | Medium | [github.com/coleam00/excalidraw-diagram-skill](https://github.com/coleam00/excalidraw-diagram-skill) | OK, 4,791 stars, updated 2026-03-01 |
| 23 | Frontend Slides | Creates animation-rich HTML presentations from scratch or by converting PowerPoint files. | Medium | [github.com/zarazhangrui/frontend-slides](https://github.com/zarazhangrui/frontend-slides) | OK, 29,395 stars, updated 2026-06-23 |
| 101 | Taste Skill (anti-slop web design) | Stops web pages coming out looking like generic AI templates. Reads the brief first, picks a deliberate design direction, then builds. Best for landing pages, portfolios and redesigns — not dashboards or data tables. | High | [github.com/Leonxlnx/taste-skill](https://github.com/Leonxlnx/taste-skill) | OK, 89,229 stars, updated 2026-09-22, MIT |
| 102 | Taste Skill — Redesign | Upgrades an existing website. Audits what is there, points out the generic bits, and lifts the quality without breaking what works. | High | [github.com/Leonxlnx/taste-skill](https://github.com/Leonxlnx/taste-skill) (in a collection) | OK, same repo, updated 2026-09-22 |
| 103 | Taste Skill — Brand Kit | Builds brand-guideline boards, logo systems and identity decks as finished images. | High | [github.com/Leonxlnx/taste-skill](https://github.com/Leonxlnx/taste-skill) (in a collection) | OK, same repo, updated 2026-09-22 |

### Taste Skill — how to install it (for the AI)

This one does not install like the others. It has its own installer, and the repository
holds fourteen related skills, so install only the one that fits the job:

```bash
npx skills add https://github.com/Leonxlnx/taste-skill --skill "design-taste-frontend"
```

Other install names in the same repository: `redesign-skill` for improving an existing
site, `brandkit` for brand boards and identity decks, `minimalist-skill` and
`brutalist-skill` for a specific look. Leaving off `--skill` installs all fourteen, which
is usually more than anyone needs — pick one.

Checked on 2026-09-22: live, MIT licensed, actively maintained.

## Data & Analytics

| # | Skill | What it does | VA relevance | Source | Status |
|---|---|---|---|---|---|
| 24 | Agent-SQL-Pro / Natural Language to SQL | Turns natural language into complex SQL queries with support for PostgreSQL, MySQL, and Snowflake. | Low | [www.getagentskills.com/](https://www.getagentskills.com/) | OK |
| 25 | CSV Data Summarizer | Automatically analyzes CSV files and generates comprehensive insights with visualizations. | High | [github.com/coffeefuelbump/csv-data-summarizer-claude-skill](https://github.com/coffeefuelbump/csv-data-summarizer-claude-skill) | OK, 465 stars, updated 2025-10-16 |
| 26 | Deep Research | Executes autonomous multi-step research using multiple search engines and data sources. | High | [github.com/sanjay3290/ai-skills/tree/main/skills/deep-research](https://github.com/sanjay3290/ai-skills/tree/main/skills/deep-research) | OK, 424 stars, updated 2026-09-10 |
| 27 | PostgreSQL Database Connector | Executes safe read-only SQL queries against PostgreSQL databases with multi-connection support and defense-in-depth security. | Low | [github.com/sanjay3290/ai-skills/tree/main/skills/postgres](https://github.com/sanjay3290/ai-skills/tree/main/skills/postgres) | OK, 424 stars, updated 2026-09-10 |
| 28 | Valyu: Real-Time Web Search & Specialized Data | Connects agents to 36+ specialized data sources through a single API: SEC 10-K filings, PubMed, ChEMBL (2.5M bioactive compounds), clinical trials, FRED economic indicators, patent databases, and academic publishers. | Low | [github.com/valyuai/skills](https://github.com/valyuai/skills) | OK, 24 stars, updated 2026-01-21 |
| 29 | ChartGen Data Visualization | Enables agents to create charts, dashboards, and diagrams with natural language. | Medium | [chartgen.ai/product/openclaw-skill](https://chartgen.ai/product/openclaw-skill) | OK |
| 30 | Google Analytics Automation | Automates Google Analytics reporting: custom reports, dimension/metric queries, property management, and trend analysis. | Medium | [github.com/ComposioHQ/awesome-claude-skills](https://github.com/ComposioHQ/awesome-claude-skills) (in a collection) | OK, 75,190 stars, updated 2026-08-10 |
| 31 | Root Cause Tracing | When errors occur deep in execution chains, this skill traces back through the call stack to find the original trigger. | Low | [github.com/obra/superpowers](https://github.com/obra/superpowers) | OK, 287,459 stars, updated 2026-09-14 |
## Document Processing

| # | Skill | What it does | VA relevance | Source | Status |
|---|---|---|---|---|---|
| 32 | DOCX Editor | Full Microsoft Word document lifecycle: create, edit, analyze with tracked changes, comments, formatting preservation, and text extraction. | High | [github.com/anthropics/skills/tree/main/skills/docx](https://github.com/anthropics/skills/tree/main/skills/docx) | OK, 176,643 stars, updated 2026-09-10 |
| 33 | PDF Toolkit | Comprehensive PDF manipulation: extract text and tables, create new PDFs, merge/split documents, handle forms, add watermarks, encrypt/decrypt, extract images, and OCR scanned documents. | High | [github.com/anthropics/skills/tree/main/skills/pdf](https://github.com/anthropics/skills/tree/main/skills/pdf) | OK, 176,643 stars, updated 2026-09-10 |
| 34 | PPTX Creator | Create, edit, and analyze PowerPoint presentations with support for layouts, templates, charts, speaker notes, and automated slide generation. | High | [github.com/anthropics/skills/tree/main/skills/pptx](https://github.com/anthropics/skills/tree/main/skills/pptx) | OK, 176,643 stars, updated 2026-09-10 |
| 35 | XLSX Master | Comprehensive spreadsheet creation, editing, and analysis with support for formulas, formatting, data analysis, pivot tables, charts, and visualization. | High | [github.com/anthropics/skills/tree/main/skills/xlsx](https://github.com/anthropics/skills/tree/main/skills/xlsx) | OK, 176,643 stars, updated 2026-09-10 |
| 36 | Markdown to EPUB Converter | Converts markdown documents, chat summaries, and long-form content into professional EPUB ebook files with proper chapter structure, table of contents, and metadata. | Low | [github.com/smerchek/claude-epub-skill](https://github.com/smerchek/claude-epub-skill) | OK, 160 stars, updated 2025-10-18 |
| 37 | Article Extractor | Extracts full article text and metadata from web pages, stripping navigation, ads, and irrelevant content. | High | [github.com/michalparkola/tapestry-skills-for-claude-code](https://github.com/michalparkola/tapestry-skills-for-claude-code) | OK, 544 stars, updated 2026-03-11 |
| 38 | YouTube Transcript | Fetches transcripts from YouTube videos and prepares summaries, notes, or actionable content. | High | [github.com/michalparkola/tapestry-skills-for-claude-code](https://github.com/michalparkola/tapestry-skills-for-claude-code) | OK, 544 stars, updated 2026-03-11 |
## Content Creation & Writing

| # | Skill | What it does | VA relevance | Source | Status |
|---|---|---|---|---|---|
| 39 | Content Research Writer | Assists in writing high-quality content through a structured pipeline: research → outline → draft → citations → hook optimization → section-by-section feedback. | High | [github.com/ComposioHQ/awesome-claude-skills](https://github.com/ComposioHQ/awesome-claude-skills) (in a collection) | OK, 75,190 stars, updated 2026-08-10 |
| 40 | Twitter/X Algorithm Optimizer | Analyzes and optimizes tweets for maximum reach using Twitter's open-source algorithm insights. | High | [github.com/ComposioHQ/awesome-claude-skills](https://github.com/ComposioHQ/awesome-claude-skills) (in a collection) | OK, 75,190 stars, updated 2026-08-10 |
| 41 | SEO Content Agent | Generates SEO-optimized content including keyword research, meta descriptions, heading structure, internal linking recommendations, and content gap analysis. | High | [github.com/VoltAgent/awesome-openclaw-skills](https://github.com/VoltAgent/awesome-openclaw-skills) (in a collection) | OK, 52,606 stars, updated 2026-09-14 |
| 42 | Blog Writer | End-to-end blog post creation: topic ideation, outline generation, long-form drafting, image suggestions, and CTA optimization. | High | [github.com/VoltAgent/awesome-openclaw-skills](https://github.com/VoltAgent/awesome-openclaw-skills) (in a collection) | OK, 52,606 stars, updated 2026-09-14 |
| 43 | Meeting Insights Analyzer | Analyzes meeting transcripts to uncover behavioral patterns including conflict avoidance, speaking ratios, filler words, leadership style, and action item extraction. | High | [github.com/ComposioHQ/awesome-claude-skills](https://github.com/ComposioHQ/awesome-claude-skills) (in a collection) | OK, 75,190 stars, updated 2026-08-10 |
| 44 | Internal Communications | Professional internal communications toolkit: 3P updates, company newsletters, FAQs, status reports, project updates, and all-hands presentations using company-specific formats. | High | [github.com/anthropics/skills](https://github.com/anthropics/skills) (in a collection) | OK, 176,643 stars, updated 2026-09-10 |
| 45 | Academic Research Hub | Assists with planning and conducting academic research: literature reviews, methodology design, citation management, and paper structuring following academic conventions (APA, MLA, Chicago). | Medium | [github.com/VoltAgent/awesome-openclaw-skills](https://github.com/VoltAgent/awesome-openclaw-skills) (in a collection) | OK, 52,606 stars, updated 2026-09-14 |
| 46 | Tailored Resume Generator | Analyzes job descriptions and generates tailored resumes that highlight relevant experience, skills, and achievements to maximize interview chances. | High | [github.com/ComposioHQ/awesome-claude-skills](https://github.com/ComposioHQ/awesome-claude-skills) (in a collection) | OK, 75,190 stars, updated 2026-08-10 |
| 47 | Domain Name Brainstormer | Generates creative domain name ideas and checks availability across multiple TLDs including .com, .io, .dev, and .ai extensions. | Medium | [github.com/ComposioHQ/awesome-claude-skills](https://github.com/ComposioHQ/awesome-claude-skills) (in a collection) | OK, 75,190 stars, updated 2026-08-10 |
## Security & Compliance

| # | Skill | What it does | VA relevance | Source | Status |
|---|---|---|---|---|---|
| 48 | Shannon: Autonomous AI Pentester | An autonomous pen testing agent that runs against local/staging environments, executes real exploits across 50+ vulnerability types in 5 OWASP categories, and reports only confirmed vulnerabilities. | Low | [github.com/KeygraphHQ/shannon](https://github.com/KeygraphHQ/shannon) | OK, 48,055 stars, updated 2026-09-08 |
| 49 | FFUF Web Fuzzing | Integrates the ffuf web fuzzer for automated fuzzing tasks: directory discovery, parameter brute-forcing, authenticated fuzzing with raw requests, auto-calibration, and result analysis for vulnerability detection. | Low | [github.com/jthack/ffuf_claude_skill](https://github.com/jthack/ffuf_claude_skill) | OK, 211 stars, updated 2025-10-16 |
| 50 | Trail of Bits Security Skills | Security skills from the leading security research firm: static analysis with CodeQL/Semgrep, variant analysis, code auditing, and vulnerability detection. | Low | [github.com/trailofbits/skills](https://github.com/trailofbits/skills) | OK, 7,112 stars, updated 2026-09-15 |
| 51 | Computer Forensics | Digital forensics analysis and investigation techniques: evidence collection, timeline reconstruction, file system analysis, and chain-of-custody documentation. | Low | [github.com/mhattingpete/claude-skills-marketplace](https://github.com/mhattingpete/claude-skills-marketplace) (in a collection) | OK, 671 stars, updated 2026-07-25 |
| 52 | Threat Hunting with Sigma Rules | Uses Sigma detection rules to hunt for threats and analyze security events. | Low | [github.com/jthack/threat-hunting-with-sigma-rules-skill](https://github.com/jthack/threat-hunting-with-sigma-rules-skill) | DEAD LINK |
| 53 | Metadata Extraction & Analysis | Extracts and analyzes file metadata for forensic purposes: EXIF data from images, document properties, creation timestamps, author information, and modification histories. | Low | [github.com/mhattingpete/claude-skills-marketplace](https://github.com/mhattingpete/claude-skills-marketplace) (in a collection) | OK, 671 stars, updated 2026-07-25 |
| 54 | Agentic Security Audit | Comprehensive security review of agent deployments: prompt injection testing, tool poisoning detection, permission escalation checks, and data exfiltration prevention for multi-agent systems. | Low | [github.com/VoltAgent/awesome-openclaw-skills](https://github.com/VoltAgent/awesome-openclaw-skills) (in a collection) | OK, 52,606 stars, updated 2026-09-14 |
| 55 | Compliance & Regulatory Advisor | Automates regulatory compliance checking for financial services, healthcare, and data privacy (GDPR, HIPAA, SOC 2). | Low | [cloud.withgoogle.com/agentfinder/](https://cloud.withgoogle.com/agentfinder/) | OK |
## Business & Marketing

| # | Skill | What it does | VA relevance | Source | Status |
|---|---|---|---|---|---|
| 56 | Lead Research Assistant | Identifies and qualifies high-quality leads by analyzing your product, searching for target companies, and providing actionable outreach strategies with personalized messaging templates. | High | [github.com/ComposioHQ/awesome-claude-skills](https://github.com/ComposioHQ/awesome-claude-skills) (in a collection) | OK, 75,190 stars, updated 2026-08-10 |
| 57 | Competitive Ads Extractor | Extracts and analyzes competitors' ads from ad libraries to understand messaging, creative approaches, targeting strategies, and positioning that resonates with their audience. | High | [github.com/ComposioHQ/awesome-claude-skills](https://github.com/ComposioHQ/awesome-claude-skills) (in a collection) | OK, 75,190 stars, updated 2026-08-10 |
| 58 | HubSpot CRM Automation | Full HubSpot automation: contacts, deals, companies, tickets, email engagement, pipeline management, and workflow triggers. | High | [github.com/ComposioHQ/awesome-claude-skills](https://github.com/ComposioHQ/awesome-claude-skills) (in a collection) | OK, 75,190 stars, updated 2026-08-10 |
| 59 | Salesforce Automation | Automates Salesforce: custom objects, records, SOQL queries, bulk operations, report generation, and workflow automation. | Medium | [github.com/ComposioHQ/awesome-claude-skills](https://github.com/ComposioHQ/awesome-claude-skills) (in a collection) | OK, 75,190 stars, updated 2026-08-10 |
| 60 | Shopify E-Commerce Automation | Automates Shopify: products, orders, customers, inventory management, and GraphQL queries. | High | [github.com/ComposioHQ/awesome-claude-skills](https://github.com/ComposioHQ/awesome-claude-skills) (in a collection) | OK, 75,190 stars, updated 2026-08-10 |
| 61 | Stripe Payment Automation | Automates Stripe: charges, customers, products, subscriptions, refunds, invoice generation, and revenue reporting. | Medium | [github.com/ComposioHQ/awesome-claude-skills](https://github.com/ComposioHQ/awesome-claude-skills) (in a collection) | OK, 75,190 stars, updated 2026-08-10 |
| 62 | Mailchimp Email Marketing | Automates Mailchimp: audiences, campaigns, templates, segments, A/B testing, and performance reporting. | High | [github.com/ComposioHQ/awesome-claude-skills](https://github.com/ComposioHQ/awesome-claude-skills) (in a collection) | OK, 75,190 stars, updated 2026-08-10 |
| 63 | LinkedIn Automation | Automates LinkedIn: posts, profile optimization, company page management, image uploads, comment engagement, and connection outreach. | High | [github.com/ComposioHQ/awesome-claude-skills](https://github.com/ComposioHQ/awesome-claude-skills) (in a collection) | OK, 75,190 stars, updated 2026-08-10 |
| 64 | Brand Voice Profile | Analyzes existing content to extract a brand's unique voice, tone, vocabulary patterns, and writing style. | High | [github.com/VoltAgent/awesome-openclaw-skills](https://github.com/VoltAgent/awesome-openclaw-skills) (in a collection) | OK, 52,606 stars, updated 2026-09-14 |
## Productivity & Automation

| # | Skill | What it does | VA relevance | Source | Status |
|---|---|---|---|---|---|
| 65 | Google Workspace (GWS) Suite | Dynamically discovers all Google Workspace APIs (Gmail, Drive, Calendar, Docs, Sheets, Slides, Chat, Admin) and exposes them as a unified interface. | High | [github.com/googleworkspace/cli](https://github.com/googleworkspace/cli) | OK, 31,021 stars, updated 2026-09-14 |
| 66 | File Organizer | Intelligently organizes files and folders by understanding context, finding duplicates, suggesting better organizational structures, and batch renaming with consistent patterns. | High | [github.com/ComposioHQ/awesome-claude-skills](https://github.com/ComposioHQ/awesome-claude-skills) (in a collection) | OK, 75,190 stars, updated 2026-08-10 |
| 67 | Invoice Organizer | Automatically organizes invoices and receipts for tax preparation: reads files, extracts vendor/amount/date information, and renames consistently. | High | [github.com/ComposioHQ/awesome-claude-skills](https://github.com/ComposioHQ/awesome-claude-skills) (in a collection) | OK, 75,190 stars, updated 2026-08-10 |
| 68 | n8n Workflow Skills | Enables AI agents to understand and operate n8n automation workflows. | High | [github.com/haunchen/n8n-skills](https://github.com/haunchen/n8n-skills) | OK, 400 stars, updated 2026-09-13 |
| 69 | Kaizen Continuous Improvement | Applies continuous improvement methodology with multiple analytical approaches based on Japanese Kaizen philosophy and Lean methodology. | Medium | [github.com/NeoLabHQ/context-engineering-kit](https://github.com/NeoLabHQ/context-engineering-kit) | OK, 1,702 stars, updated 2026-08-26 |
| 70 | Calendar & Scheduling (Calendly/Cal.com) | Automates scheduling platforms: event types, bookings, availability windows, scheduling links, and calendar synchronization across Calendly and Cal.com. | High | [github.com/ComposioHQ/awesome-claude-skills](https://github.com/ComposioHQ/awesome-claude-skills) (in a collection) | OK, 75,190 stars, updated 2026-08-10 |
| 71 | Tapestry Knowledge Networks | Interlinks and summarizes related documents into knowledge networks. | Low | [github.com/michalparkola/tapestry-skills-for-claude-code](https://github.com/michalparkola/tapestry-skills-for-claude-code) | OK, 544 stars, updated 2026-03-11 |
| 72 | Ship-Learn-Next Feedback Loop | Iterates on what to build or learn next based on feedback loops. | Low | [github.com/michalparkola/tapestry-skills-for-claude-code](https://github.com/michalparkola/tapestry-skills-for-claude-code) | OK, 544 stars, updated 2026-03-11 |
| 73 | ADHD Founder Planner | A productivity system designed specifically for ADHD minds: body doubling support, task breakdown into micro-steps, time estimation with buffer zones, and distraction management protocols. | Low | [github.com/VoltAgent/awesome-openclaw-skills](https://github.com/VoltAgent/awesome-openclaw-skills) (in a collection) | OK, 52,606 stars, updated 2026-09-14 |
## Communication & Collaboration

| # | Skill | What it does | VA relevance | Source | Status |
|---|---|---|---|---|---|
| 74 | Gmail Automation | Full Gmail lifecycle: send/reply, search, labels, drafts, attachments, thread management, and scheduled sending. | High | [github.com/ComposioHQ/awesome-claude-skills](https://github.com/ComposioHQ/awesome-claude-skills) (in a collection) | OK, 75,190 stars, updated 2026-08-10 |
| 75 | Slack Automation | Automates Slack: messages, channels, search, reactions, threads, scheduling, and workflow triggers. | High | [github.com/ComposioHQ/awesome-claude-skills](https://github.com/ComposioHQ/awesome-claude-skills) (in a collection) | OK, 75,190 stars, updated 2026-08-10 |
| 76 | Discord Automation | Automates Discord: messages, channels, servers, roles, reactions, and community moderation. | Medium | [github.com/ComposioHQ/awesome-claude-skills](https://github.com/ComposioHQ/awesome-claude-skills) (in a collection) | OK, 75,190 stars, updated 2026-08-10 |
| 77 | Microsoft Teams Automation | Automates Teams: messages, channels, team creation, chat management, and meeting coordination. | Medium | [github.com/ComposioHQ/awesome-claude-skills](https://github.com/ComposioHQ/awesome-claude-skills) (in a collection) | OK, 75,190 stars, updated 2026-08-10 |
| 78 | Notion Automation | Automates Notion: pages, databases, blocks, comments, search, and property management. | High | [github.com/ComposioHQ/awesome-claude-skills](https://github.com/ComposioHQ/awesome-claude-skills) (in a collection) | OK, 75,190 stars, updated 2026-08-10 |
| 79 | Jira Automation | Automates Jira: issues, projects, boards, sprints, JQL queries, and workflow transitions. | Medium | [github.com/ComposioHQ/awesome-claude-skills](https://github.com/ComposioHQ/awesome-claude-skills) (in a collection) | OK, 75,190 stars, updated 2026-08-10 |
| 80 | NotebookLM Integration | Lets agents chat directly with Google NotebookLM for source-grounded answers based exclusively on uploaded documents. | High | [github.com/PleasePrompto/notebooklm-skill](https://github.com/PleasePrompto/notebooklm-skill) | ARCHIVED, 7,772 stars, updated 2026-09-10 |
| 81 | Outline Wiki Management | Search, read, create, and manage documents in Outline wiki instances (cloud or self-hosted). | Low | [github.com/sanjay3290/ai-skills/tree/main/skills/outline](https://github.com/sanjay3290/ai-skills/tree/main/skills/outline) | OK, 424 stars, updated 2026-09-10 |
## DevOps & Infrastructure

| # | Skill | What it does | VA relevance | Source | Status |
|---|---|---|---|---|---|
| 82 | GitHub Automation | Full GitHub lifecycle: issues, PRs, repos, branches, Actions, code search, release management, and automated code review. | Medium | [github.com/ComposioHQ/awesome-claude-skills](https://github.com/ComposioHQ/awesome-claude-skills) (in a collection) | OK, 75,190 stars, updated 2026-08-10 |
| 83 | Vercel Deployment Automation | Automates Vercel: deployments, projects, domains, environment variables, logs, and preview deployments. | Medium | [github.com/ComposioHQ/awesome-claude-skills](https://github.com/ComposioHQ/awesome-claude-skills) (in a collection) | OK, 75,190 stars, updated 2026-08-10 |
| 84 | AWS CDK Skills | AWS development with CDK best practices, cost optimization, MCP server patterns, and serverless/event-driven architecture patterns. | Low | [github.com/zxkane/aws-skills](https://github.com/zxkane/aws-skills) | OK, 363 stars, updated 2026-06-15 |
| 85 | Supabase Automation | Automates Supabase: SQL queries, table schemas, edge functions, storage, authentication, and real-time subscriptions. | Medium | [github.com/ComposioHQ/awesome-claude-skills](https://github.com/ComposioHQ/awesome-claude-skills) (in a collection) | OK, 75,190 stars, updated 2026-08-10 |
| 86 | Sentry Error Monitoring | Automates Sentry: issues, events, projects, releases, and alert management. | Low | [github.com/ComposioHQ/awesome-claude-skills](https://github.com/ComposioHQ/awesome-claude-skills) (in a collection) | OK, 75,190 stars, updated 2026-08-10 |
| 87 | Datadog Monitoring | Automates Datadog: monitors, dashboards, metrics, incidents, and alert management. | Low | [github.com/ComposioHQ/awesome-claude-skills](https://github.com/ComposioHQ/awesome-claude-skills) (in a collection) | OK, 75,190 stars, updated 2026-08-10 |
| 88 | Docker & Container Management | Manages Docker containers, compose stacks, and container orchestration. | Low | [github.com/VoltAgent/awesome-openclaw-skills](https://github.com/VoltAgent/awesome-openclaw-skills) (in a collection) | OK, 52,606 stars, updated 2026-09-14 |
| 89 | CI/CD Pipeline Automation (CircleCI/GitLab) | Automates CI/CD pipelines: configuration, workflow management, job orchestration, and deployment triggers across CircleCI, GitLab CI, and GitHub Actions. | Low | [github.com/ComposioHQ/awesome-claude-skills](https://github.com/ComposioHQ/awesome-claude-skills) (in a collection) | OK, 75,190 stars, updated 2026-08-10 |
## Creative & Media

| # | Skill | What it does | VA relevance | Source | Status |
|---|---|---|---|---|---|
| 90 | Remotion: Programmatic Video Creation | Translates natural language into working Remotion (React-based video framework) components. | Low | [github.com/remotion-dev/agent-skills](https://github.com/remotion-dev/agent-skills) | DEAD LINK |
| 91 | Image Generation (Imagen) | Generates images using Google Gemini's image generation API for UI mockups, icons, illustrations, and visual assets. | Medium | [github.com/sanjay3290/ai-skills/tree/main/skills/imagen](https://github.com/sanjay3290/ai-skills/tree/main/skills/imagen) | OK, 424 stars, updated 2026-09-10 |
| 92 | Slack GIF Creator | Creates animated GIFs optimized for Slack's size constraints with composable animation primitives, custom text, effects, and branding. | Medium | [github.com/anthropics/skills/tree/main/skills/slack-gif-creator](https://github.com/anthropics/skills/tree/main/skills/slack-gif-creator) | OK, 176,643 stars, updated 2026-09-10 |
| 93 | Algorithmic Art | Generates stunning generative art using p5.js with seeded randomness, flow fields, particle systems, and mathematical patterns. | Low | [github.com/anthropics/skills/tree/main/skills/algorithmic-art](https://github.com/anthropics/skills/tree/main/skills/algorithmic-art) | OK, 176,643 stars, updated 2026-09-10 |
| 94 | Image Enhancer | Improves image and screenshot quality: resolution enhancement, sharpness improvement, noise reduction, and clarity optimization for professional use. | High | [github.com/ComposioHQ/awesome-claude-skills](https://github.com/ComposioHQ/awesome-claude-skills) (in a collection) | OK, 75,190 stars, updated 2026-08-10 |
| 95 | Video Downloader | Downloads videos from YouTube and other platforms for offline viewing, editing, or archival with support for various formats and quality options. | High | [github.com/ComposioHQ/awesome-claude-skills](https://github.com/ComposioHQ/awesome-claude-skills) (in a collection) | OK, 75,190 stars, updated 2026-08-10 |
| 96 | Audio Transcription & TTS | Transcribes audio files using services like AssemblyAI, Whisper, and Deepgram. | High | [github.com/VoltAgent/awesome-openclaw-skills](https://github.com/VoltAgent/awesome-openclaw-skills) (in a collection) | OK, 52,606 stars, updated 2026-09-14 |
| 97 | 3D Model Generation | Generates 3D models from text descriptions or images using AI services. | Low | [github.com/VoltAgent/awesome-openclaw-skills](https://github.com/VoltAgent/awesome-openclaw-skills) (in a collection) | OK, 52,606 stars, updated 2026-09-14 |
## Enterprise & Industry-Specific

| # | Skill | What it does | VA relevance | Source | Status |
|---|---|---|---|---|---|
| 98 | Loki Mode: Multi-Agent Startup System | Orchestrates 37 AI agents across 6 swarms to build, deploy, and operate a complete startup — from product requirements document to revenue. | Low | [github.com/asklokesh/claudeskill-loki-mode](https://github.com/asklokesh/claudeskill-loki-mode) | OK, 1,065 stars, updated 2026-09-15 |
| 99 | Scientific Research Skills | Comprehensive collection of scientific skills for working with specialized libraries and databases: ArXiv search, PubMed queries, chemical database access, molecular visualization, and statistical analysis. | Low | [github.com/K-Dense-AI/claude-scientific-skills](https://github.com/K-Dense-AI/claude-scientific-skills) | OK, 45,188 stars, updated 2026-09-14 |
| 100 | Google Workspace Enterprise Suite | Complete Google Workspace integration: Gmail, Calendar, Chat, Docs, Sheets, Slides, and Drive with cross-platform OAuth. | Medium | [github.com/sanjay3290/ai-skills/tree/main/skills](https://github.com/sanjay3290/ai-skills/tree/main/skills) | OK, 424 stars, updated 2026-09-10 |

## Dead or archived on the check date

| # | Skill | Problem | What to do |
|---|---|---|---|
| 11 | PlanetScale Database Skills | github.com/planetscale/agent-skill returns 404 | Search GitHub for `planetscale skill` before installing |
| 52 | Threat Hunting with Sigma Rules | github.com/jthack/threat-hunting-with-sigma-rules-skill returns 404 | Skip; not VA work |
| 80 | NotebookLM Integration | Repository is archived (no longer maintained) | Use with care; look for a maintained fork |
| 90 | Remotion video creation | github.com/remotion-dev/agent-skills returns 404 | Check github.com/remotion-dev for the current skills location |

## How to install a skill (for the AI)

1. Skills for Claude Code live in `.claude/skills/<skill-name>/SKILL.md` inside this client folder. Antigravity reads the same folder.
2. For a direct repository: `git clone <url> /tmp/skill && cp -r /tmp/skill/<path-to-skill-folder> .claude/skills/<skill-name>`. Only copy the folder that contains `SKILL.md`.
3. For a collection (awesome-claude-skills, awesome-openclaw-skills, anthropics/skills): clone it, find the sub-folder whose `SKILL.md` matches the skill name, copy only that sub-folder.
4. Read the `SKILL.md` before using it. If it needs an API key or login, stop and tell the VA to ask the lead. Never put keys in the repo.
5. Run `bash scripts/sync.sh` so the whole team gets the skill.
6. Add a line to `skills/INSTALLED.md`: date, skill name, who asked, why.
