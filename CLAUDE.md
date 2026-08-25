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
- **全站啟用 pangu.js 自動處理中英文間距**：已在 `_includes/scripts.liquid` 末尾引入 pangu.js CDN，頁面載入後自動在 CJK 與半形字元間插入空格。

## 網站七大區塊與對應檔案

| 區塊                 | 設定頁面                                                                                      | 內容來源                                                |
| -------------------- | --------------------------------------------------------------------------------------------- | ------------------------------------------------------- |
| 首頁 / About         | `_pages/about.md`                                                                             | 個人簡介、精選論文、最新消息                            |
| Blog（含三個子分類） | `_pages/blog.md`、`_pages/blog_notes.md`、`_pages/blog_sharing.md`、`_pages/blog_thoughts.md` | `_posts/YYYY-MM-DD-*.md`                                |
| Publications（論文） | `_pages/publications.md`                                                                      | `_bibliography/papers.bib`                              |
| Projects（專案）     | `_pages/projects.md`                                                                          | `_projects/*.md`（category ≠ teaching）                 |
| 教學講義             | `_pages/teaching.md`                                                                          | `_data/courses.yml`                                     |
| **演講邀約**         | **`_pages/talks.md`**                                                                         | **`_data/talks.yml`**                                   |
| CV                   | `_pages/cv.md`                                                                                | `_data/cv.yml`（演講記錄自動從 `_data/talks.yml` 讀取） |

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
categories: notes # notes | sharing | thoughts
featured: false
---
```

3. 寫 Markdown 內文，`git add`、`commit`、`push origin main`

### 新增研究計畫

研究計畫放在 **CV 頁面**（`/cv/`），資料在 `_data/cv.yml` 的 `Research Grants` 區塊。

**與「專案開發」的區別**：

- `_data/cv.yml → Research Grants`：獲外部補助的正式研究案（國科會、IRB、機構計畫）
- `_projects/`：自主開發成果（工具、書籍、研究方法），不需補助即可進行

**計畫欄位**（參考 `cv.yml` 中的範例）：

| 欄位                             | 必填 | 說明                                            |
| -------------------------------- | ---- | ----------------------------------------------- |
| `title` / `title_en`             | 是   | 計畫名稱（中 / 英）                             |
| `funder` / `funder_en`           | 是   | 補助單位（如：國家科學及技術委員會）            |
| `grant_number`                   | 建議 | 計畫編號（如：NSTC 113-2410-H-XXX-XXX）         |
| `role` / `role_en`               | 是   | 角色：主持人 / Co-PI / Co-Investigator          |
| `start_date` / `end_date`        | 是   | 格式：`YYYY-MM`                                 |
| `type` / `type_en`               | 是   | 計畫類型：專題研究計畫 / Research Project Grant |
| `status`                         | 是   | `ongoing`（執行中）或 `completed`（已結案）     |
| `amount`                         | 選填 | **金額欄位不顯示於頁面**，僅供內部記錄          |
| `description` / `description_en` | 選填 | 一句話簡述                                      |

**新增計畫 SOP**：

1. 計畫核准後，開啟 `_data/cv.yml`，找到 `Research Grants:` 區塊
2. 複製範例格式（取消 `#` 即可），填入補助單位、編號、期間、角色等
3. `amount` 欄位可填可不填，**不會顯示於頁面**
4. `git add _data/cv.yml`、`commit`、`push`
5. 計畫數量累積到 3 個以上時，可考慮抽出獨立頁面

**空白處理**：`Research Grants` 區塊為空時，CV 頁面完全不顯示此區塊（不會出現「研究計畫（無）」）。

### 新增論文

論文發表頁（`/publications/`）分為兩個分區，用 BibTeX 類型自動路由：

- **期刊論文**用 `@article`，放 `_bibliography/papers.bib` 上半部
- **研討會論文**用 `@inproceedings`，放 `_bibliography/papers.bib` 下半部（`%% ---- Conference Papers ----` 區塊）

#### 新增期刊論文

1. 開啟 `_bibliography/papers.bib`
2. 在對應年份區塊新增 `@article` 條目；若要在首頁顯示，加上 `selected={true}`
3. `git add _bibliography/papers.bib`、`commit`、`push`

