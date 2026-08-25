# 網站維護工作流程

**網站**：https://andrelin39.github.io  
**倉儲**：https://github.com/andrelin39/andrelin39.github.io  
**本地路徑**：`D:\homepage_project\al-folio\`

---

## 目錄

1. [新增 Blog 文章](#1-新增-blog-文章)
2. [新增論文到 Publications](#2-新增論文到-publications)
3. [新增教材到 Teaching](#3-新增教材到-teaching)
4. [更新個人資料與照片](#4-更新個人資料與照片)
5. [本地預覽](#5-本地預覽)
6. [部署（Commit + Push）](#6-部署commit--push)
7. [未來加回 Admin 後台的步驟](#7-未來加回-admin-後台的步驟)

---

## 1. 新增 Blog 文章

### 三種分類

| 分類值     | 中文名稱 | 頁面       |
| ---------- | -------- | ---------- |
| `notes`    | 學習筆記 | /notes/    |
| `thoughts` | 心情隨想 | /thoughts/ |
| `sharing`  | 文章分享 | /sharing/  |

### 步驟

**Step 1：在 `_posts/` 建立新檔案**

檔名格式：`YYYY-MM-DD-英文標題.md`

```
_posts/2026-06-15-hypothesis-testing-notes.md
```

**Step 2：貼入 Front Matter 範本**

```yaml
---
layout: post
title: 文章標題（中英文皆可）
date: 2026-06-15 08:00:00 +0800
description: 一句話摘要，顯示在文章列表頁
tags: 標籤1 標籤2
categories: notes # 三選一：notes / thoughts / sharing
featured: false # true = 顯示在首頁精選區
---
正文從這裡開始，支援 Markdown 語法。
```

> ⚠️ **時間格式**：固定使用 `08:00:00 +0800`（台灣早上 8 點 = UTC 00:00），
> 避免 GitHub Actions 時區差異導致文章被跳過不建置。

**Step 3：[部署](#6-部署commit--push)**

---

## 2. 新增論文到 Publications

論文資料在 `_bibliography/papers.bib`，使用 BibTeX 格式。

### 步驟

**Step 1：從 Google Scholar 取得 BibTeX**

1. 搜尋論文 → 點「引用」("） → 點底部「BibTeX」
2. 複製全文

**Step 2：貼到 `papers.bib` 末尾，加上 al-folio 專用欄位**

```bibtex
@article{lin2026example,
  abbr          = {期刊縮寫},        % 標題旁的小標籤
  bibtex_show   = {true},           % 顯示 BibTeX 展開按鈕
  selected      = {true},           % true = 首頁精選論文區顯示
  title         = {論文標題},
  author        = {Lin, Chih-Hao and 其他作者},
  journal       = {期刊全名},
  volume        = {卷號},
  pages         = {起頁--末頁},
  year          = {2026},
  doi           = {10.xxxx/xxxxxx},              % 不含 https://doi.org/
  html          = {https://doi.org/10.xxxx/xxx}, % 全文連結
  pdf           = {lin2026.pdf},                 % 放在 assets/pdf/（選填）
  abstract      = {摘要文字...},
  dimensions    = {true},           % 顯示 Dimensions 引用計數
}
```

**Step 3：若有 PDF，放到 `assets/pdf/`，檔名對應 pdf 欄位**

**Step 4：[部署](#6-部署commit--push)**

```bash
git add _bibliography/papers.bib assets/pdf/lin2026.pdf
git commit -m "Add publication: 論文標題"
git push origin main
```

---

## 3. 新增教材到 Teaching

### 3.1 在現有課程新增一份講義

**Step 1：上傳 PDF 到對應課程資料夾**

```
assets/pdf/teaching/biostatistics/ch03_hypothesis_testing.pdf
```

各課程資料夾對應：

| 課程             | 資料夾                                    |
| ---------------- | ----------------------------------------- |
| 生物統計學       | `assets/pdf/teaching/biostatistics/`      |
| 醫護文獻選讀     | `assets/pdf/teaching/nursing_literature/` |
| 教學原理         | `assets/pdf/teaching/pedagogy/`           |
| 醫療經濟學       | `assets/pdf/teaching/health_economics/`   |
| 大數據視覺化分析 | `assets/pdf/teaching/bigdata_viz/`        |
| 機器學習         | `assets/pdf/teaching/machine_learning/`   |
| AI 工具應用      | `assets/pdf/teaching/ai_tools/`           |

**Step 2：在對應的 `_projects/teaching_*.md` 加入表格列**

開啟例如 `_projects/teaching_biostatistics.md`，在 `<tbody>` 中加入：

```html
<tr>
  <td>Week 03</td>
  <td>假說檢定</td>
  <td>📄 投影片</td>
  <td><a href="/assets/pdf/teaching/biostatistics/ch03_hypothesis_testing.pdf" target="_blank">下載 PDF</a></td>
</tr>
```

**Step 3：[部署](#6-部署commit--push)**

### 3.2 新增一門新課程

1. 複製任一 `_projects/teaching_*.md` 檔案，改名為 `_projects/teaching_新課程.md`
2. 修改 front matter：
   ```yaml
   title: 新課程名稱
   description: 機構 · 修課對象
   importance: 8 # 數字越小越靠前
   category: teaching # 不可更改
   ```
3. 修改課程說明正文
4. [部署](#6-部署commit--push)

---

## 4. 更新個人資料與照片

### 4.1 首頁簡介

編輯 `_pages/about.md`（`---` 之後的正文）：

```markdown
我目前任職於**彰化基督教醫院**...（直接修改這段文字）
```

### 4.2 機構與職稱（首頁副標題）

編輯 `_pages/about.md` front matter 的 `subtitle` 欄位：

```yaml
subtitle: >
  研究員 ·
  <a href="https://www.cch.org.tw/" target="_blank">彰化基督教醫院</a>
  大數據暨數位AI應用中心
```

### 4.3 社群連結

編輯 `_data/socials.yml`：

```yaml
email: andrelin39@gmail.com
github_username: andrelin39
orcid_id: 0009-0001-0518-7818
scholar_userid: cqaqsCsAAAAJ
# cv_pdf: /assets/pdf/cv.pdf     # 取消 # 號並上傳 PDF 即可啟用
# linkedin_username: your-id     # 取消 # 號即可啟用
```

### 4.4 CV 頁面

編輯 `_data/cv.yml`，更新 Education / Experience / Skills 各區塊。

### 4.5 個人照片

將新照片命名為 `prof_pic.jpg`，放到 `assets/img/`（覆蓋原有檔案）：

```bash
git add assets/img/prof_pic.jpg
git commit -m "Update profile photo"
git push origin main
```

---

## 5. 本地預覽

在 PowerShell 執行：

```powershell
cd D:\homepage_project\al-folio
bundle exec jekyll serve --livereload --config _config.yml,_config_local.yml
```

瀏覽器開啟：**http://127.0.0.1:4000**

- 修改檔案後瀏覽器自動重新整理（livereload）
- 按 `Ctrl+C` 停止 server
- 若頁面無法載入，可能有多個 server 在跑：重新執行上方指令即可

> `_config_local.yml` 的作用：排除 Jupyter notebook（本機無 Python 環境），不影響線上部署。

---

## 6. 部署（Commit + Push）

### 標準流程

```powershell
cd D:\homepage_project\al-folio

# 1. 查看有哪些修改
git status

# 2. 加入所有修改（或指定單一檔案）
git add .
# git add _posts/2026-06-15-xxx.md   # 指定單一檔案

# 3. 建立 commit
git commit -m "說明這次做了什麼"

# 4. 推送（觸發 GitHub Actions 自動部署）
git push origin main
```

### 確認部署成功

1. 前往：https://github.com/andrelin39/andrelin39.github.io/actions
2. 找到最新的「Deploy site」workflow
3. 看到綠色 ✅ 表示成功，約 3 分鐘後網站更新
4. 開啟 https://andrelin39.github.io 確認

### 常用 commit 訊息範例

```
Add post: P值與臨床意義
Add publication: Lee 2026 ICCAS
Add lecture: 生物統計學 Week 03
Update profile photo
Update CV: add new experience
```

---

## 7. 未來加回 Admin 後台的步驟

若日後想重新啟用 Decap CMS 網頁後台，需要：

### 7.1 重建 admin/ 資料夾

建立 `admin/index.html`：

```html
<!doctype html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Content Manager</title>
  </head>
  <body>
    <script src="https://unpkg.com/decap-cms@^3.0.0/dist/decap-cms.js"></script>
  </body>
</html>
```

建立 `admin/config.yml`（參考 git 歷史紀錄，commit `7e6e45c4`）：

```bash
git show 7e6e45c4:admin/config.yml > admin/config.yml
```

### 7.2 OAuth Provider（Cloudflare Worker）

1. 在 Cloudflare 建立 Worker，貼入 OAuth proxy 腳本
2. 在 Worker 設定環境變數：`GITHUB_CLIENT_ID`、`GITHUB_CLIENT_SECRET`
3. 在 GitHub Settings → Developer settings → OAuth Apps 建立 OAuth App

### 7.3 更新 admin/config.yml

```yaml
backend:
  name: github
  repo: andrelin39/andrelin39.github.io
  branch: main
  base_url: https://你的-worker.workers.dev
  auth_endpoint: /auth
```

### 7.4 Commit 並 push

```bash
git add admin/
git commit -m "Re-enable Decap CMS admin"
git push origin main
```

---

_最後更新：2026-05-08_
