# CLAUDE.md — andrelin39.github.io 專案

## 專案概述

個人學術網站，使用 **Jekyll + al-folio 主題**，部署於 **GitHub Pages**。

- 線上網址：https://andrelin39.github.io
- 原始碼：https://github.com/andrelin39/andrelin39.github.io
- Upstream theme：https://github.com/alshedivat/al-folio

## 技術決策

- **本地開發**：使用 **Ruby + Bundler**，不使用 Docker。啟動指令見下方「本地預覽」節。
- **已移除 Decap CMS**（commit: `bec69f5c`）：改為純 Markdown 工作流，直接編輯檔案後 push。
- **部署方式**：push 到 `main` 分支後，GitHub Actions 自動建置並部署，無需手動操作。
- **未來日期文章**：`_config.yml` 已設定 `future: true`，允許排程文章公開。

## 網站六大區塊與對應檔案

| 區塊 | 設定頁面 | 內容來源 |
|------|----------|----------|
| 首頁 / About | `_pages/about.md` | 個人簡介、精選論文、最新消息 |
| Blog（含三個子分類） | `_pages/blog.md`、`_pages/blog_notes.md`、`_pages/blog_sharing.md`、`_pages/blog_thoughts.md` | `_posts/YYYY-MM-DD-*.md` |
| Publications（論文） | `_pages/publications.md` | `_bibliography/papers.bib` |
| Projects（專案） | `_pages/projects.md` | `_projects/*.md`（category ≠ teaching） |
| 教學講義 | `_pages/teaching.md` | `_projects/*.md`（category: teaching） |
| CV | `_pages/cv.md` | `_data/cv.yml` |

Blog 文章依 `categories` 欄位路由到不同子頁：
- `categories: notes` → 學習筆記（/notes/）
- `categories: sharing` → 文章分享（/sharing/）
- `categories: thoughts` → 心情隨想（/thoughts/）

## 新增內容 SOP

### 新增 Blog 文章

1. 在 `_posts/` 建立檔案，命名格式：`YYYY-MM-DD-kebab-case-title.md`
2. 填寫 frontmatter：

```yaml
---
layout: post
title: 文章標題（中文可）
date: 2026-01-01 08:00:00 +0800
description: 一句話摘要（會顯示在列表）
tags: 標籤1 標籤2
categories: notes   # notes | sharing | thoughts
featured: false
---
```

3. 寫 Markdown 內文，`git add`、`commit`、`push origin main`

### 新增論文

1. 開啟 `_bibliography/papers.bib`
2. 新增 BibTeX 條目；若要在首頁顯示，加上 `selected={true}`
3. `git add _bibliography/papers.bib`、`commit`、`push`

### 新增專案（research / tools）

**檔名命名規則**：`{importance}_{slug}.md`，例如 `1_bigdata-pipeline.md`
- 數字對應 `importance` 欄位（決定同分類內的排序，1 最前）
- slug 用英文小寫 + 連字號，不含中文

**完整 frontmatter 範本**：

```yaml
---
layout: page
title: 中文標題
title_en: English Title
description: 中文一行簡述
description_en: One-line English description
img: assets/img/projects/filename.png   # 省略則無縮圖
importance: 1          # 同 category 內排序，數字越小越前
category: research     # research | teaching | tools
github: https://github.com/andrelin39/repo   # 選填
---
```

**Category 可用值**：

| 值 | 顯示（中） | 顯示（英） |
|----|----------|----------|
| `research` | 研究專案 | Research Projects |
| `teaching` | 教學講義 | Teaching Materials |
| `tools` | 實用工具 | Tools & Scripts |

**圖片規範**：
- 路徑：`assets/img/projects/` 下，副檔名 `.png` / `.jpg`
- 建議尺寸：**1200×630 px**（16:9），最小 800×420
- 暫無圖：直接省略 `img:` 欄位，卡片自動無圖顯示
- 支援外部 URL（如 GitHub social preview）：直接貼完整 https:// 網址

**雙語內文**：

```markdown
<div class="lang-zh">
中文內容（主要功能、技術棧、連結等）
</div>

<div class="lang-en">
English content
</div>
```

**SOP**：
1. 在 `_projects/` 新增 `{n}_{slug}.md`（參考 `1_example.md`）
2. 把縮圖放到 `assets/img/projects/`（選填）
3. `git add _projects/ assets/img/projects/`、`commit`、`push`

### 新增教材 / 課程

**與新增專案相同流程**，唯一差異：`category: teaching`

```yaml
---
layout: page
title: 課程中文名稱
title_en: Course English Name
description: 開課機構 · 修課對象
description_en: Institution · Target Audience
img: assets/img/projects/course-thumb.png   # 選填
importance: 1
category: teaching
---
```

## 本地預覽

**使用 Ruby + Bundler（不使用 Docker）：**

```bash
# 在 al-folio/ 目錄執行
bundle exec jekyll serve --config _config.yml,_config_local.yml
# 瀏覽 http://localhost:4000

# 新增 gem 後先執行
bundle install
```

網址預設為 `http://localhost:4000`，Jekyll 會在儲存檔案後自動 rebuild（watch mode）。

> **注意**：`_config_local.yml` 已設定 `imagemagick: enabled: false`。
> Windows 中文系統的 ImageMagick 錯誤訊息含非 UTF-8 字元，會讓 Ruby 4.0 崩潰。
> 本地預覽不需要 webp 轉換，關掉即可正常 build。

## 部署

push 到 `main` 即自動觸發 GitHub Actions 部署，通常 1–3 分鐘完成。

```bash
git add <files>
git commit -m "簡短說明"
git push origin main
```

## 與我溝通的偏好

- **語言**：中文回應（專有名詞維持英文）
- **Commit 訊息**：中文或英文皆可，一行為主，簡潔描述做了什麼
- **回應風格**：直接說結論與操作步驟，不需冗長解釋
- **程式碼**：優先修改現有檔案，不新增不必要的抽象層

## 我的角色背景

學術研究員（彰化基督教醫院大數據暨數位AI應用中心），主要工作：
- 文獻回顧（系統性回顧、Meta-analysis）
- 統計分析（臨床研究、大數據）
- 醫學寫作與翻譯（中英文）
- AI 工具應用研究

請以研究者視角理解需求，術語使用醫學/統計領域的標準用法。
