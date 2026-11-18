#!/bin/bash
# Установка GIF Panel для After Effects (macOS)
cd "$(dirname "$0")" || exit 1
SRC="$(pwd)"
DEST="$HOME/Library/Application Support/Adobe/CEP/extensions/GifPanel"

echo "Установка GIF Panel..."
rm -rf "$DEST"
mkdir -p "$DEST"
cp -R "$SRC/CSXS" "$SRC/index.html" "$SRC/host.jsx" "$DEST/"

# Разрешить неподписанные расширения (CSXS 9-12)
for v in 9 10 11 12; do
  defaults write com.adobe.CSXS.$v PlayerDebugMode 1
done
killall cfprefsd 2>/dev/null

echo
echo "Готово. Перезапусти After Effects и открой: Window > Extensions > GIF Panel"
read -n 1 -s -r -p "Нажми любую клавишу, чтобы закрыть..."
echo
