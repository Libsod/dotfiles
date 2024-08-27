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

function toggle_nvim -d "Minimize and maximize neovim"
  set job_id (jobs | grep 'nvim' | grep -Eo '^[0-9]+')

  if test -n "$job_id"
    fg %$job_id > /dev/null 2>&1
    commandline -f repaint
  end
end

