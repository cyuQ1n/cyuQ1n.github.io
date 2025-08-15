# 部署到 GitHub Pages

## 方式一：部署为用户主站 (推荐)

创建 `https://YOUR_USERNAME.github.io/` 这样的个人主站：

### 1. 创建特殊命名的仓库
- 登录 GitHub
- 创建新仓库，名称必须是：`YOUR_USERNAME.github.io`
- 例如：如果你的用户名是 `john`，仓库名就是 `john.github.io`
- 设为公开仓库（Public）

### 2. 更新配置
```bash
# 编辑 hugo.toml
# 将 baseURL 改为：
baseURL = 'https://YOUR_USERNAME.github.io/'
```

### 3. 推送代码
```bash
# 添加远程仓库
git remote add origin https://github.com/YOUR_USERNAME/YOUR_USERNAME.github.io.git

# 推送代码
git push -u origin main
```

### 4. 等待部署
- GitHub Actions 会自动构建并部署
- 访问：`https://YOUR_USERNAME.github.io/`

---

## 方式二：部署为项目站点

如果你已经有了 `username.github.io` 仓库，可以创建项目站点：

### 1. 创建普通仓库
- 仓库名称：`my-website` 或任意名称

### 2. 更新配置
```bash
# 编辑 hugo.toml
baseURL = 'https://YOUR_USERNAME.github.io/my-website/'
```

### 3. 推送并配置
- 推送代码后，在 Settings > Pages 中启用 GitHub Actions

---

## 注意事项

1. **用户主站的优势**：
   - 更短的URL
   - 更专业的个人品牌
   - SEO更友好

2. **首次部署**：
   - 可能需要等待10-20分钟
   - 在 Actions 标签页查看部署进度

3. **自定义域名**：
   - 可以绑定自己的域名（如 `yourname.com`）
   - 在 Settings > Pages > Custom domain 设置