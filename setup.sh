#/bin/bash
# setup gcm
echo Download git-credential manager: https://github.com/GitCredentialManager/git-credential-manager
read -p "After you've installed it, press ENTER"
git-credential-manager-core configure
sudo apt install -y pass
git config --global credential.credentialStore gpg
gpg --default-new-key-algo rsa4096 --gen-key
read -p "Type in your newly generated pubkey:" pubkey
pass init $pubkey

# install npm
sudo apt install -y npm
sudo npm cache clean -f
sudo npm install -g n # https://github.com/tj/n
sudo n stable

# download nvim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
sudo mv nvim.appimage /usr/local/bin/nvim
git config --global core.editor "nvim"

# install packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# download nvim config
cd ~/.config/
git clone https://github.com/JonasVerbickas/nvim

# download nerdfont
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/DroidSansMono.zip
unzip DroidSansMono.zip -d ~/.fonts
fc-cache -fv
rm DroidSansMono.zip
echo "The font has been installed!"
echo "Don't forget to change your default font for your terminal profile"
