#!/bin/bash

# ====================================
# Hugo博客管理系统
# 一站式管理你的博客
# ====================================

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m'

# 显示菜单
show_menu() {
    clear
    echo -e "${CYAN}╔════════════════════════════════════════╗${NC}"
    echo -e "${CYAN}║        Hugo 博客管理系统 v1.0          ║${NC}"
    echo -e "${CYAN}╚════════════════════════════════════════╝${NC}"
    echo ""
    echo -e "${GREEN}请选择操作：${NC}"
    echo ""
    echo -e "${YELLOW}  1)${NC} 📝 创建新文章"
    echo -e "${YELLOW}  2)${NC} 👁️  本地预览网站"
    echo -e "${YELLOW}  3)${NC} 🚀 部署到GitHub（完整流程）"
    echo -e "${YELLOW}  4)${NC} ⚡ 快速部署（一键发布）"
    echo -e "${YELLOW}  5)${NC} 📊 查看Git状态"
    echo -e "${YELLOW}  6)${NC} 🔄 拉取最新代码"
    echo -e "${YELLOW}  7)${NC} 📁 查看文章列表"
    echo -e "${YELLOW}  8)${NC} 🛠️  构建静态网站"
    echo -e "${YELLOW}  9)${NC} 📚 查看帮助文档"
    echo -e "${YELLOW}  0)${NC} 🚪 退出"
    echo ""
    echo -e "${PURPLE}════════════════════════════════════════${NC}"
}

# 创建新文章
create_post() {
    echo -e "${GREEN}创建新文章...${NC}"
    ./new-post.sh
    read -p "按Enter键返回主菜单..."
}

# 本地预览
local_preview() {
    echo -e "${GREEN}启动本地预览服务器...${NC}"
    echo -e "${YELLOW}访问 http://localhost:1313 查看网站${NC}"
    echo -e "${RED}按 Ctrl+C 停止服务器${NC}"
    ~/bin/hugo server -D
}

# 完整部署
full_deploy() {
    echo -e "${GREEN}开始完整部署流程...${NC}"
    ./deploy.sh
    read -p "按Enter键返回主菜单..."
}

# 快速部署
quick_deploy() {
    echo -e "${GREEN}快速部署...${NC}"
    ./quick-deploy.sh
    read -p "按Enter键返回主菜单..."
}

# 查看Git状态
git_status() {
    echo -e "${GREEN}Git仓库状态：${NC}"
    echo ""
    git status
    echo ""
    echo -e "${BLUE}最近的提交：${NC}"
    git log --oneline -5
    read -p "按Enter键返回主菜单..."
}

# 拉取最新代码
git_pull() {
    echo -e "${GREEN}从GitHub拉取最新代码...${NC}"
    git pull origin main
    read -p "按Enter键返回主菜单..."
}

# 查看文章列表
list_posts() {
    echo -e "${GREEN}博客文章列表：${NC}"
    echo ""
    echo -e "${YELLOW}content/posts/ 目录下的文章：${NC}"
    ls -la content/posts/*.md 2>/dev/null | awk '{print "  - " $9}'
    echo ""
    post_count=$(ls content/posts/*.md 2>/dev/null | wc -l)
    echo -e "${BLUE}共 $post_count 篇文章${NC}"
    read -p "按Enter键返回主菜单..."
}

# 构建网站
build_site() {
    echo -e "${GREEN}构建静态网站...${NC}"
    ~/bin/hugo --minify
    echo ""
    echo -e "${GREEN}✅ 构建完成！${NC}"
    echo -e "${BLUE}静态文件位于 public/ 目录${NC}"
    read -p "按Enter键返回主菜单..."
}

# 显示帮助
show_help() {
    clear
    echo -e "${CYAN}════════════════════════════════════════${NC}"
    echo -e "${CYAN}           使用帮助${NC}"
    echo -e "${CYAN}════════════════════════════════════════${NC}"
    echo ""
    echo -e "${GREEN}快速开始：${NC}"
    echo "1. 选择'1'创建新文章"
    echo "2. 编辑文章内容"
    echo "3. 选择'2'本地预览"
    echo "4. 选择'3'或'4'部署到GitHub"
    echo ""
    echo -e "${GREEN}文件结构：${NC}"
    echo "content/posts/   - 博客文章目录"
    echo "content/about.md - 关于页面"
    echo "hugo.toml       - 网站配置文件"
    echo "themes/         - 主题目录"
    echo ""
    echo -e "${GREEN}常用命令：${NC}"
    echo "./blog.sh       - 启动管理系统"
    echo "./new-post.sh   - 创建新文章"
    echo "./deploy.sh     - 完整部署流程"
    echo "./quick-deploy.sh - 快速部署"
    echo ""
    echo -e "${GREEN}网站地址：${NC}"
    github_url=$(git remote get-url origin 2>/dev/null)
    if [ ! -z "$github_url" ]; then
        github_username=$(echo $github_url | sed -n 's/.*github.com[:/]\([^/]*\).*/\1/p')
        echo "https://${github_username}.github.io/"
    fi
    echo ""
    read -p "按Enter键返回主菜单..."
}

# 主循环
while true; do
    show_menu
    read -p "请输入选项 [0-9]: " choice
    
    case $choice in
        1) create_post ;;
        2) local_preview ;;
        3) full_deploy ;;
        4) quick_deploy ;;
        5) git_status ;;
        6) git_pull ;;
        7) list_posts ;;
        8) build_site ;;
        9) show_help ;;
        0) 
            echo -e "${GREEN}感谢使用！再见！${NC}"
            exit 0
            ;;
        *)
            echo -e "${RED}无效选项，请重新选择${NC}"
            sleep 1
            ;;
    esac
done