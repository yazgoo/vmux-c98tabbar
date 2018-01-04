set showtabline=2
if system("uname|tr -d '\n'") == "Darwin"
  let g:c98tabbar_theme = "mid"
else
  let g:c98tabbar_theme = "bot"
endif
let g:c98tabbar_redraw = 1
function! g:TimeAndBattery()
    let l:s = ' %= '
    let l:s .= system("date '+%H:%M %m-%d' | tr -d '\n'")
    let l:s .= ' '
    let l:s .= system("(which acpi 1>/dev/null 2>/dev/null && acpi || (which pmset 1>/dev/null 2>/dev/null && pmset -g batt))|grep -o '[0-9]*%'")
    let l:s .= '%%'
    return l:s
endfunction
let g:c98tabbar_additional_callback = 'TimeAndBattery'

function! C98TabBarRedraw(timer)
  let &ro=&ro
endfunction
let timer = timer_start(30000, 'C98TabBarRedraw', {"repeat": -1})
