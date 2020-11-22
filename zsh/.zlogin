{
	# Compile completion dump to increase startup speed
	zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"
	if [[ -s "$zcompdump" && (! -s "${zcompdump}.zwc" || 
		"$zcompdump" -nt "${zcompdump}.zwc") ]]
		then
			zcompile "$zcompdump"
	fi
} &!

# TMUX: auto-start
if command -v tmux &> /dev/null &&  # command tmux exists
	[ -n "$PS1" ] &&  # shell is interactive
	[[ ! "$TERM" =~ screen ]] &&  # screen not running
	[[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]  # tmux not running
then
	exec tmux new-session -A -s main
fi
