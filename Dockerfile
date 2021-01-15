FROM kalilinux/kali-rolling

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y \
    vim \
    git \
    fish

RUN chsh -s $(which fish) root

RUN mkdir ~/.gitrepos ~/.vim
RUN git clone https://github.com/bonohub13/vim_settings.git ~/.gitrepos/vim_settings
RUN git clone https://github.com/morhetz/gruvbox.git ~/.gitrepos/gruvbox
RUN cp -r ~/.gitrepos/gruvbox/colors ~/.vim
RUN cp ~/.gitrepos/vim_settings/.vimrc ~/

# additionally added packages
## network stuff
RUN apt-get install -y \
    yersinia \
    net-tools
## other stuff
RUN apt-get install -y \
    x11-apps

CMD fish
