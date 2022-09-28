" my nvim test plug

"""""""""""""""""""value"""""""""""""""""""

" 通过init.vim 设置的变量
if !exists("g:weather_city")
    let g:weather_city = "深圳"
endif

"""""""""""""""""""lua"""""""""""""""""""
lua << EOF

local test_status_record = {}
vim.notify = require("notify")

function test_status_notify(city,msg, level)
  local notify_opts = { title ="天气", timeout = 3000, hide_from_history = false, on_close = reset_status_record }
  -- if test_status_record is not {} then add it to notify_opts to key called "replace"
  if test_status_record ~= {} then
    notify_opts["replace"] = test_status_record.id
  end
  test_status_record = vim.notify(msg, level, notify_opts)
end

function reset_status_record(window)
  test_status_record = {}
end

EOF


"""""""""""""""""func"""""""""""""""""

" 局部函数
fu! s:init()
	echo "init"
endfu

" 全局函数
fu! Ysh()
	" echom "Helloworld 2 " . g:ysh_test_value
	" call s:init()
	" 清空屏幕
	silent !clear
	silent execute "! ~/mygit/nvim-test-plug/bin/get-weather.sh" 
	let g:data=readfile("/home/zzpp/mygit/nvim-test-plug/bin/weather-data")

	call v:lua.test_status_notify(g:weather_city,g:data,"info")
endfu


fu! Callback(count) dict
 let thecounter=a:count
 while thecounter>0
     echom "call for " . self.name . " at the ". thecounter "times"
     let thecounter -=1
 endwhile
endfu
let context={"name": "dictfun"}
let Func =function('Callback', [3], context)


command! -nargs=0  Ysh call Ysh() 