#### 新增研討會論文

研討會論文必填欄位：

| 欄位        | 說明                         | 範例                                      |
| ----------- | ---------------------------- | ----------------------------------------- |
| `booktitle` | 研討會全名                   | `台灣護理學會年度學術研討會`              |
| `address`   | 舉辦地點                     | `台北，台灣`                              |
| `year`      | 年份                         | `2025`                                    |
| `month`     | 月份                         | `Oct`                                     |
| `abbr`      | 發表類型（決定左側徽章顏色） | `Oral` / `Poster` / `Keynote` / `Invited` |
| `note`      | 完整類型說明（顯示在卡片）   | `Oral Presentation`                       |

`abbr` 欄位可選值與對應徽章顏色：

- `Oral` → 淺橘底 `#FED7AA` + 深橘字 `#9A3412`
- `Poster` → 淺青底 `#A7F3D0` + 深青字 `#065F46`
- `Keynote` → 淺紫底 `#DDD6FE` + 深紫字 `#5B21B6`
- `Invited` → 淺粉底 `#FBCFE8` + 深粉字 `#9D174D`

新增研討會論文 SOP：

1. 從研討會官網取得正式名稱（`booktitle`）
2. 確認發表類型（Oral / Poster / Keynote / Invited）
3. 整理 BibTeX，參考 `papers.bib` 中的 `lin2025example` 範例格式
4. 把範例條目替換掉（或在其下方新增真實條目，刪除範例）
5. `git add _bibliography/papers.bib`、`commit`、`push`

### 論文頁面進階功能（已啟用）

- **右側年份目錄**（桌面版 >1024px）：Jekyll 渲染後由 JS 從 DOM 動態建構，包含年份與論文數量；新增論文時目錄**自動更新**，無需手動維護
- **滾動自動高亮**：捲動到某年份時，TOC 對應年份自動標紫色
- **回到頂部按鈕**：捲動超過 500px 後浮現於右下角
- **搜尋框增強**：`bibsearch.js` 支援標題、作者、期刊、年份即時過濾；搜尋時顯示「找到 X 筆結果」

未來論文超過 50 篇時，可考慮新增：

- 「最近 5 年」/ 「全部」切換按鈕
- 期刊影響因子標籤（手動維護 `_data/venues.yml`）
- 引用次數排序（需要 Google Scholar API 或手動更新 `_data/citations.yml`）

### 新增專案（research / tools）

**檔名命名規則**：`{importance}_{slug}.md`，例如 `1_bigdata-pipeline.md`

- 數字對應 `importance` 欄位（決定同分類內的排序，1 最前）
- slug 用英文小寫 + 連字號，不含中文

**完整 frontmatter 範本**：

```yaml
---
layout: project
title: 中文標題
title_en: English Title
cover_title: 卡片顯示的短標題（選填，省略用 title）
cover_title_en: Card Short Title (optional)
description: 中文一行簡述
description_en: One-line English description
img: assets/img/projects/filename.png # 省略則無縮圖
importance: 1 # 同 category 內排序，數字越小越前
year: 2026 # 專案年份，用於統計區塊「持續更新」顯示最新年份
category: research # research | tools（teaching 專案用獨立頁面）
status: in_progress # in_progress | completed | maintained
project_type: research_method # 見下方 project_type 表
type_label: 研究方法 # 卡片上顯示的中文類型小標
type_label_en: Research Method # 英文版類型小標
github: https://github.com/andrelin39/repo # 選填
google_drive: https://drive.google.com/... # 選填，顯示「資料 ↗」按鈕
---
```

**Category 可用值**：

| 值         | 顯示（中） | 顯示（英）        |
| ---------- | ---------- | ----------------- |
| `research` | 研究專案   | Research Projects |
| `tools`    | 實用工具   | Practical Tools   |

**Status 標籤**（卡片右上角 pill）：

