#!/bin/bash

# ====================================
# 部署到gh-pages分支
# ====================================

echo "开始部署到GitHub Pages..."

# 1. 构建网站
echo "构建网站..."
~/bin/hugo --minify

# 2. 进入public目录
cd public || exit

# 3. 初始化git仓库
git init
git add -A
git commit -m "Deploy to GitHub Pages $(date '+%Y-%m-%d %H:%M:%S')"

# 4. 强制推送到gh-pages分支
echo "推送到gh-pages分支..."
git branch -m master main
git push -f https://github.com/cyuQ1n/cyuQ1n.github.io.git main:gh-pages

# 5. 清理
cd ..
rm -rf public/.git

echo "✅ 部署完成！"
echo "请在GitHub仓库Settings > Pages中设置："
echo "  Source: Deploy from a branch"
echo "  Branch: gh-pages"
echo "  Folder: / (root)"
echo ""
echo "访问: https://cyuQ1n.github.io/"