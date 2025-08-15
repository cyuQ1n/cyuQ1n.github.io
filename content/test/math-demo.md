---
title: "数学公式演示：LaTeX支持"
date: 2025-08-15T11:00:00+08:00
draft: false
tags: ["数学", "LaTeX", "教程"]
categories: ["技术"]
math: true
summary: "演示如何在博客中使用LaTeX数学公式。"
---

# 数学公式演示

这篇文章演示了如何在博客中使用LaTeX语法来显示数学公式。

## 行内公式

你可以在文本中嵌入行内公式，例如：爱因斯坦的质能方程 $E = mc^2$，或者勾股定理 $a^2 + b^2 = c^2$。

## 独立公式

### 基础数学

二次方程的求根公式：

$$x = \frac{-b \pm \sqrt{b^2 - 4ac}}{2a}$$

### 微积分

导数的定义：

$$f'(x) = \lim_{h \to 0} \frac{f(x+h) - f(x)}{h}$$

定积分：

$$\int_a^b f(x)dx = F(b) - F(a)$$

### 线性代数

矩阵乘法：

$$\begin{bmatrix}
a & b \\
c & d
\end{bmatrix}
\begin{bmatrix}
x \\
y
\end{bmatrix}
=
\begin{bmatrix}
ax + by \\
cx + dy
\end{bmatrix}$$

特征值方程：

$$\det(A - \lambda I) = 0$$

### 概率统计

正态分布的概率密度函数：

$$f(x) = \frac{1}{\sigma\sqrt{2\pi}} e^{-\frac{1}{2}\left(\frac{x-\mu}{\sigma}\right)^2}$$

贝叶斯定理：

$$P(A|B) = \frac{P(B|A)P(A)}{P(B)}$$

### 级数

泰勒级数展开：

$$f(x) = \sum_{n=0}^{\infty} \frac{f^{(n)}(a)}{n!}(x-a)^n$$

欧拉公式：

$$e^{i\theta} = \cos\theta + i\sin\theta$$

### 复杂公式

麦克斯韦方程组（微分形式）：

$$\begin{align}
\nabla \cdot \mathbf{E} &= \frac{\rho}{\epsilon_0} \\
\nabla \cdot \mathbf{B} &= 0 \\
\nabla \times \mathbf{E} &= -\frac{\partial \mathbf{B}}{\partial t} \\
\nabla \times \mathbf{B} &= \mu_0\mathbf{J} + \mu_0\epsilon_0\frac{\partial \mathbf{E}}{\partial t}
\end{align}$$

## 总结

通过配置MathJax，我们可以在Hugo博客中轻松使用LaTeX语法来展示各种数学公式。这对于撰写技术文章、学术笔记非常有用。

只需要在文章的front matter中设置 `math: true`，就可以启用数学公式渲染功能。