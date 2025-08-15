#!/bin/bash

# ====================================
# 快速部署脚本 - 一键发布
# ====================================

# 颜色定义
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${GREEN}🚀 开始快速部署...${NC}"

# 1. 构建网站
echo -e "${YELLOW}构建网站...${NC}"
~/bin/hugo --minify

# 2. 添加所有更改
git add -A

# 3. 提交（使用时间戳作为默认消息）
commit_msg="Update blog: $(date '+%Y-%m-%d %H:%M')"
git commit -m "$commit_msg"

# 4. 推送到GitHub
echo -e "${YELLOW}推送到GitHub...${NC}"
git push origin main

echo -e "${GREEN}✅ 部署完成！${NC}"
echo "提交信息: $commit_msg"
echo ""
echo "请等待1-2分钟后访问你的网站查看更新"