# OhMySh Theme Worker

# function for check if user is root
function _ROOT(){
  if [ "$UID" -eq 0 ]
  then
    IS_ROOT_ = "${COLOR[red]}(root)${COLOR[reset]}"
  else
    IS_ROOT_ = "${COLOR[green]}(user)${COLOR[reset]}"
  fi
}

function _GIT_T(){
  if [ -n "$(OMS_GIT)" ]
  then
    echo -e "on git:${COLOR[cyan]}$(OMS_GIT)${COLOR[reset]}"
  fi
}

PS1="\n$IS_ROOT_\n${COLOR[blue]}#${COLOR[reset]} ${COLOR[cyan]}\u${COLOR[reset]} @ ${COLOR[green]}\h${COLOR[reset]} in ${COLOR[brown]}\w${COLOR[reset]} \$(_GIT_T) [\$(date +%H:%M:%S)]\n${COLOR[red]}\$${COLOR[reset]} "

