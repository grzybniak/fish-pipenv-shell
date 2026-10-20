function pipenv --wrap=pipenv
    if test "$argv" = "shell"
        set -l init_cmd ""

        if test -f .env
            set init_cmd $init_cmd "
            if test -f .env
                while read -l line
                    if not string match -qr '^(\s*#|\s*\$)' \"\$line\"
                        set -l kv (string split -m 1 '=' \"\$line\")
                        set -gx \$kv (string trim -c '\"'\'' ' \$kv)
                    end
                end < .env
            end
            "
        end

        set init_cmd $init_cmd "source (command pipenv --venv)/bin/activate.fish"

        fish -i -C "$init_cmd"
    else
        command pipenv $argv
    end
end
