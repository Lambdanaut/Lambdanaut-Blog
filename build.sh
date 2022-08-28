cabal install --overwrite-policy=always || exit 1
rm -rf _cache _site
site build || exit 1
