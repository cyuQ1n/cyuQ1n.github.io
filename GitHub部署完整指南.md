# GitHub Pages 个人网站部署完整指南

## 📋 目录
1. [准备工作](#准备工作)
2. [创建GitHub仓库](#创建github仓库)
3. [配置本地项目](#配置本地项目)
4. [推送代码到GitHub](#推送代码到github)
5. [配置GitHub Pages](#配置github-pages)
6. [验证部署](#验证部署)
7. [常见问题解决](#常见问题解决)

---

## 准备工作

### 必需条件
- ✅ GitHub账号（如果没有，请访问 https://github.com 注册）
- ✅ Git已安装（验证：运行 `git --version`）
- ✅ 网站代码已准备好（我们的Hugo网站）

### 重要决定
选择你的网站URL格式：

| 类型 | URL格式 | 仓库名称 | 说明 |
|------|---------|----------|------|
| **用户主站**（推荐） | `https://username.github.io` | `username.github.io` | 每个账号只能有一个 |
| 项目站点 | `https://username.github.io/project` | 任意名称 | 可以有多个 |

**本指南将创建用户主站**（像 lilianweng.github.io 那样）

---

## 创建GitHub仓库

### 步骤1：登录GitHub
1. 打开浏览器，访问 https://github.com
2. 点击右上角 **Sign in**
3. 输入用户名和密码登录

### 步骤2：创建新仓库
1. 登录后，点击右上角的 **+** 图标
2. 选择 **New repository**

   ![创建仓库](https://docs.github.com/assets/images/help/repository/repo-create.png)

### 步骤3：配置仓库信息

#### 🔴 重要：仓库命名
在 **Repository name** 输入框中，输入：
```
你的用户名.github.io
```

**示例**：
- 如果你的GitHub用户名是 `zhangsan`
- 仓库名必须是：`zhangsan.github.io`
- ⚠️ 名称必须完全匹配，大小写敏感！

#### 其他设置：
- **Description**（可选）：输入 "我的个人网站" 或 "My personal website"
- **Public/Private**：选择 **Public**（必须公开才能使用GitHub Pages）
- **Initialize this repository**：
  - ❌ 不要勾选 "Add a README file"
  - ❌ 不要选择 "Add .gitignore"
  - ❌ 不要选择 "Choose a license"

### 步骤4：创建仓库
点击绿色的 **Create repository** 按钮

创建成功后，你会看到一个快速设置页面，显示类似这样的信息：
```
Quick setup — if you've done this kind of thing before
https://github.com/你的用户名/你的用户名.github.io.git
```

**保存这个URL，后面会用到！**

---

## 配置本地项目

### 步骤1：更新网站配置

打开终端，进入项目目录：
```bash
cd /data6/qcy/claude_home/homeland/my-website
```

编辑 `hugo.toml` 文件，更新 baseURL：
```bash
# 使用你喜欢的编辑器，例如：
nano hugo.toml
# 或
vim hugo.toml
```

修改第一行：
```toml
baseURL = 'https://你的GitHub用户名.github.io/'
```

**示例**：如果用户名是 `zhangsan`：
```toml
baseURL = 'https://zhangsan.github.io/'
```

保存并退出编辑器。

### 步骤2：确认Git配置

配置Git用户信息（如果还没配置过）：
```bash
git config --global user.name "你的名字"
git config --global user.email "你的邮箱@example.com"
```

验证配置：
```bash
git config --list
```

---

## 推送代码到GitHub

### 步骤1：添加远程仓库

在项目目录中运行：
```bash
git remote add origin https://github.com/你的用户名/你的用户名.github.io.git
```

**示例**：
```bash
git remote add origin https://github.com/zhangsan/zhangsan.github.io.git
```

验证远程仓库：
```bash
git remote -v
```

应该显示：
```
origin  https://github.com/你的用户名/你的用户名.github.io.git (fetch)
origin  https://github.com/你的用户名/你的用户名.github.io.git (push)
```

### 步骤2：推送代码

```bash
git push -u origin main
```

首次推送时，GitHub会要求验证：

#### 如果提示输入用户名和密码：
- **Username**: 输入你的GitHub用户名
- **Password**: 
  - ⚠️ 不是你的账号密码！
  - 需要使用 **Personal Access Token**

#### 创建Personal Access Token（如需要）：
1. 访问 https://github.com/settings/tokens
2. 点击 **Generate new token** → **Generate new token (classic)**
3. 设置：
   - **Note**: 输入 "Website deployment"
   - **Expiration**: 选择有效期（建议90天）
   - **Scopes**: 勾选 `repo`（全部）
4. 点击 **Generate token**
5. **立即复制token**（只显示一次！）
6. 使用这个token作为密码

推送成功后显示：
```
Enumerating objects: 156, done.
Counting objects: 100% (156/156), done.
...
To https://github.com/你的用户名/你的用户名.github.io.git
 * [new branch]      main -> main
Branch 'main' set up to track remote branch 'main' from 'origin'.
```

---

## 配置GitHub Pages

### 步骤1：检查GitHub Actions

1. 在浏览器中访问你的仓库：
   ```
   https://github.com/你的用户名/你的用户名.github.io
   ```

2. 点击顶部的 **Actions** 标签

3. 你应该看到一个正在运行或已完成的工作流：
   - 名称：**Deploy Hugo site to Pages**
   - 状态：🟡运行中 或 ✅成功

4. 点击工作流查看详情，等待完成（通常需要1-2分钟）

### 步骤2：确认Pages设置

1. 点击仓库的 **Settings** 标签（在最右边）

2. 左侧菜单滚动到 **Pages** 部分，点击进入

3. 在 **Source** 部分，应该显示：
   - **Source**: GitHub Actions ✅

4. 如果看到提示：
   ```
   Your site is live at https://你的用户名.github.io/
   ```
   说明部署成功！

### 步骤3：启用Pages（如果需要）

如果Pages没有自动启用：

1. 在 **Source** 下拉菜单中选择 **GitHub Actions**
2. 点击 **Save**
3. 返回 **Actions** 标签，查看部署进度

---

## 验证部署

### 访问你的网站

1. 等待约5-10分钟（首次部署可能需要更长时间）

2. 在浏览器中访问：
   ```
   https://你的GitHub用户名.github.io/
   ```

3. 你应该看到：
   - 主页显示博客文章列表
   - 右上角有"主页"、"关于我"、"搜索"菜单
   - 点击文章可以查看详情
   - LaTeX公式正确显示

### 检查部署状态

在仓库页面，你会看到：
- 一个绿色的 ✅ 表示最新提交部署成功
- 点击它可以查看部署详情

---

## 常见问题解决

### 问题1：404错误
**症状**：访问网站显示404

**解决方案**：
1. 确认仓库名称完全正确：`你的用户名.github.io`
2. 检查Actions是否运行成功
3. 等待10-20分钟再试

### 问题2：网站内容未更新
**症状**：推送后网站没有变化

**解决方案**：
1. 清除浏览器缓存（Ctrl+F5）
2. 检查Actions是否成功运行
3. 确认推送到了main分支

### 问题3：推送失败
**症状**：git push被拒绝

**解决方案**：
```bash
# 强制推送（谨慎使用）
git push -f origin main
```

### 问题4：Actions失败
**症状**：Actions显示红色❌

**解决方案**：
1. 点击失败的工作流查看错误信息
2. 常见原因：
   - Hugo版本问题
   - 配置文件错误
   - 主题文件缺失

---

## 后续维护

### 更新网站内容

1. **添加新文章**：
   ```bash
   ~/bin/hugo new posts/新文章.md
   ```

2. **编辑文章**：
   编辑 `content/posts/` 目录下的文件

3. **提交并推送**：
   ```bash
   git add .
   git commit -m "添加新文章：文章标题"
   git push
   ```

4. **自动部署**：
   GitHub Actions会自动构建并部署

### 监控部署

- **查看部署历史**：仓库 → Actions
- **查看网站状态**：仓库 → Settings → Pages
- **获取部署通知**：Watch仓库的Actions

---

## 进阶配置

### 绑定自定义域名

1. 购买域名（如 yourname.com）
2. 在仓库Settings → Pages → Custom domain
3. 输入域名并保存
4. 配置DNS：
   - A记录指向GitHub Pages IP
   - CNAME记录指向 `你的用户名.github.io`

### 添加网站分析

1. 注册Google Analytics
2. 获取跟踪ID
3. 在 `hugo.toml` 中配置

### SEO优化

1. 添加站点地图
2. 优化meta标签
3. 提交到搜索引擎

---

## 总结

恭喜！你已经成功创建了个人GitHub Pages网站。

**你的网站信息**：
- 📍 URL: `https://你的用户名.github.io/`
- 📂 仓库: `https://github.com/你的用户名/你的用户名.github.io`
- 🚀 自动部署: 每次push到main分支
- 📝 内容管理: 编辑content目录下的markdown文件

**下一步**：
1. 自定义"关于我"页面
2. 添加更多博客文章
3. 调整网站样式和配置
4. 分享给朋友！

---

## 需要帮助？

- GitHub Pages文档：https://docs.github.com/pages
- Hugo文档：https://gohugo.io/documentation/
- PaperMod主题：https://github.com/adityatelange/hugo-PaperMod

祝你建站愉快！🎉