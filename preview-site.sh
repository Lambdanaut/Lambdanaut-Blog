sh build.sh  # re-build if there have been any changes to site.hs
rm -rf _cache _site  # remove cache so changes take affect
open http://localhost:8000
stack exec site watch
