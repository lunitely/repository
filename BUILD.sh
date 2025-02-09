for dir in src/*; do
  if [ -d "$dir" ]; then
    cd "$dir"
    echo $dir
    git pull
    makepkg -cCfrs --sign
    cp -f *.pkg.tar.zst* ../../x86_64
    cd ../..
  fi
done

cd x86_64
repo-add lunitely.db.tar.gz *.pkg.tar.zst --sign --key 4B758E0A1A2F4146B53E97F6980CD593E882D694
cd ..
