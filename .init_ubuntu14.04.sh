#!/bin/bash
sudo apt-get update
sudo apt-get upgrade

# 大文字と小文字を検索で無視
echo set completion-ignore-case on >> .inputrc
# mozcで半角/全角切り替え
sudo echo /usr/bin/xset -r 49 >> /etc/X11/Xsession.d/98vboxadd-xclient
# スクロールバーを普通な感じに
gsettings set com.canonical.desktop.interface scrollbar-mode normal
# dashの広告無効化
gsettings set com.canonical.Unity.Lenses disabled-scopes "['more_suggestions-amazon.scope', 'more_suggestions-u1ms.scope', 'more_suggestions-populartracks.scope', 'music-musicstore.scope', 'more_suggestions-ebay.scope', 'more_suggestions-ubuntushop.scope', 'more_suggestions-skimlinks.scope']"
# geditの文字化け対策
gsettings set org.gnome.gedit.preferences.encodings auto-detected "['UTF-8','CURRENT','SHIFT_JIS','EUC-JP','ISO-2022-JP','UTF-16']"
gsettings set org.gnome.gedit.preferences.encodings shown-in-menu "['UTF-8','SHIFT_JIS','EUC-JP','ISO-2022-JP','UTF-16']"
# capslockをctrlへ
# ただし，WindowsのVirtualBox上では行ってはいけない
# windowsのレジストリを操作して変更すること
dconf write /org/gnome/desktop/input-sources/xkb-options "['ctrl:nocaps']"
# 日本語フォルダ名を英語に直す
env LANGUAGE=C LC_MESSAGES=C xdg-user-dirs-gtk-update

# Ubuntu Web Appsの削除
sudo apt-get remove unity-webapps-common xul-ext-unity xul-ext-websites-integration
# Java8 ppa
sudo add-apt-repository ppa:webupd8team/java

# 各種ツールのインストール
# gccに代わるエラーが綺麗に表示されるコンパイラ
sudo apt-get install clang
# ubuntu設定用
sudo apt-get install compizconfig-settings-manager
sudo apt-get install dconf-editor
# 
sudo apt-get install epstool
# gitは便利
sudo apt-get install git
# 端末を閉じても繋がる，sshの代わりみたいに使える
sudo apt-get install mosh
# mysql-serverをたてる人はどうぞ
sudo apt-get install mysql-server
sudo apt-get install mysql-workbench
# dropboxを導入
sudo apt-get install nautilus-dropbox
# java8をインストール
sudo apt-get install oracle-java8-installer
# pdfを分割したり結合したりするツール
sudo apt-get install pdftk
# pythonのライブラリ
sudo apt-get install python-numpy python-scipy
sudo apt-get install unity-tweak-tool
# vim is 
sudo apt-get install vim-gnome

# ricty設定時に落としたもの
#sudo apt-get install ppa-purge
#sudo ppa-purge ppa:pi-rho/security
#sudo apt-get install fontforge
#sudo apt-get install ttf-inconsolata
#sudo apt-get install fonts-inconsolata

sudo apt-get update
# uecのproxyを通してgithubを使うための設定
# githubを使いたい人は以下のコメントを実行してください
#git config --global http.proxy http://proxy.uec.ac.jp:8080
#git config --global https.proxy http://proxy.uec.ac.jp:8080
# vimの設定ファイルを引っ張ってくる
git clone git@github.com:Ibuki-E/dotfiles.git
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.gvimrc ~/.gvimrc
ln -s ~/dotfiles/.vim ~/.vim
ln -s ~/dotfiles/.latexmkrc ~/.latexmkrc
ln -s ~/dotfiles/.fonts ~/.fonts
