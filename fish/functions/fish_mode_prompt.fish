function fish_mode_prompt --description 'Displays the current mode'
  # Do nothing if not in vi mode
  if set -q __fish_vi_mode
    switch $fish_bind_mode
        case default
            set_color blue
        case insert
            set_color --bold white
        case visual
            set_color --bold red
    end
  end
end
