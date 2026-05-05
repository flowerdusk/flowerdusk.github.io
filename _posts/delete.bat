@echo off
cd /d D:\MyBlogs\myblog
git add .
git commit -m "删除了一篇文章"
git push
echo 已删除文章并同步到仓库！
pause