| status        | 中文顯示 | 英文顯示    | 背景色    | 文字色    |
| ------------- | -------- | ----------- | --------- | --------- |
| `in_progress` | 進行中   | In Progress | `#FEF3C7` | `#92400E` |
| `completed`   | 已完成   | Completed   | `#D1FAE5` | `#065F46` |
| `maintained`  | 持續維護 | Maintained  | `#DBEAFE` | `#1E40AF` |

**project_type 分類**（卡片標題下方灰色小標）：

| project_type      | type_label（中） | type_label_en（英） | 適用情境                       |
| ----------------- | ---------------- | ------------------- | ------------------------------ |
| `research_method` | 研究方法         | Research Method     | LLM 編碼、統計流程等方法學研究 |
| `book`            | 書籍撰寫         | Book Writing        | 書稿、教材撰寫                 |
| `website`         | 網站建置         | Website             | 個人網站、專案網站             |
| `tool`            | 實用工具         | Tool                | 瀏覽器工具、CLI、腳本等        |

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
img: assets/img/projects/course-thumb.png # 選填
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

## 教學資料管理規範

適用於 Google Drive 雲端硬碟的教學素材組織。

### 雲端資料夾結構

按三層分層：**學年度 → 課程 → 子分類**

```
114/
  114-1_生物統計學_輔英進二技護理/
    00_教材/
    01_作業/
    02_評量/
    99_學生資料/
```

### 學期代碼

| 代碼 | 學期   |
| ---- | ------ |
| 1    | 上學期 |
| 2    | 下學期 |
| S    | 暑期   |
| W    | 寒期   |

### 命名格式

**課程資料夾**：`[學期]_[課程]_[學校簡稱][學制][系所]`

- 範例：`114-1_生物統計學_輔英進二技護理`

**講義檔案**：`[主題]_[日期].pdf`

- 範例：`假設檢定_20251015.pdf`

### 課程資料夾連結策略

網站只放整個課程的 Google Drive 資料夾連結，**不逐週列出單一檔案**。
學生進入資料夾後自行挑選所需講義。

### 講義更新流程

- **新增講義**：上傳檔案到對應課程資料夾 → 完成（網站無需異動）
- **修改講義**：直接覆蓋同名檔（Drive 自動保留版本歷程），**不另存 `_v2`、`_final`、`_new` 等後綴**
- **新開課程**：在 `_data/courses.yml` 新增一筆，填入 `drive_folder` 連結

### 學生資料

一律放 `99_學生資料/` 子目錄，**絕對不公開、不對外連結**。

## 演講資料管理規範

### 新增演講

只需在 `_data/talks.yml` 的 `talks:` 陣列新增一筆，格式如下：

```yaml
- id: YYYY-MM-講題slug
  date: YYYY-MM-DD
  title: 中文講題
  title_en: English Title
  type: invited_talk # invited_talk | training | invited_speech
  organization: 機構中文名
  organization_en: Organization English Name
  location: 縣市（例：彰化縣彰化市）
  location_en: City, County (e.g., Changhua City, Changhua County)
  category: ai_applications # 見類別歸屬規則
  slides_folder: "TBD_YYYY-MM-slug" # Google Drive 資料夾連結；填 TBD_xxx 時顯示「整理中」
  slides: # 單份講綱 PDF 連結（留空不顯示）
  photo: # 活動照片連結（留空不顯示）
  video: # 影片連結（留空不顯示）
  news: # 新聞報導連結（留空不顯示）
  event_page: # 活動頁面連結（留空不顯示）
  abstract: # 一兩句講題簡述（選填）
  internal: true # 如為內部資料，加此行；省略則不加
```

新增後，以下三處**自動更新**，無需手動改：

- `/talks/` 頁面統計數字（場次、年數、單位、縣市）
- `/talks/` 分類列表
- `/cv/` 演講記錄（APA 格式引用）

### Google Drive 演講資料管理

- **根目錄**：Google Drive → `教學資料 / 演講資料 /`
- **每場演講一個資料夾**，命名格式：`YYYY-MM_講題簡稱_地點`
  - 例：`2025-08_數位轉型AI分析_彰化CCH`
