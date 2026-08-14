# CLAUDE.md — CV Project: Artur Wagner

> Read this file completely before touching any code.
> Also check `C:\Users\User\.claude\skills` for available skills before starting.

---

## 1. WHO THIS IS FOR

**Artur Wagner** — Cloud & Software Engineer based in Cork, Ireland.
Targeting Junior Cloud Engineer and Software Engineering roles in Ireland and remotely.

- GitHub: https://github.com/arturwgnr
- LinkedIn: https://linkedin.com/in/arturwagnerdev
- Website/TrendCode: https://trendcode.ie
- Email: arturwagner99@hotmail.com
- Phone: +353 083 200 9894

---

## 2. PROJECT CONTEXT

This is a **CV hosted as a static site on AWS**, deployed via:
- **S3** (private bucket, no public access)
- **CloudFront** (OAC with sigv4, HTTPS enforced)
- **Terraform** (infrastructure as code, fully reproducible)

The site IS the CV. It must be impressive enough that any recruiter or engineer who lands on it immediately understands the level of craft and intentionality behind the candidate.

---

## 3. VISUAL IDENTITY & DESIGN DIRECTION

### Concept
**"Storm Infrastructure"** — the aesthetic of clouds, lightning, and precision engineering. Dark, modern, editorial. Not a developer portfolio template. Not Bootstrap. Not generic.

Reference: Artur's LinkedIn banner — monochromatic clouds, electric blue lightning bolt, bold uppercase typography, illustrated editorial figure. That energy, translated to web.

### Color Palette
```
Background:       #0a0a0f  (near black, deep space)
Surface:          #111118  (cards, sections)
Border/Subtle:    #1e1e2e  (dividers, outlines)
Primary Text:     #f0f0f0  (near white)
Secondary Text:   #8888aa  (muted, metadata)
Accent (Lightning): #4a9eff  (electric blue — use sparingly)
Accent Glow:      #4a9eff22 (subtle glow for key elements)
Highlight:        #ffffff   (name, section headers)
```

### Typography
```
Headings:   'Inter' or 'DM Sans' — bold, uppercase, tracked
Body:       'Inter' — regular, 15-16px, comfortable line height
Mono:       'JetBrains Mono' or 'Fira Code' — for tech stack tags
```
Load from Google Fonts.

### Visual Elements
- **Subtle cloud texture** in the hero/header — CSS or SVG, not a heavy image
- **Lightning accent** — one sharp electric blue diagonal line or bolt used as a design element (header divider or section accent), NOT as a decoration on every section
- **Minimal noise/grain** on dark background — adds depth without weight
- **Glow effects** — only on the name or primary CTA, not everywhere
- **Geometric grid** — faint dot grid or line grid in background of hero section only
- No animations that distract. Subtle fade-in on scroll is acceptable. Nothing that bounces or spins.

### Layout
- **Single page**, sections flow vertically
- Max width: `860px`, centered
- Hero section at top with photo, name, title, contact links
- Sections: Summary → Experience → Projects → Skills → Education & Certifications
- Clean section dividers — thin line or spacing only, no heavy borders
- **Print-friendly**: must look good if printed or exported to PDF (`@media print` styles required)

---

## 4. HERO SECTION

### Photo
- Circular or slightly rounded square (prefer circle)
- Size: ~120px on desktop, ~90px mobile
- Placeholder path: `./assets/photo.jpg` (Artur will replace with real photo)
- Subtle electric blue ring/glow border around photo

### Name & Title
```
ARTUR WAGNER                    ← H1, bold, uppercase, white, large
Cloud & Software Engineer       ← H2, lighter weight, accent blue or muted white
Cork, Ireland · Remote          ← small, secondary text color
```

### Contact Row
Inline links with icons (use SVG icons inline or a minimal icon font):
- Email
- Phone
- LinkedIn
- GitHub
- trendcode.ie

---

## 5. CV CONTENT

### SUMMARY
Software and Cloud Engineer with hands-on experience building and deploying full-stack web applications and cloud infrastructure. Proficient in React, Node.js, Express, and PostgreSQL, with demonstrated AWS experience across EC2, S3, and infrastructure deployment. Founder of TrendCode, delivering end-to-end client solutions in a fully remote, self-directed environment. AWS Cloud Practitioner certification in progress. Open to junior Cloud and Software Engineering roles where technical ownership and delivery are the standard.

---

### EXPERIENCE

