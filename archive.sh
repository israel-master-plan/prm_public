output_dirname="distributions"

[ ! -d "./$output_dirname" ] && mkdir "./$output_dirname"

git archive --worktree-attributes --format=tar.gz HEAD > "$output_dirname/prm_v1.0.0.tar.gz"
