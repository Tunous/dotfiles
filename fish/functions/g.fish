function g
    if [ (count $argv) = 0 ]
        git status -sb
    else
        git $argv
    end
end
