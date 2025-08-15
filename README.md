# 我的个人网站

这是我的个人网站，使用 Hugo 静态网站生成器和 PaperMod 主题构建。

## 功能特性

- 📝 博客系统
- 📐 LaTeX 数学公式支持
- 🔍 全文搜索
- 🌓 深色/浅色主题切换
- 📱 响应式设计

## 本地开发

### 安装 Hugo

```bash
# macOS
brew install hugo

# Linux
snap install hugo

# Windows
choco install hugo-extended
```

### 运行网站

```bash
# 克隆仓库
git clone https://github.com/YOUR_GITHUB_USERNAME/YOUR_GITHUB_USERNAME.github.io.git
cd YOUR_GITHUB_USERNAME.github.io

# 启动开发服务器
hugo server -D

# 访问 http://localhost:1313
```

### 添加新文章

```bash
hugo new posts/article-name.md
```

在文章中启用 LaTeX：

```yaml
---
title: "文章标题"
date: 2025-08-15
math: true
---
```

## 部署

网站通过 GitHub Actions 自动部署到 GitHub Pages。

每次推送到 `main` 分支时，都会自动构建并部署网站。

## 许可证

MIT License