function fish_vi_prompt
    switch $fish_bind_mode
        case default
            set_color blue
        case insert
            set_color --bold white
        case visual
            set_color --bold red
    end
    echo
    echo -n " » "
    set_color normal
end
