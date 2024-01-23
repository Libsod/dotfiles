function mkdcd -d "Create a directory and set CWD"
    command mkdir $argv
    if test $status = 0
        switch $argv[(count $argv)]
            case '-*'

            case '*'
                cd $argv[(count $argv)]
                return
        end
    end
end

function fsd -d "Change directory via cd & fzf"
  set -l tmp_dir $(fd --type d | fzf)
  if test -n "$tmp_dir"
    cd $tmp_dir
  end
end
