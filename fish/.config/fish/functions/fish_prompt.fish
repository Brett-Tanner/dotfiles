function fish_prompt
	set_color $fish_color_cwd
	echo -n '['
	echo -n (path basename $PWD)
	echo -n '] '
	set_color normal
end

function fish_right_prompt
	set_color $fish_color_cwd
	set -g __fish_git_prompt_showdirtystate 1
	set -g __fish_git_prompt_showcolorhints 1
	echo -n (fish_git_prompt %s)
	set_color normal
end
