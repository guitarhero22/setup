function rsync_ () {
    build_server=${1:-ninja184}
    dir=`pwd`
    base=`basename $dir`

    exclude_files=("build" ".git" "third_party/packages.built" "log" ".vscode" ".vim-arsync")

    echo "Syncing $base to $build_server..."
    cmd="rsync -rztve ssh --progress --delete"

    for ex in "${exclude_files[@]}"
    do
    cmd="$cmd --exclude $ex"
    done

    cmd="$cmd $dir/ rushabhk@$build_server:/home/rushabhk/$base/"

    $cmd

    if [[ "$?" -eq 0 ]]
    then
        echo "Done..."
    else
        echo "Failed..."
    fi
}
