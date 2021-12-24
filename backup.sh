main() {
echo "Initializing..."
echo "
Copying files...
cp ~/.vimrc .
cp ~/.zshrc .
cp ~/.config/alacritty/alacritty.yml ./.config/alacritty
cp ~/.config/i3/* ./.config/i3/
cp ~/.config/picom/* ./.config/picom/
cp ~/.config/ranger/* ./.config/ranger/
cp -R /usr/share/fonts/TTF/* ./fonts/TTF/
cp -R /usr/share/fonts/OTF/* ./fonts/OTF/
cp /usr/share/fonts/JetBrainsMono/* ./fonts/JetBrainsMono/
cp /usr/bin/blurlock .
cp /usr/bin/i3exit .
cp ~/.p10k.zsh .
cp ~/.config/redshift/* ./.config/redshift/
cp ~/.tmux.conf .
"

cp ~/.vimrc .
cp ~/.zshrc .
cp ~/.config/alacritty/alacritty.yml ./.config/alacritty
cp ~/.config/i3/* ./.config/i3/
cp ~/.config/picom/* ./.config/picom/
cp ~/.config/ranger/* ./.config/ranger/
cp -R /usr/share/fonts/TTF/* ./fonts/TTF/
cp -R /usr/share/fonts/OTF/* ./fonts/OTF/
cp /usr/share/fonts/JetBrainsMono/* ./fonts/JetBrainsMono/
cp /usr/bin/blurlock .
cp /usr/bin/i3exit .
cp ~/.p10k.zsh .
cp ~/.config/redshift/* ./.config/redshift/
cp ~/.tmux.conf .

git status

echo "Done..."
}

echo "time:" 
time main

