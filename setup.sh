# general stuff
sudo apt update -y && sudo apt upgrade -y
sudo apt install git
# terminal
sudo apt install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# nvim
sudo apt install neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
cp init.vim ~/.config/nvim/init.vim

git config --global core.editor "nvim"
