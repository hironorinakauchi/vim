" Dracula Airline Theme: {{{
"
" Copyright 2016, All rights reserved
"
" Code licensed under the MIT license
" http://zenorocha.mit-license.org
"
" @author Extrante <extrante@gmail.com>
" @author Zeno Rocha <hi@zenorocha.com>
"}}}
" Helpers: {{{

func! s:clr(fg, bg, ...)
  let l:fg = get(g:dracula_palette, a:fg)
  let l:bg = get(g:dracula_palette, a:bg)
  if ! type(l:fg) == 3
    echoerr 'Color undefined in dracula_palette: ' . a:fg
  elseif ! type(l:bg) == 3
    echoerr 'Color undefined in dracula_palette: ' . a:fg
  endif
  return [ l:fg[0], l:bg[0], l:fg[1], l:bg[1] ] + filter(copy(a:000), 'type(v:val) == 1 && len(v:val) > 0')
endfunc

func! s:color_map(a, b, c, ...)
  if a:0 == 0
    return call('airline#themes#generate_color_map', [call('s:clr', a:a), call('s:clr', a:b), call('s:clr', a:c)])
  else
    return call('extend', [ call('airline#themes#generate_color_map', [call('s:clr', a:a), call('s:clr', a:b), call('s:clr', a:c)]) ] + a:000)
  endif
endfunc

"}}}

let g:airline#themes#dracula#palette = {
\   'normal': s:color_map(
\       ['bg', 'purple'],
\       ['fg', 'comment'],
\       ['fg', 'selection'],
\       {
\         'airline_warning': s:clr('bg', 'orange'),
\         'airline_error': s:clr('bg', 'red'),
\       },
\     ),
\   'insert': s:color_map(
\       ['bg', 'green'],
\       ['fg', 'comment'],
\       ['fg', 'selection'],
\       {
\         'airline_warning': s:clr('bg', 'orange'),
\         'airline_error': s:clr('bg', 'red'),
\       },
\     ),
\   'replace': s:color_map(
\       ['bg', 'orange'],
\       ['fg', 'comment'],
\       ['fg', 'selection'],
\       {
\         'airline_warning': s:clr('bg', 'orange'),
\         'airline_error': s:clr('bg', 'red'),
\       },
\     ),
\   'visual': s:color_map(
\       ['bg', 'yellow'],
\       ['fg', 'comment'],
\       ['fg', 'selection'],
\       {
\         'airline_warning': s:clr('bg', 'orange'),
\         'airline_error': s:clr('bg', 'red'),
\       },
\     ),
\   'inactive': s:color_map(
\       ['fg', 'selection'],
\       ['fg', 'selection'],
\       ['fg', 'selection'],
\     ),
\}

" Extensions: {{{
" CtrlP: {{{2
if exists('g:loaded_ctrlp')
  let g:airline#themes#dracula#palette.ctrlp = airline#extensions#ctrlp#generate_color_map(
        \ s:clr('fg', 'selection'),
        \ s:clr('fg', 'comment'),
        \ s:clr('fg', 'purple'),
        \)
endif
"}}}2
"}}}

" vim: fdm=marker ts=2 sts=2 sw=2:
