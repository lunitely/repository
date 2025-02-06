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
repo-add lunitely.db.tar.gz *.pkg.tar.zst --sign --key D3B156CAEA92A171D2885AC5BE73F23C001F42E6
cd ..
