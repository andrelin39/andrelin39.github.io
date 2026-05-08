---
layout: project
title: 個人學術網站
title_en: Personal Academic Website
description: 以 Jekyll + al-folio 搭建，支援中英雙語切換，部署於 GitHub Pages。
description_en: Built with Jekyll + al-folio, with Chinese/English bilingual toggle, deployed on GitHub Pages.
img: assets/img/projects/academic-website.jpg
importance: 1
category: tools
github: https://github.com/andrelin39/andrelin39.github.io
---

<div class="lang-zh" markdown="1">

## 專案概述

這是你正在瀏覽的網站。從選擇主題框架、設計工作流程，到實作中英雙語切換、建立 Projects 分類系統，整個建置過程以 **Claude Code** 作為主要協作工具完成。

## 主要功能

- **中英雙語切換**：navbar 右上角 ZH/EN 按鈕，語言偏好透過 `localStorage` 記憶，頁面重整後維持
- **Projects 分類系統**：research / teaching / tools 三個分類，卡片支援雙語標題與描述
- **純 Markdown 工作流**：所有內容以 `.md` 檔案管理，push 到 GitHub 後自動部署
- **CV 自動渲染**：從 `_data/cv.yml` 產生，雙語欄位同步切換
- **BibTeX 論文管理**：由 jekyll-scholar 自動從 `.bib` 檔案產生論文列表

## 技術棧

| 工具 | 用途 |
|:-----|:-----|
| Jekyll + al-folio | 靜態網站框架與主題 |
| GitHub Pages | 免費部署與 CDN |
| GitHub Actions | 自動建置與部署 |
| Claude Code | 開發協作、除錯、功能實作 |

## 相關連結

- [GitHub Repository](https://github.com/andrelin39/andrelin39.github.io)
- [建站心得文章](/blog/2026/claude-code-academic-website/)

</div>

<div class="lang-en" markdown="1">

## Overview

This is the website you are currently browsing. From selecting the theme and designing the workflow, to implementing bilingual switching and building the Projects section — the entire process was completed using **Claude Code** as the primary development collaborator.

## Key Features

- **Chinese/English toggle**: ZH/EN button in the navbar; language preference persisted via `localStorage`
- **Projects section**: Three categories (research / teaching / tools) with bilingual card titles and descriptions
- **Pure Markdown workflow**: All content managed as `.md` files; auto-deployed to GitHub Pages on push
- **CV auto-rendering**: Generated from `_data/cv.yml` with bilingual field support
- **BibTeX publication management**: Publication list auto-generated from `.bib` files via jekyll-scholar

## Tech Stack

| Tool | Purpose |
|:-----|:--------|
| Jekyll + al-folio | Static site framework and theme |
| GitHub Pages | Free hosting and CDN |
| GitHub Actions | Automated build and deployment |
| Claude Code | Development collaboration, debugging, feature implementation |

## Links

- [GitHub Repository](https://github.com/andrelin39/andrelin39.github.io)
- [Blog post about this project](/blog/2026/claude-code-academic-website/)

</div>
