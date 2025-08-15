# 我的个人网站 | My Personal Website

[![Deploy Hugo site to Pages](https://github.com/cyuQ1n/cyuQ1n.github.io/actions/workflows/hugo.yml/badge.svg)](https://github.com/cyuQ1n/cyuQ1n.github.io/actions/workflows/hugo.yml)
[![Hugo](https://img.shields.io/badge/Hugo-0.138.0-blue.svg)](https://gohugo.io/)
[![Theme](https://img.shields.io/badge/Theme-PaperMod-green.svg)](https://github.com/adityatelange/hugo-PaperMod)

🌐 **访问地址**: [https://cyuQ1n.github.io/](https://cyuQ1n.github.io/)

这是我的个人网站和博客，使用 Hugo 静态网站生成器和 PaperMod 主题构建，通过 GitHub Actions 自动部署到 GitHub Pages。

## ✨ 功能特性

- 📝 **博客系统** - 支持 Markdown 撰写，自动生成目录
- 📐 **LaTeX 支持** - 使用 MathJax 渲染数学公式
- 🔍 **全文搜索** - 快速搜索所有文章内容
- 🌓 **主题切换** - 支持深色/浅色模式自动切换
- 📱 **响应式设计** - 完美适配移动端和桌面端
- 🚀 **自动部署** - Git 推送后自动构建发布
- 🏷️ **标签分类** - 文章标签和分类管理
- 📊 **阅读时长** - 自动计算文章阅读时间

## 🚀 快速开始

### 一键发布博客

写完文章后，只需运行：

```bash
./quick-deploy.sh
```

### 使用博客管理系统

```bash
./blog.sh
```

提供图形化菜单，包含创建文章、预览、部署等所有功能。

## 📁 项目结构

```
my-website/
├── content/           # 内容目录
│   ├── posts/        # 博客文章
│   ├── about.md      # 关于页面
│   └── search.md     # 搜索页面
├── themes/           # 主题目录
│   └── PaperMod/    # PaperMod主题
├── layouts/          # 自定义布局
│   └── partials/    # 部分模板
├── static/           # 静态资源
├── public/           # 生成的网站文件
├── hugo.toml         # Hugo配置文件
├── deploy.sh         # 部署脚本
├── quick-deploy.sh   # 快速部署脚本
├── new-post.sh       # 创建新文章脚本
└── blog.sh           # 博客管理系统
```

## 🛠️ 本地开发

### 前置要求

- Git
- Hugo Extended v0.138.0+

### 安装步骤

1. **克隆仓库**
   ```bash
   git clone https://github.com/cyuQ1n/cyuQ1n.github.io.git
   cd cyuQ1n.github.io
   ```

2. **安装 Hugo**
   ```bash
   # macOS
   brew install hugo
   
   # Ubuntu/Debian
   sudo snap install hugo
   
   # Windows
   choco install hugo-extended
   ```

3. **启动开发服务器**
   ```bash
   hugo server -D
   # 访问 http://localhost:1313
   ```

## 📝 内容管理

### 创建新文章

使用脚本创建（推荐）：
```bash
./new-post.sh
```

或手动创建：
```bash
hugo new posts/my-article.md
```

### 文章模板

```markdown
---
title: "文章标题"
date: 2025-08-15T10:00:00+08:00
draft: false
tags: ["标签1", "标签2"]
categories: ["分类"]
math: true  # 启用 LaTeX
summary: "文章摘要"
---

文章内容...
```

### LaTeX 公式

行内公式：`$E = mc^2$`

独立公式：
```latex
$$
\int_a^b f(x)dx = F(b) - F(a)
$$
```

## 🚀 部署流程

### 自动部署

每次推送到 `main` 分支会自动触发 GitHub Actions 工作流：

1. 构建 Hugo 网站
2. 生成静态文件
3. 部署到 GitHub Pages
4. 1-2分钟后生效

### 手动部署

```bash
# 方式1：快速部署
./quick-deploy.sh

# 方式2：交互式部署
./deploy.sh

# 方式3：手动操作
hugo --minify
git add .
git commit -m "Update content"
git push origin main
```

## 🔧 配置说明

### 网站配置

编辑 `hugo.toml` 修改网站设置：

- `baseURL`: 网站地址
- `title`: 网站标题
- `author`: 作者信息
- `social`: 社交链接

### 主题定制

- 颜色主题：`params.defaultTheme`
- 首页模式：`params.profileMode.enabled`
- 导航菜单：`menu.main`

## 📊 GitHub Actions

工作流配置：`.github/workflows/hugo.yml`

- 触发条件：推送到 main 分支
- Hugo 版本：0.138.0
- 部署目标：GitHub Pages

查看部署状态：[Actions](https://github.com/cyuQ1n/cyuQ1n.github.io/actions)

## 🤝 贡献

欢迎提交 Issue 和 Pull Request！

## 📄 许可证

本项目采用 [MIT License](LICENSE) 开源协议。

## 🙏 致谢

- [Hugo](https://gohugo.io/) - 静态网站生成器
- [PaperMod](https://github.com/adityatelange/hugo-PaperMod) - Hugo 主题
- [GitHub Pages](https://pages.github.com/) - 网站托管

## 📮 联系方式

- 网站：[https://cyuQ1n.github.io/](https://cyuQ1n.github.io/)
- GitHub：[@cyuQ1n](https://github.com/cyuQ1n)
- Email：your-email@example.com

---

⭐ 如果这个项目对你有帮助，欢迎给个 Star！