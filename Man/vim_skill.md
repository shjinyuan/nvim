vim 查找相同的两行,以及删除重复行
要查找相同的两行，先将内容排序，然后查找前一行等于后一行者
删除重复行（先排一下序）：
```
:sort
:g/^\(.\+\)$\n\1/d
```


匹配所有行首到[" 并删除
```
:%s#^.*\["##gc
```
匹配逗号到行尾，并替换成,\
``` :%s#,.*\\#,\#gc ```
















