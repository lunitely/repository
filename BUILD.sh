for dir in src/*; do
  if [ -d "$dir" ]; then
    cd "$dir"
    makepkg
    cp -f *.pkg.tar.zst ../../
    rm -rf *.pkg.tar.zst pkg src
    cd ../..
  fi
done

repo-add lunitely.db.tar.gz *.pkg.tar.zst
