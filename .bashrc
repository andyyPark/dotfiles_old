orange=$(tput setaf 166);
yellow=$(tput setaf 228);
green=$(tput setaf 71);
white=$(tput  setaf 15);
purple=$(tput setaf 99);
bold=$(tput bold);
reset=$(tput sgr0);

git_branch() {
   git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1]/'
}

PS1="\[${bold}\]\n";
PS1+="\[${orange}\]\u";
PS1+="\[${white}\] at ";
PS1+="\[${yellow}\]\h";
PS1+="\[${white}\] in ";
PS1+="\[${green}\]\w ";
PS1+="\[${purple}\]\$(git_branch)"
PS1+="\n";
PS1+="\[${white}\]\$ \[${reset}\]";


force_color_prompt=yes

export PS1

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
