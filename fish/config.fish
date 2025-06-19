alias cd z
alias cdi zi
alias vi nvim
alias vim nvim
alias ls "eza"
set -gx LDFLAGS "-L/opt/homebrew/opt/postgresql@17/lib"
set -gx CPPFLAGS "-I/opt/homebrew/opt/postgresql@17/include"
set -gx EDITOR "nvim"

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
function fish_prompt
	set_color brblack
	echo -n "["(date "+%H:%M")"] "
	set_color blue
	# echo -n (hostnamectl hostname)
	if [ $PWD != $HOME ]
		set_color brblack
		# echo -n ':'
		set_color yellow
		echo -n (basename $PWD)
	end
	set_color green
	printf '%s ' (__fish_git_prompt)
	set_color red
	echo -n '| '
	set_color normal
end


# >>> coursier install directory >>>
set -gx PATH "$PATH:/Users/gouthamr/Library/Application Support/Coursier/bin"
# <<< coursier install directory <<<
