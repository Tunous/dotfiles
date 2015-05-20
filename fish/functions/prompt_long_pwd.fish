function prompt_long_pwd --description 'Print the current working directory, NOT shortened to fit the prompt'
	set -l realhome ~
	echo $PWD | sed -e "s|^$realhome|~|"
end
