# alias PS="pipenv shell"

function PS --wraps='pipenv shell' --description 'Alias to run pipenv shell'
    pipenv shell $argv
end
