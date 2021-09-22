orange=$(tput setaf 166);
yellow=$(tput setaf 228);
green=$(tput setaf 71);
white=$(tput setaf 15);
bold=$(tput bold);
reset=$(tput sgr0);
DarkGoldenrod=$(tput setaf 136)
teal=$(tput setaf 6);
SteelBlue3=$(tput setaf 68)
Yellow2=$(tput setaf 190)


PS1="\[${bold}\]\n";
PS1+="\[${teal}\]\u"; # username
PS1+="\[${white}\] at ";
PS1+="\[${DarkGoldenrod}\]\h"; # host
PS1+="\[${white}\] in ";
PS1+="\[${green}\]\W" # working directory
PS1+="\n";
PS1+="\[${white}\]\$ \[${reset}\]"; # `$` {and reset color}
export PS1;


# cat ~/.wikidates/$(date +%B_%d)| shuf -n 1 | sed -n s/\\^\[[0-9]*\]//p
alias config='$(which git) --git-dir=$HOME/.cfg/ --work-tree=$HOME'

