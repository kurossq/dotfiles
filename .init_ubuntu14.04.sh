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
sudo apt-get install compizconfig-settings-manager
sudo apt-get install git
sudo apt-get install nautilus-dropbox
sudo apt-get install oracle-java8-installer
sudo apt-get install unity-tweak-tool
sudo apt-get install vim-gnome

sudo apt-get update
# vimの設定ファイルを引っ張ってくる
ln -s /home/ibuki/Dropbox/dotfiles/.vim .vim
ln -s /home/ibuki/Dropbox/dotfiles/.vimrc .vimrc
ln -s /home/ibuki/Dropbox/dotfiles/.gvimrc .gvimrc
ln -s /home/ibuki/Dropbox/dotfiles/.latexmkrc .latexmkrc
