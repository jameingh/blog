if [ ! -d "./publish/" ]; then
    echo "========= Publish folder does't exist, clone from remote now =========="
    
    git clone git@github.com:jameingh/jameingh.github.io.git publish

    echo "========= Clone publish files complete =========="
    
    else

    echo " Publish folder already exists"
fi

echo "========= Hexo generate =========="

## && 只有左边的执行成功才能执行右边的
hexo clean && hexo g && \cp -rf public/ publish/ 

# rm -rf publish/*

echo "========= Hexo generate complete ========="

cd publish

echo "========= Git commit start ========="

# git init 

git pull

git add . 

git commit -m 'add files' 

echo "========= Git commit compelete ========="

# git remote add origin git@github.com:jameingh/jameingh.github.io.git 

echo "========= Git push start ========="

git push -u origin main

echo "========= Git push compelete ========="
