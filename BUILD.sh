for dir in src/*; do
  if [ -d "$dir" ]; then
    cd "$dir"
    makepkg
    cp -f *.pkg.tar.zst ../../x86_64
    rm -rf *.pkg.tar.zst pkg src *.tar.gz *LICENSE*
    cd ../..
  fi
done

cd x86_64
repo-add lunitely.db.tar.gz *.pkg.tar.zst
cd ..