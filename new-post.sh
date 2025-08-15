#!/bin/bash

# ====================================
# 创建新博客文章脚本
# ====================================

# 颜色定义
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m'

echo "========================================="
echo "        创建新的博客文章"
echo "========================================="
echo ""

# 1. 获取文章标题
echo -e "${YELLOW}请输入文章标题（中文或英文）：${NC}"
read -r title

if [ -z "$title" ]; then
    echo -e "${RED}错误：标题不能为空${NC}"
    exit 1
fi

# 2. 获取文件名
echo -e "${YELLOW}请输入文件名（英文，不含空格，如: my-first-post）：${NC}"
read -r filename

if [ -z "$filename" ]; then
    # 如果没有输入文件名，自动生成
    filename=$(echo "$title" | tr '[:upper:]' '[:lower:]' | tr ' ' '-' | tr -cd '[:alnum:]-')
    echo -e "${BLUE}自动生成文件名: $filename${NC}"
fi

# 3. 询问是否需要LaTeX支持
echo -e "${YELLOW}是否需要LaTeX数学公式支持？(y/n)：${NC}"
read -r need_math

math_support="false"
if [[ "$need_math" =~ ^[Yy]$ ]]; then
    math_support="true"
fi

# 4. 获取标签
echo -e "${YELLOW}请输入标签（用逗号分隔，如: Hugo,博客,技术）：${NC}"
read -r tags_input

# 将标签转换为YAML数组格式
IFS=',' read -ra TAGS <<< "$tags_input"
tags_yaml="["
for tag in "${TAGS[@]}"; do
    tag=$(echo "$tag" | xargs) # 去除空格
    if [ ! -z "$tag" ]; then
        tags_yaml="${tags_yaml}\"$tag\", "
    fi
done
tags_yaml="${tags_yaml%??}]" # 移除最后的逗号和空格

# 5. 获取分类
echo -e "${YELLOW}请输入分类（如: 技术、生活、随笔）：${NC}"
read -r category

if [ -z "$category" ]; then
    category="未分类"
fi

# 6. 创建文章文件
post_path="content/posts/${filename}.md"
current_date=$(date '+%Y-%m-%dT%H:%M:%S+08:00')

# 7. 生成文章模板
cat > "$post_path" << EOF
---
title: "$title"
date: $current_date
draft: false
tags: $tags_yaml
categories: ["$category"]
math: $math_support
summary: "这里填写文章摘要..."
---

# $title

## 引言

在这里写你的引言...

## 主要内容

### 第一部分

你的内容...

### 第二部分

更多内容...

## 代码示例

\`\`\`bash
# 代码示例
echo "Hello World"
\`\`\`

EOF

# 如果需要LaTeX，添加示例
if [[ "$math_support" == "true" ]]; then
    cat >> "$post_path" << 'EOF'
## 数学公式示例

行内公式：$E = mc^2$

独立公式：

$$
\int_a^b f(x)dx = F(b) - F(a)
$$

EOF
fi

# 添加结尾
cat >> "$post_path" << EOF

## 总结

在这里写总结...

---

*感谢阅读！如有问题，欢迎留言讨论。*
EOF

echo ""
echo -e "${GREEN}✅ 文章创建成功！${NC}"
echo -e "${BLUE}文件位置: $post_path${NC}"
echo ""
echo -e "${YELLOW}下一步操作：${NC}"
echo "1. 编辑文章: vim $post_path"
echo "2. 本地预览: ~/bin/hugo server -D"
echo "3. 发布文章: ./deploy.sh"
echo ""
echo -e "${GREEN}祝写作愉快！📝${NC}"