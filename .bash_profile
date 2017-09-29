
alias vi="vim"

parse_git_branch() {
	red='\[\033[0;31m\]'
	green='\[\033[0;32m\]'
	color_off='\[\033[0m\['

	if [ $(git rev-parse --is-inside-work-tree &>/dev/null; printf "%s" $?) == 0 ]; then
		branch=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')
		color=$green
		if [ $(git diff-index --quiet HEAD -- &>/dev/null; printf "%s" $?) -ne 0 ]; then
			color=$red
		fi
		echo -e "$color$branch$color_off"
	else
		return
	fi
}

set_prompt() {
	export PS1="\u@\h:\[\033[0;34m\]\W$(parse_git_branch)\[\033[0m\]:"
}

export PROMPT_COMMAND='set_prompt'
