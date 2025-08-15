#!/bin/bash

# ====================================
# Hugo网站自动部署脚本
# 功能：自动构建并推送到GitHub Pages
# ====================================

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# 打印带颜色的消息
print_message() {
    echo -e "${2}${1}${NC}"
}

# 错误处理
error_exit() {
    print_message "❌ 错误: $1" "$RED"
    exit 1
}

# 显示脚本标题
clear
echo "========================================="
echo "   Hugo 个人网站自动部署脚本 v1.0"
echo "========================================="
echo ""

# 1. 检查当前目录
print_message "📁 检查工作目录..." "$BLUE"
if [ ! -f "hugo.toml" ]; then
    error_exit "未找到hugo.toml文件，请在网站根目录运行此脚本"
fi
print_message "✅ 工作目录正确" "$GREEN"
echo ""

# 2. 检查Git状态
print_message "🔍 检查Git状态..." "$BLUE"
if [ ! -d ".git" ]; then
    error_exit "当前目录不是Git仓库"
fi

# 检查是否有未提交的更改
if ! git diff-index --quiet HEAD --; then
    print_message "📝 检测到未提交的更改：" "$YELLOW"
    git status --short
    echo ""
fi

# 3. 构建网站
print_message "🔨 构建Hugo网站..." "$BLUE"
~/bin/hugo --minify
if [ $? -ne 0 ]; then
    error_exit "Hugo构建失败"
fi
print_message "✅ 网站构建成功" "$GREEN"
echo ""

# 4. 获取提交信息
print_message "💬 请输入提交信息（直接回车使用默认信息）：" "$YELLOW"
read -r commit_message

# 如果没有输入，使用默认消息
if [ -z "$commit_message" ]; then
    commit_message="Update blog content $(date '+%Y-%m-%d %H:%M:%S')"
fi

# 5. Git操作
print_message "📤 准备提交到GitHub..." "$BLUE"

# 添加所有更改
git add -A

# 显示即将提交的文件
print_message "📋 即将提交以下更改：" "$YELLOW"
git status --short
echo ""

# 确认是否继续
print_message "❓ 是否继续提交？(y/n) " "$YELLOW"
read -r confirm
if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
    print_message "⚠️  已取消操作" "$YELLOW"
    exit 0
fi

# 提交更改
print_message "📝 提交更改..." "$BLUE"
git commit -m "$commit_message"
if [ $? -ne 0 ]; then
    print_message "⚠️  没有需要提交的更改" "$YELLOW"
fi

# 6. 推送到GitHub
print_message "🚀 推送到GitHub..." "$BLUE"
git push origin main
if [ $? -ne 0 ]; then
    error_exit "推送失败，请检查网络连接和GitHub认证"
fi
print_message "✅ 推送成功！" "$GREEN"
echo ""

# 7. 显示部署信息
print_message "🎉 部署完成！" "$GREEN"
echo ""
print_message "📊 部署信息：" "$BLUE"
echo "  - 提交信息: $commit_message"
echo "  - 提交时间: $(date '+%Y-%m-%d %H:%M:%S')"
echo "  - 分支: main"
echo ""

# 获取GitHub用户名（从remote URL提取）
github_url=$(git remote get-url origin)
github_username=$(echo $github_url | sed -n 's/.*github.com[:/]\([^/]*\).*/\1/p')

if [ ! -z "$github_username" ]; then
    print_message "🌐 网站地址：" "$BLUE"
    echo "  https://${github_username}.github.io/"
    echo ""
    print_message "📈 查看部署状态：" "$BLUE"
    echo "  https://github.com/${github_username}/${github_username}.github.io/actions"
    echo ""
fi

print_message "⏰ 提示：GitHub Pages通常需要1-2分钟完成部署" "$YELLOW"
print_message "🎯 部署成功后即可访问你的网站查看更新" "$GREEN"
echo ""
echo "========================================="
echo "         感谢使用自动部署脚本！"
echo "========================================="