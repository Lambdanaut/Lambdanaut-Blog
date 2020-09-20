sh build.sh  # re-build if there have been any changes to site.hs
rm -rf _cache _site  # remove cache so changes take affect
stack exec site watch
open http://localhost:8000
