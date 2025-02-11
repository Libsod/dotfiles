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

function CMake_build_and_run_debug
    set project_name (pcregrep -o1 -o2 -o3 'set\s*\(\s*PROJECT_NAME\s*"([^"]+)"\s*\)|set\s*\(\s*PROJECT_NAME\s*([^\s)]+)\s*\)|project\s*\(\s*([^\s)]+)\s*\)' CMakeLists.txt | head -n 1)

    set executable_name (pcregrep -o1 "add_executable\s*\(\s*\${PROJECT_NAME}\s+([^\s]+)\s*\)" CMakeLists.txt)

    if test -z "$executable_name"
        set executable_name (pcregrep -o1 "add_executable\s*\(\s*([^\s]+)\s+.*\)" CMakeLists.txt)
    end

    if test -n "$executable_name"
        set executable_name (echo $executable_name | sed "s/\${PROJECT_NAME}/$project_name/")
    end

    if test -n "$executable_name"
        cgd
        cbd
      
        sleep 0.3
        cl

        if test -x "./build/Debug/$executable_name"
            ./build/Debug/$executable_name
        else
            echo "Executable $executable_name not found in build directory."
        end
    else
        echo "Executable not found in CMakeLists.txt"
    end
end


function CMake_build_and_run_release
    set project_name (pcregrep -o1 -o2 -o3 'set\s*\(\s*PROJECT_NAME\s*"([^"]+)"\s*\)|set\s*\(\s*PROJECT_NAME\s*([^\s)]+)\s*\)|project\s*\(\s*([^\s)]+)\s*\)' CMakeLists.txt | head -n 1)

    set executable_name (pcregrep -o1 "add_executable\s*\(\s*\${PROJECT_NAME}\s+([^\s]+)\s*\)" CMakeLists.txt)

    if test -z "$executable_name"
        set executable_name (pcregrep -o1 "add_executable\s*\(\s*([^\s]+)\s+.*\)" CMakeLists.txt)
    end

    if test -n "$executable_name"
        set executable_name (echo $executable_name | sed "s/\${PROJECT_NAME}/$project_name/")
    end

    if test -n "$executable_name"
        cgr
        cbr
      
        sleep 0.3
        cl

        if test -x "./build/Release/$executable_name"
            ./build/Release/$executable_name
        else
            echo "Executable $executable_name not found in build directory."
        end
    else
        echo "Executable not found in CMakeLists.txt"
    end
end
