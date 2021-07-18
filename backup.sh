main() {
echo "Initializing..."
echo "
Copying files...
cp ~/.vimrc .
cp ~/.zshrc .
cp ~/.config/alacritty/alacritty.yml ./.config/alacritty
cp ~/.config/i3/* ./.config/i3/
cp ~/.config/ranger/* ./.config/ranger/
cp -R /usr/share/fonts/TTF/* ./fonts/TTF/
cp -R /usr/share/fonts/OTF/* ./fonts/OTF/
cp /usr/share/fonts/JetBrainsMono/* ./fonts/JetBrainsMono/
cp /usr/bin/blurlock .
cp /usr/bin/i3exit .
"

cp ~/.vimrc .
cp ~/.zshrc .
cp ~/.config/alacritty/alacritty.yml ./.config/alacritty
cp ~/.config/i3/* ./.config/i3/
cp ~/.config/ranger/* ./.config/ranger/
cp -R /usr/share/fonts/TTF/* ./fonts/TTF/
cp -R /usr/share/fonts/OTF/* ./fonts/OTF/
cp /usr/share/fonts/JetBrainsMono/* ./fonts/JetBrainsMono/
cp /usr/bin/blurlock .
cp /usr/bin/i3exit .

echo "Done..."
}

echo "time:" 
time main

