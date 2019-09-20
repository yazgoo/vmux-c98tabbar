set showtabline=2
if system("uname|tr -d '\n'") == "Darwin"
  let g:c98tabbar_theme = "none"
else
  let g:c98tabbar_theme = "bot"
endif
let g:c98tabbar_redraw = 1
function! g:TimeAndBattery()
    if exists(":WindsUp")
      :WindsUp
    endif
    let l:s = ' %= '
    if exists("g:windsup")
      let l:s .= g:windsup
    endif
    let l:s .= '%#TabLineSepnullinactive# '
    let l:s .= '%#TabLineSepinactiveinactive# '
    let l:s .= system("date '+%H:%M %m-%d' | tr -d '\n'")
    let l:s .= '%#TabLineSepinactiveinactive_mod# '
    let l:s .= '%#TabLineSepinactive_modinactive_mod# '
    let l:s .= system("bat=$((which acpi 1>/dev/null 2>/dev/null && acpi || (which pmset 1>/dev/null 2>/dev/null && pmset -g batt))|grep -o '[0-9]*%' |sed 's/%//');if [ $bat -lt 20 ]; then echo -n '  '; elif [ $bat -lt 40 ];then echo -n '  '; elif [ $bat -lt 60 ]; then echo -n '  '; else echo -n '  '; fi; echo -n $bat%")
    let l:s .= '%% '
    return l:s
endfunction
let g:c98tabbar_additional_callback = 'TimeAndBattery'

function! C98TabBarRedraw(timer)
  let &ro=&ro
endfunction
let timer = timer_start(30000, 'C98TabBarRedraw', {"repeat": -1})
