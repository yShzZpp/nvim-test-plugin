
# vim-plug

&npsp;
&npsp;

# 1 变量定义

&npsp;

g:varname 变量为全局变量
s:varname 变量的范围为当前的脚本文件
w:varname 变量的范围为当前的编辑器窗口
t:varname 变量的范围为当前的编辑器选项卡
b:varname 变量的范围为当前的编辑器缓冲区
l:varname 变量的范围为当前的函数
a:varname 变量是当前函数的一个参数
v:varname 变量是 Vim 的预定义变量
&varname 一个 Vim 选项（如果指定的话，则为本地选项，否则为全局选项）
&l:varname 本地 Vim 选项
&g:varname 全局 Vim 选项
@varname 一个 Vim 注册器
$varname 一个环境变量

&npsp;

# 2 自动命令

&npsp;

```vimscript
autocmd BufNewFile * : write "新建文件 自动保存
```

&npsp;

BufNewFile: 监听的事件
* :用于事件过滤
:write :执行的命令

&npsp;

```vimscript
autocmd FileType c,c++ autocmd BufWritePre * :Autoformat "保存前自动格式化
```

&npsp;

:help autocmd-events
查看所有可以监听的事件

```vimscript
BufNewFile			starting to edit a non-existent file
BufReadPre	BufReadPost	starting to edit an existing file
FilterReadPre	FilterReadPost	read the temp file with filter output
FileReadPre	FileReadPost	any other file read
```

&npsp;

# 3

