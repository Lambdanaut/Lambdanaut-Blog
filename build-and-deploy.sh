echo "Building..."
sh build.sh
echo "Copying site to ../lambdanaut.github.io"
sh copy_site.sh
echo "Committing to Git..."
cd ../lambdanaut.github.io
git add .
git commit -m "commit-date: `date '+%Y-%m-%d %H:%M:%S'`"
echo "Pushing to remote..."
git push origin master
cd ../Lambdanaut
echo "Complete!"