- 資料夾內放：投影片（PDF/PPTX）、講綱、範例檔案等
- 所有演講都是**開放式內容，可公開分享**（不含敏感個資）
- 取得「知道連結的人均可檢視」共用連結後，在 `talks.yml` 中：
  - 把 `slides_folder: "TBD_xxx"` 替換成正式 Google Drive URL
  - 網站會自動從「整理中」變成可點擊的「演講資料 ↗」按鈕

### 講綱 PDF 命名與存放

- 本地 PDF：放 `assets/pdf/talks/`，命名格式 `YYYY-MM_講題簡稱.pdf`
- 建議優先用 Google Drive 資料夾連結（`slides_folder`），不逐份上傳到 repo

### 類別歸屬規則

| 類別 id           | 適用情境                               |
| ----------------- | -------------------------------------- |
| `ai_applications` | AI 工具教學、辦公自動化、資料分析應用  |
| `research`        | 護理研究、學術方法、文獻管理（JCR 等） |
| `ai_ethics`       | AI 倫理、法律與 AI、跨領域議題         |

若不屬於現有類別，在 `_data/talks.yml` 的 `categories:` 新增一個項目，指定新的 `id`、`name`、`name_en`、`order`。

### 演講類型說明

| type             | 中文顯示 | 顏色標籤 |
| ---------------- | -------- | -------- |
| `invited_talk`   | 專題演講 | 淺紫     |
| `training`       | 教育訓練 | 淺橘     |
| `invited_speech` | 受邀演講 | 淺藍     |

### 內部資料處理

對於不宜公開講綱的演講（如院內訓練），在 `talks.yml` 加：

```yaml
internal: true
```

該場次仍顯示在列表，但不顯示任何連結，改顯示「內部資料」字樣。

## 視覺設計規範

本網站的視覺語言以**學術感、大量留白、無 emoji**為基調。
新增或修改任何頁面（publications、blog 列表、projects、teaching、talks 等）時，請遵循以下規範。

> **重要：開發新頁面前，務必先參考 `_pages/teaching.md`、`_pages/talks.md`、`_pages/projects.md` 的設計，確保視覺語言一致。**

### 全站一致性規則（不可違反）

1. **類別標題**：一律使用「左側 4px 色條 + 左對齊 + 中英對照」的 banner 樣式，禁止靠右對齊或無色條的設計
2. **按鈕**：一律使用「淡紫/主題色外框 + 白底 + 主題色文字」樣式；外部連結加 ` ↗` 後綴；禁止黑底白字（logo 感）按鈕
3. **數據摘要區塊**：所有列表/卡片頁面，頁面標題下方一律加數據摘要（大數字 + 小說明，bordered bottom）
4. **Section 間距**：`margin-bottom: 5rem`（80px），禁止壓縮
5. **語言切換**：所有標題、標籤、按鈕文字，一律用 `<span class="lang-zh">` / `<span class="lang-en">` 雙語包裹
6. **無 emoji**：學術頁面所有位置禁用 emoji，改用文字標籤或 Font Awesome 線性 icon

### 類別標題（Section Header）

```css
/* 左側色條 + 縮排 */
border-left: 4px solid var(--global-theme-color, #526eb4);
padding-left: 16px;

/* 中文主標題 */
font-size: 2rem; /* 32px，可至 2.25rem */
font-weight: 700;
color: #111827;
letter-spacing: -0.02em;
line-height: 1.15;

/* 英文副標（緊接主標題下方） */
font-size: 0.875rem; /* 14px */
color: #9ca3af;
font-weight: 400;
```

實作範例（HTML 結構）：

```html
<div class="section-banner">
  <!-- 包住色條 + 文字 -->
  <h3 class="section-title">
    <span class="lang-zh">中文類別名稱</span>
    <span class="lang-en">English Category Name</span>
  </h3>
  <span class="section-sub">
    <span class="lang-zh">English Category Name</span>
    <!-- ZH 模式顯示英文副標 -->
    <span class="lang-en">中文類別名稱</span>
    <!-- EN 模式顯示中文副標 -->
  </span>
</div>
<hr style="border-top: 1px solid #E5E7EB; margin: 1.25rem 0 0 0;" />
```

### 內容條目排版

