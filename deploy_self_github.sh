cd /Users/fangzeqiang/Desktop/fzqblog

# Add changes to git | 创建git命令
# -A 表示所有内容
git init
git add -A 

# Commit changes | 添加允许此次变更的说明
msg="building site `date`"
git commit -m "$msg"

# 推送到github
git push -f git@github.com:Hereislittlemushroom/fzqblog.git master