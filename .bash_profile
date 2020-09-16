# Load the shell dotfiles
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; 
do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Case-insensitive globbing
shopt -s nocaseglob;

# Append to the Bash History file
shopt -s histappend;

# Autocorrect typos in path names
shopt -s cdspell;

# Enable tab completion for `g` by marking it as an alias for `git`
if type _git &> /dev/null; then
	complete -o default -o nospace -F _git g;
fi;


