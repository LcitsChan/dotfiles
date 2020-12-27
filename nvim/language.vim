if has('mac')
  let g:python_host_prog='/usr/bin/python'
  let g:python3_host_prog='/usr/local/bin/python3'
elseif has('unix')
  let g:python_host_prog='/usr/bin/python'
  let g:python3_host_prog='/usr/bin/python3'
endif
