alias cd z
alias cdi zi
alias vi nvim
alias vim nvim
alias ls "eza"

set -gx hydro_color_pwd "079caf"
set -gx hydro_color_prompt "079caf"

set -gx LDFLAGS "-L/opt/homebrew/opt/postgresql@17/lib"
set -gx CPPFLAGS "-I/opt/homebrew/opt/postgresql@17/include"
set -gx EDITOR "nvim"
set -gx MANPAGER "nvim +Man!"
set -gx OLLAMA_API_BASE "http://192.168.10.83:11434"
set -gx DOTNET_CLI_TELEMETRY_OPTOUT "1"

if status is-interactive
    # Commands to run in interactive sessions can go here
    atuin init fish | source
end
zoxide init fish | source

# bit
if not string match -q -- "/Users/gouthamr/bin" $PATH
  set -gx PATH $PATH "/Users/gouthamr/bin"
end
# bit end

# starship init fish | source
# function fish_prompt
	# set_color brblue
	# echo -n "["(date "+%H:%M")"] "
	# set_color blue
	# echo -n (hostnamectl hostname)
	# if [ $PWD != $HOME ]
		# set_color brblack
		# echo -n ':'
		# set_color yellow
		# echo -n (basename $PWD)
	# end
	# set_color green
	# printf '%s ' (__fish_git_prompt)
	# set_color red
	# echo -n '| '
	# set_color normal
# end

# Scala related
# >>> coursier install directory >>>
set -gx PATH "$PATH:/Users/gouthamr/Library/Application Support/Coursier/bin"
# <<< coursier install directory <<<

# Added by LM Studio CLI (lms)
set -gx PATH $PATH /Users/gouthamr/.lmstudio/bin
# End of LM Studio CLI section


# pnpm
set -gx PNPM_HOME "/Users/gouthamr/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
