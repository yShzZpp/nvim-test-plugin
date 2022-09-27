function! Helloworld()
	echo "hell,world"
endfunction

command! -nargs=0 Helloworld call Helloworld() 
