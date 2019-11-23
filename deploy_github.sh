cd /Users/fangzeqiang/Coding/fzqblog
# 删除打包文件夹
rm -rf public

# 打包（even是主题，用户根据自己主题名具体操作）
hugo -t even 

# 进入打包后生成的public文件夹
cd /Users/fangzeqiang/Coding/fzqblog/public

# Add changes to git | 创建git命令
# -A 表示所有内容
git init
git add -A 

# Commit changes | 添加允许此次变更的说明
msg="building site `date`"
git commit -m "$msg"

# 推送到github
git push -f git@github.com:Hereislittlemushroom/Hereislittlemushroom.github.io.git master