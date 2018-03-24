---
title: "{{ replace .TranslationBaseName "-" " " | title }}"
date: {{ .Date }}
draft: true
tags: [thoughts]
slug: {{ .TranslationBaseName | lower }}
written: ["{{ now.Format "2006-01-02" | lower}}","{{ now.Format "2006-01" | lower}}","{{ now.Format "2006" | lower}}"]
---

