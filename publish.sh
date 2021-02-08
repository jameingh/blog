echo "========= hexo generate =========="

## && 只有左边的执行成功才能执行右边的
hexo clean && hexo g && \cp -rf public/ publish/ 

# rm -rf publish/*

echo "========= hexo generate complete ========="

cd publish

echo "========= git commit start ========="

# git init 

git add . 

git commit -m 'add files' 

echo "========= git commit compelete ========="

# git remote add origin git@github.com:jameingh/jameingh.github.io.git 

echo "========= git push start ========="

git push -u origin main

echo "========= git push compelete ========="
