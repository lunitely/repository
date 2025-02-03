for dir in src/*; do
  if [ -d "$dir" ]; then
    cd "$dir"
    echo $dir
    git pull
    makepkg -cCf
    cp -f *.pkg.tar.zst ../../x86_64
    cd ../..
  fi
done

cd x86_64
repo-add lunitely.db.tar.gz *.pkg.tar.zst
cd ..