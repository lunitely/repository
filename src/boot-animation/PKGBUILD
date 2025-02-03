pkgname=boot-animation
pkgver=1.0
pkgrel=1
pkgdesc="Boot Animation for Lunitely"
arch=('any')
url="https://lunitely.hackrland.dev"
license=('MIT')
depends=('plymouth')

prepare() {
	cp -af ../theme/. "$srcdir"
  cp -af ../boot-animation.hook "$srcdir"
}

package() {
	(find lunitely -type f -exec install -Dm 644 "{}" "$pkgdir/usr/share/plymouth/themes/{}" \;)
  install -Dm 644 "$srcdir/boot-animation.hook" "$pkgdir/etc/pacman.d/hooks/boot-animation.hook"
  chmod +x "$pkgdir/etc/pacman.d/hooks/boot-animation.hook"
}