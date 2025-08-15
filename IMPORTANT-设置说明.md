# 🔴 重要：GitHub Pages 设置说明

## 立即执行以下步骤：

### 1. 访问仓库设置
打开浏览器，访问：
https://github.com/cyuQ1n/cyuQ1n.github.io/settings/pages

### 2. 配置 GitHub Pages

在 **Source** 部分，进行以下设置：

- **Source**: 选择 `Deploy from a branch`
- **Branch**: 选择 `gh-pages` 
- **Folder**: 选择 `/ (root)`

然后点击 **Save** 按钮。

### 3. 等待部署

- 等待 1-2 分钟
- 刷新页面，你应该看到：
  ```
  Your site is live at https://cyuQ1n.github.io/
  ```

### 4. 访问网站

访问：https://cyuQ1n.github.io/

## ✅ 验证清单

- [ ] 已设置 Source 为 "Deploy from a branch"
- [ ] 已选择 gh-pages 分支
- [ ] 已选择 / (root) 文件夹
- [ ] 已点击 Save
- [ ] 看到 "Your site is live at..." 消息
- [ ] 可以访问网站并看到博客内容（不是README）

## 🔧 后续部署

以后更新网站时，使用：

```bash
./deploy-gh-pages.sh
```

这个脚本会自动：
1. 构建网站
2. 推送到 gh-pages 分支
3. GitHub Pages 自动更新

## ❓ 常见问题

### 还是显示 README？
- 确保选择的是 `gh-pages` 分支，不是 `main` 分支
- 清除浏览器缓存（Ctrl+F5）
- 等待 5 分钟再试

### 404 错误？
- 检查是否已经执行了 `./deploy-gh-pages.sh`
- 确认 gh-pages 分支存在
- 等待几分钟让 GitHub Pages 完成部署

---

**立即去设置！** 👉 https://github.com/cyuQ1n/cyuQ1n.github.io/settings/pages