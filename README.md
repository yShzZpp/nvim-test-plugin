# learnvimscriptthehardway

&nbsp;
&nbsp;

# 1 变量定义


&nbsp;

|序号|变量|描述|
|-|-|-|
|1|g:varname| 变量为全局变量|
|2|s:varname| 变量的范围为当前的脚本文件|
|3|w:varname| 变量的范围为当前的编辑器窗口|
|4|t:varname| 变量的范围为当前的编辑器选项卡|
|5|b:varname| 变量的范围为当前的编辑器缓冲区|
|6|l:varname| 变量的范围为当前的函数|
|7|a:varname| 变量是当前函数的一个参数|
|8|v:varname| 变量是Vim的预定义变量|
|9|&varname |一个Vim选项（如果指定的话，则为本地选项，否则为全局选项）|
|11|@varname|一个Vim注册器|
|12|$varname|一个环境变量|

&nbsp;


**寄存器**

&nbsp;

```vimscript
:let @a = "hello"
:echo @a			"输出hello
:echo @"			"输出剪切板0的内容
:echo @1			输出剪切板1的内容
```












&nbsp;

# 2 自动命令


&nbsp;

```vimscript
autocmd BufNewFile * : write "新建文件 自动保存
```

&nbsp;

BufNewFile: 监听的事件

* :用于事件过滤

:write :执行的命令

&nbsp;

```vimscript
autocmd FileType c,c++ autocmd BufWritePre * :Autoformat "保存前自动格式化
```

&nbsp;

:help autocmd-events
查看所有可以监听的事件

|序号|操作|描述|
|-|-|-|
|1|BufNewFile| starting to edit a non-existent file|
|2|BufReadPre BufReadPost|starting to edit an existing file|
|3|FilterReadPre FilterReadPost|read the temp file with filter output|
|4|FileReadPre FileReadPost|any other file read|

&nbsp;

# 3 操作映射

&nbsp;

输入dp会删除括号内的文字

```vimscript
onoremap p i(
		```

会在普通模式下执行这些操作

```vimscript
:normal xxx
```

会执行双引号内的操作

```vimscript
execute "xxx"
```

&nbsp;

# 4 vimscript 状态栏

&nbsp;

显示当前文件 和文件类型

```vimscript
:set statusline=%f\ -\ FileType:\ %y
```

```vimscript
set statusline=%f		"文件路径
set statusline+=\ -\	"分隔符
set statusline=%y		"文件类型
set statusline=%l		"当前行号
set statusline=%L		"总行数
set statusline=%F		"显示文件的完整路径
set statusline=%		"

set statusline=[%4l]	"设定行号至少显示4个字符宽度
```

&nbsp;

# 5 比较

&nbsp;

```vimscript

if "foo" ==? "Foo"			"无论用户设置如何,大小写都不敏感
	echo "1"
elseif "foo" ==# "Foo"		"无论用户设置如何,大小写都敏感
	ehco "2"
endif

```

# 6 函数

&nbsp;

没有作用域限制的Vimscript函数必须以一个大写字母开头

函数不定量参数

```vimscript

function Varg(...)
{
	echom a:0		"参数数量
	echom a:1		"第一个参数的值
	echo a:000		"全部参数的列表 列表不能用echo 输出
}
endfunction

call Varg("a","b")

```

&nbsp;

# 7 字符串

&nbsp;

```vimscript
echom "hello" + "world"
```

输出0

&nbsp;

``` vimscript
echom "3 mice" + "2 cats"
```
&nbsp;

输出5

vim在执行加法前会尝试把它强制转为一个number

想要连接两个字符串 通过. 运算符
```vimscript
echom "hello" . " world"
```

# 8 字符串函数

&nbsp;

计算字符串长度

```vimscript

strlen("foo")
len("foo")

```

&nbsp;

将字符串分割成列表

```vimscript

split("one two three")				"根据空格分割

split("one,two,three",",")			"根据第二个参数分割

```

&nbsp;

连接字符串

```vimscript

join(["foo","bar"],"...")			"用...连接列表里的所有字符串

join(split("one two three"),"-")	"用-连接字符串分割后的列表里面的所有字符串

```

&nbsp;

大小写转换

```vimscript

tolower("Foo")

touper("foo")

```
&nbsp;


# 9 Normal 命令

&nbsp;

```vimscript

normal		"不能避免映射
normal!		"能避免映射

```

&nbsp;

normal! 不能解析"\<cr>"这种特殊字符序列

使用execute创建命令会将特殊字符 转译出来

```vimscript
execute "normal! ^/exe\<cr>i"
```

# 10 集合

&nbsp;

## 10.1 列表

&nbsp;

vimscript列表是有序的，异质的元素集合。
越过边界也是安全的

```vimscript

echo ['foo',3,'bar']

echo ['foo',[3,'bar']]

echo ['foo',[3,'bar']][0]				"foo
echo ['foo',[3,'bar']][-2]				"foo

echo ['foo',[3,'bar']][1]				"[3,'bar']
echo ['foo',[3,'bar']][-1]				"[3,'bar']

" 切割

echo ['a','b','c','d','e'][0:2]			"['a','b','c']
echo ['a','b','c','d','e'][0:1000]		"['a','b','c','d','e']


echo ['a','b','c','d','e'][:1]			"['a','b']
echo ['a','b','c','d','e'][3;]			"['d','e']

" 字符串
echo "abcd"[0]							"a
echo "abcd"[-1]							"错误


echo "abcd"[0:2]						"abc
echo "abcd"[-2:-1]						"bc

```


