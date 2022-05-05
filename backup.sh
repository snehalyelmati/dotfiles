main() {
echo "Initializing..."
echo "
Copying files...
cp ~/.vimrc .
cp ~/.zshrc .
cp ~/.config/alacritty/alacritty.yml ./.config/alacritty
cp ~/.config/i3/* ./.config/i3/
cp ~/.config/nvim/* ./.config/nvim/
cp ~/.config/picom/* ./.config/picom/
cp ~/.config/ranger/* ./.config/ranger/
rm -r ./fonts/TTF; mkdir ./fonts/TTF; cp -R /usr/share/fonts/TTF/* ./fonts/TTF/
rm -r ./fonts/OTF; mkdir ./fonts/OTF; cp -R /usr/share/fonts/OTF/* ./fonts/OTF/
cp /usr/share/fonts/JetBrainsMono/* ./fonts/JetBrainsMono/
cp /usr/bin/blurlock .
cp /usr/bin/i3exit .
cp ~/.p10k.zsh .
cp ~/.config/redshift/* ./.config/redshift/
cp ~/.tmux.conf .
rm -r ./.scripts; mkdir .scripts; cp ~/.scripts/* ./.scripts/
"

cp ~/.vimrc .
cp ~/.zshrc .
cp ~/.config/alacritty/alacritty.yml ./.config/alacritty
cp ~/.config/i3/* ./.config/i3/
cp ~/.config/nvim/* ./.config/nvim/
cp ~/.config/picom/* ./.config/picom/
cp ~/.config/ranger/* ./.config/ranger/
rm -r ./fonts/TTF; mkdir ./fonts/TTF; cp -R /usr/share/fonts/TTF/* ./fonts/TTF/
rm -r ./fonts/OTF; mkdir ./fonts/OTF; cp -R /usr/share/fonts/OTF/* ./fonts/OTF/
cp /usr/share/fonts/JetBrainsMono/* ./fonts/JetBrainsMono/
cp /usr/bin/blurlock .
cp /usr/bin/i3exit .
cp ~/.p10k.zsh .
cp ~/.config/redshift/* ./.config/redshift/
cp ~/.tmux.conf .
rm -r ./.scripts; mkdir .scripts; cp ~/.scripts/* ./.scripts/

git status

echo ""
echo "Done."
echo "Updating dotfiles management to stow soon..."
}

echo "time:" 
time main

