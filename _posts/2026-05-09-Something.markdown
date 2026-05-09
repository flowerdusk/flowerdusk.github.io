---
layout: post
title: 在 IntelliJ IDEA 中导入 lib 目录下的 JAR 包
date: 2026-05-09
---

# 在 IntelliJ IDEA 中导入 lib 目录下的 JAR 包
1.  首先新建一个项目，将.java文件拖入src文件夹中，再右键目录新建一个名为"lib"的文件夹
2.  将.class文件拖入lib文件夹，放入脚本，双击脚本，运行完毕后删除脚本
3.  回到IDEA界面，快捷键 Ctrl + Alt + Shift + S
4.  添加依赖：
    - 左侧选择模块
    - 点击 + → JARs or directories
    - 选择lib文件夹中所有文件，点击打开
    - 再全选所有文件，点击确定
5.  当.jar文件前出现小箭头时，就成功了
