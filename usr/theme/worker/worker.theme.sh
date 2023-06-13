# OhMySh Theme Worker

# check if user is root
IS_ROOT_=""
if [ "$UID" -eq 0 ]
then
  IS_ROOT_="[ROOT]"
else
  IS_ROOT_="$(echo $HOME)"
fi

function _GIT_T(){
  if [ -n "$(OMS_GIT)" ]
  then
    echo -e "on git:${COLOR[cyan]}$(OMS_GIT)${COLOR[reset]}"
  fi
}

# function to call _GIT_T and if error return empty and echo error to /dev/null
function OMS_GIT(){
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

#PS1="\n$IS_ROOT_\n${COLOR[blue]}#${COLOR[reset]} ${COLOR[cyan]}\u${COLOR[reset]} @ ${COLOR[green]}\h${COLOR[reset]} in ${COLOR[brown]}\w${COLOR[reset]} \$(_GIT_T) [\$(date +%H:%M:%S)]\n${COLOR[red]}\$${COLOR[reset]} "
# new PS1 but # is cyan and the name of user is green the '@' is brown and the name of host is white 'in' is brown and the path is green (all that at left) and the time is cyan and the hour is green at right. the $ is red if user is not root , else is red #.
if [[ "$(id -u)" != "0" ]]; then
  PS1="[${COLOR[cyan]}\$(date +%H:%M:%S)${COLOR[reset]}] - $IS_ROOT_ \n${COLOR[cyan]}#${COLOR[reset]} ${COLOR[green]}\u${COLOR[reset]} ${COLOR[brown]}@${COLOR[reset]} ${COLOR[white]}\h${COLOR[reset]} ${COLOR[brown]}in${COLOR[reset]} ${COLOR[green]}\w${COLOR[reset]} \$(_GIT_T) \n ${COLOR[red]}\$${COLOR[reset]} "
elif [[ "$(id -u)" == "0" ]]; then
  PS1="[${COLOR[cyan]}\$(date +%H:%M:%S)${COLOR[reset]}] - $IS_ROOT_ \n${COLOR[cyan]}#${COLOR[reset]} ${COLOR[green]}\u${COLOR[reset]} ${COLOR[brown]}@${COLOR[reset]} ${COLOR[white]}\h${COLOR[reset]} ${COLOR[brown]}in${COLOR[reset]} ${COLOR[green]}\w${COLOR[reset]} \$(_GIT_T) \n ${COLOR[red]}#${COLOR[reset]} "
fi

