#!/usr/bin/env bash

cd $HOME/tdcli

install() {
	    cd tg
		sudo add-apt-repository ppa:ubuntu-toolchain-r/test
		sudo apt-get install g++-4.7 c++-4.7
		sudo apt-get update		
                sudo apt-get upgrade
		sudo apt-get install libreadline-dev libconfig-dev libssl-dev lua5.2 liblua5.2-dev lua-socket lua-sec lua-expat libevent-dev make unzip git redis-server autoconf g++ libjansson-dev libpython-dev expat libexpat1-dev
		sudo apt-get install lua-lgi
		sudo apt-get install libnotify-dev
		sudo apt-get install screen
		sudo apt-get install tmux
		wget https://valtman.name/files/telegram-cli-1222
		mv telegram-cli-1222 tgcli
		chmod +x tgcli
		cd ..
		chmod +x bot
		chmod +x tg
}
case $1 in
    install)
    	show_logo_slowly
    	configure ${2}
    	exit ;;
    update)
    	show_logo
    	update
    	exit ;;
	tmux)
    	if [ ! -f "/usr/bin/tmux" ]; then echo "Please install tmux"; exit; fi
		ok=`tmux new-session -s $TMUX_SESSION -d "./bin/telegram-cli -s ./bot/bot.lua"`
		if [[ $ok ]]; then echo "New session tmux: ${TMUX_SESSION}"; else echo "Error while run tgcli"; fi
    	exit ;;
	attach)
    	if [ ! -f "/usr/bin/tmux" ]; then echo "Please install tmux"; exit; fi
		tmux attach-session -t $TMUX_SESSION
    	exit ;;
	kill)
    	if [ ! -f "/usr/bin/tmux" ]; then echo "Please install tmux"; exit; fi
		tmux kill-session -t $TMUX_SESSION
    	exit ;;
	
		
if [ ! -f ./tg/tgcli ]; then
    echo "tg not found"
    echo "Run $0 install"
    exit 1
 fi

   echo -e "\033[38;5;208m"
   echo -e "     > Thunder  [Beta]   Bolt                   "
   echo -e "                                              \033[0;00m"
   echo -e "\e[36m"
   ./tg/tgcli -s ./core/system.lua -l 1 -E $@
fi
		
