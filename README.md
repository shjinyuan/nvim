#help list
## tmux
~/.config/nvim/Man/tmux.md

## nvim_config

## Todo List


## Others

- Add empty folder in git
```
list=$(find . -type d -empty) #查找所有空目录
for i in $list 
do
   cd $i            #进入改目录
   touch .tmp   #创建一个空文件
   cd -              #返回当前目录
 done
```
