function pipenv --wrap=pipenv
    if test "$argv" = "shell"
        set -l init_cmd ""

        if test -f .env
            echo "Loading .env environment variables..."
            while read -l line
                string match -q -r '^\s*#' "$line"; and continue
                string match -q -r '^\s*$' "$line"; and continue

                set -l kv (string split -m 1 = $line)
                set -l key $kv[1]
                set -l value $kv[2]

                set value (string trim -c '"\' ' -- $value)

                set -gx $key $value
            end < .env
        end

        set init_cmd $init_cmd "source (command pipenv --venv)/bin/activate.fish"

        fish -i -C "$init_cmd"
    else
        command pipenv $argv
    end
end
