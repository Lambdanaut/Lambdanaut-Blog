sh build.sh || exit 1 # re-build if there have been any changes to site.hs
rm -rf _cache _site  # remove cache so changes take affect
xdg-open http://127.0.0.1:8000
site watch
