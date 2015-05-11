# Ibuki's dotfiles
This is Ubuntu config files
## git clone
```
$ git clone git://github.com/Ibuki-E/dotfiles.git  
$ cd dotfiles  
$ chmod 755 .init_ubuntu14.04.sh  
$ sudo ./.init_ubuntu14.04.sh  
```
## use github in UECWireless
```
$ git config --global http.proxy http://proxy.uec.ac.jp:8080  
$ git config --global https.proxy http://proxy.uec.ac.jp:8080  
$ echo Host github.com >> ~/.ssh/config  
$ echo 	HostName ssh.github.com >> ~/.ssh/config  
$ echo 	port 443 >> ~/.ssh/config  
$ echo 	proxycommand nc -X connect -x proxy.uec.ac.jp:8080 %h %p >> ~/.ssh/config  
```