**Founder & Software Engineer** — TrendCode *(Self-employed, Remote · Nov 2023 – Present)*
- Designed and deployed full-stack web applications using React, Node.js, and Express, delivering end-to-end solutions from requirements gathering to production
- Architected and managed cloud infrastructure on AWS, including deployment pipelines and containerisation with Docker
- Delivered REST API design and backend integration across multiple client projects, maintaining ownership of the full development lifecycle

**Healthcare Support Specialist** — CareChoice Group Ireland *(Cork, Ireland · Dec 2023 – Present)*
- Supported patient care operations in a regulated healthcare environment, maintaining consistent compliance with clinical processes and standards
- Utilized Epic Care (EHR system) daily for clinical documentation and patient data management, ensuring accuracy and data integrity
- Performed effectively under pressure in a fast-paced care setting, demonstrating reliability and attention to detail across all operational responsibilities

**Store Supervisor** — Spar *(Cork, Ireland · Nov 2020 – Dec 2023)*
- Supervised daily store operations including stock management, staff scheduling, and opening/closing procedures, ensuring consistent adherence to operational standards
- Coordinated and led a team of floor staff, maintaining service quality and resolving operational issues under pressure
- Monitored compliance with store processes and implemented corrective actions to address workflow inefficiencies

**Logistics Systems Analyst** — Mercado Livre *(Minas Gerais, Brazil · Jun 2020 – Apr 2022)*
- Diagnosed and resolved system bugs within the logistics platform of one of Latin America's largest e-commerce companies, reducing operational disruptions across delivery workflows
- Analyzed and optimized delivery routes using internal tools and Excel, improving logistical efficiency and supporting cost reduction initiatives
- Managed returns and exceptions handling by identifying root causes within the routing system and coordinating resolutions across logistics and operations teams

---

### PROJECTS

**CV Hosting Infrastructure** — Terraform · AWS S3 · CloudFront
- Provisioned and deployed a secure static site hosting pipeline using Terraform, with a private S3 bucket and CloudFront distribution configured with Origin Access Control (OAC)
- Enforced HTTPS-only access and restricted S3 bucket access exclusively to CloudFront using IAM bucket policies and AWS source ARN conditions
- Infrastructure fully defined as code, enabling reproducible and version-controlled cloud deployments

**Flowee — Personal Finance Web App** — React · Node.js · Express · PostgreSQL · AWS
- Built and deployed a full-stack personal finance application with recurring transactions, custom categories, budgets, goals, and AI-powered insights
- Deployed frontend to Vercel and backend to Render; integrated Recharts for data visualization and Gemini AI for financial analysis

---

### SKILLS

| Category | Technologies |
|---|---|
| Front End | React, HTML, CSS, JavaScript, Tailwind |
| Back End | Node.js, Express, REST API, Prisma |
| Database | PostgreSQL |
| Cloud & Deployment | AWS (EC2, S3, IAM, CLI), Terraform, Docker, Vercel, Render |
| Tools | Git, GitHub, Linux, Vite |

Render skills as **tag pills** — dark surface, electric blue border, mono font. Group by category with a subtle label above each group.

---

### EDUCATION & CERTIFICATIONS

**Bachelor of Business Administration** — FAHOR, Brazil · 2022

**AWS Certified Cloud Practitioner** — Amazon Web Services *(In Progress)*

---

## 6. TECHNICAL REQUIREMENTS

- Pure HTML + CSS (single `index.html` file) — no frameworks, no build step
- All CSS in `<style>` tag within the same file OR a linked `style.css` in the same directory
- Google Fonts loaded via `<link>` in `<head>`
- Must work offline after initial load (no external JS dependencies)
- `@media print` styles: white background, black text, remove glow effects
- Responsive: must look good on mobile (single column), tablet, and desktop
- Semantic HTML: use `<header>`, `<section>`, `<article>`, `<footer>` correctly
- No JavaScript required — pure CSS for any interactions (hover states etc.)
- Image path: `./assets/photo.jpg` — if file doesn't exist, show a styled placeholder

---

## 7. TONE & POSITIONING

This CV should feel like it was built by someone who:
- Knows what they're doing with infrastructure
- Has taste and attention to detail
- Is not asking for a chance — is presenting a track record

Every design decision should reinforce that positioning. When in doubt, do less. Precision over decoration.

---

## 8. DELIVERABLE

A single `index.html` (+ optional `style.css`) that:
1. Looks premium and on-brand when opened in a browser
2. Contains all CV content from Section 5
3. Is hosted-ready for the S3/CloudFront pipeline already built via Terraform
4. Prints cleanly as a PDF if needed

---

*Built with Terraform. Hosted on AWS. Designed with intent.*