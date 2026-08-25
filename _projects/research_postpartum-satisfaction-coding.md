---
layout: project
title: AI質性資料分析
title_en: AI Qualitative Data Analysis
description: 利用大型語言模型 (LLM) 進行產後護理滿意度問卷的質性資料自動化編碼與分析。
description_en: Automated coding and analysis of postpartum care satisfaction surveys using Large Language Models (LLMs).
importance: 1
year: 2026
category: research
status: in_progress
project_type: research_method
type_label: 研究方法
type_label_en: Research Method
github: https://github.com/andrelin39/postpartum-satisfaction-coding
---

<div class="lang-zh" markdown="1">

## 專案概述

本專案旨在利用生成式 AI / 大型語言模型 (LLM) 技術，針對產後護理與住院滿意度問卷的開放式文本進行自動化質性編碼。傳統的質性分析（Qualitative Analysis）需要耗費大量人工進行文本編碼與分類，此專案透過設計精準的 Prompt 框架與模型評估，實現高信度、高效率的自動編碼流程，助力醫療照護品質的持續改善。

## 主要功能

- **自動化質性編碼**：將產後滿意度開放式回答自動分類至多個分析維度（如：醫護專業度、環境設施、情緒支持、行政流程等）。
- **信度評估 (Reliability)**：自動計算 AI 編碼與人工專家編碼之間的一致性指標（如 Cohen's Kappa），確保自動化分析的學術信度。
- **情感與主題分析**：結合情感傾向分析與主題模型，快速發掘產後婦女的核心關切、潛在需求與痛點。
- **互動式視覺化**：自動產生滿意度主題分佈、關聯性熱圖與文字雲，簡化研究報告撰寫。

## 技術棧

| 工具 / 技術           | 用途                                 |
| :-------------------- | :----------------------------------- |
| Python / LangChain    | AI 工作流編排與 LLM API 整合         |
| OpenAI GPT-4 / Claude | 核心語意分析與質性文本編碼引擎       |
| Pandas / Scikit-learn | 數據預處理、特徵工程與一致性指標計算 |
| Matplotlib / Seaborn  | 靜態圖表生成與探索性資料分析 (EDA)   |

## 相關連結

- [GitHub Repository](https://github.com/andrelin39/postpartum-satisfaction-coding)

</div>

<div class="lang-en" markdown="1">

## Overview

This project leverages Generative AI and Large Language Models (LLMs) to automate the qualitative coding of open-ended text responses from postpartum care and hospitalization satisfaction surveys. While traditional qualitative analysis is highly labor-intensive, this project establishes a high-reliability, high-efficiency automated coding pipeline through tailored prompt engineering and systematic evaluation, aiming to facilitate continuous improvement in healthcare quality.

## Key Features

- **Automated Qualitative Coding**: Automatically categorizes open-ended responses into multi-dimensional analysis nodes (e.g., medical expertise, environment/facilities, emotional support, administrative processes).
- **Inter-rater Reliability Assessment**: Computes statistical agreement indicators (such as Cohen's Kappa) between AI-generated codes and expert human coders to ensure academic rigor.
- **Sentiment & Thematic Analysis**: Combines sentiment analysis and topic modeling to quickly uncover the core concerns, latent needs, and pain points of postpartum mothers.
- **Interactive Visualization**: Generates distribution charts, correlation heatmaps, and word clouds to streamline research reporting.

## Tech Stack

| Tool / Tech           | Purpose                                                             |
| :-------------------- | :------------------------------------------------------------------ |
| Python / LangChain    | AI pipeline orchestration and LLM API integration                   |
| OpenAI GPT-4 / Claude | Core semantic analysis and qualitative coding engine                |
| Pandas / Scikit-learn | Data preprocessing, feature engineering, and reliability evaluation |
| Matplotlib / Seaborn  | Static chart generation and Exploratory Data Analysis (EDA)         |

## Links

- [GitHub Repository](https://github.com/andrelin39/postpartum-satisfaction-coding)

</div>