| 元素                       | 字級                | 字重 | 顏色       |
| -------------------------- | ------------------- | ---- | ---------- |
| 條目標題（講題、論文標題） | 18px（`1.125rem`）  | 600  | `#1F2937`  |
| 機構 / 期刊名稱            | 13px（`0.8125rem`） | 400  | `#9CA3AF`  |
| 地點 / 日期等次要資訊      | 13px（`0.8125rem`） | 400  | `#9CA3AF`  |
| 類型標籤（pill）           | 11px（`0.6875rem`） | 500  | 依類型色碼 |
| 日期（等寬字體）           | 12.8px（`0.8rem`）  | 400  | `#6B7280`  |

日期使用等寬字體以對齊：

```css
font-family: "Menlo", "Monaco", "Consolas", "Liberation Mono", monospace;
```

### 間距規範

| 位置                    | 值                          |
| ----------------------- | --------------------------- |
| Section 與 Section 之間 | `5rem`（80px）              |
| 類別標題到第一筆內容    | `2rem`（32px）              |
| 條目內部上下 padding    | `1.25rem 0`                 |
| 條目分隔線顏色          | `#E5E7EB`（最後一筆不加線） |
| 統計區塊底部 border     | `1px solid #E5E7EB`         |

### 類型標籤（Pill）色碼

**演講類型 pill（talks.md）**：

| 語意        | 背景色    | 文字色    | 適用場景                   |
| ----------- | --------- | --------- | -------------------------- |
| 主要 / 受邀 | `#EDE9FE` | `#5B21B6` | 專題演講（invited_talk）   |
| 訓練 / 一般 | `#FFEDD5` | `#C2410C` | 教育訓練（training）       |
| 次要 / 邀請 | `#DBEAFE` | `#1D4ED8` | 受邀演講（invited_speech） |

**專案狀態 pill（projects.md）**：

| status                   | 背景色    | 文字色    |
| ------------------------ | --------- | --------- |
| `in_progress`（進行中）  | `#FEF3C7` | `#92400E` |
| `completed`（已完成）    | `#D1FAE5` | `#065F46` |
| `maintained`（持續維護） | `#DBEAFE` | `#1E40AF` |

### 按鈕樣式

**主要行動按鈕**（演講資料、課程資料夾）：

```css
border: 1px solid var(--global-theme-color, #526eb4);
color: var(--global-theme-color, #526eb4);
/* hover */
background: var(--global-theme-color);
color: #fff;
```

**次要按鈕**（講綱、照片等附件）：

```css
border: 1px solid #d1d5db;
color: #6b7280;
/* hover */
border-color: #9ca3af;
color: #374151;
```

**停用按鈕**（整理中、Coming soon）：

```css
border: 1px solid #e5e7eb;
color: #d1d5db;
cursor: default;
pointer-events: none;
```

按鈕通用屬性：`font-size: 0.75rem`、`padding: 0.2rem 0.65rem`、`border-radius: 4px`。
外部連結一律加 `target="_blank" rel="noopener noreferrer"`，文字後綴 ` ↗`。

### 整體基調

- **留白優先**：寧可多留空間，不要塞滿資訊
- **無 emoji**：學術頁面一律不使用 emoji，改用線性圖示（Font Awesome）或文字標籤
- **雙語並陳**：所有標題、標籤、按鈕都用 `<span class="lang-zh">` / `<span class="lang-en">` 包裹
- **顏色節制**：主色只用 `var(--global-theme-color)`，其餘用灰階；強調色限用在 pill 標籤
- **分隔線**：用 `#E5E7EB`（淡灰），不用粗線或顏色線

### 數據摘要區塊的適用原則

「大數字 + 小標籤」統計區塊**全站已移除**，不再使用。

- 演講頁（`talks.md`）：已移除總場次、累積年數、邀請單位、涵蓋縣市
- 專案頁（`projects.md`）：已移除專案總數、研究專案、實用工具、持續更新年份
- 論文頁（`publications.md`）：從未加入

**判斷原則**：如果讀者捲一下就能掌握數量和分布，統計區塊只是視覺噪音。列表本身就是最直接的呈現。未來新增頁面不加此類區塊。
