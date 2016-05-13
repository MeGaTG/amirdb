#!/bin/bash 
# running start.sh with sudo privileges.
sudo start.sh
clear
echo -e "\033[38;5;208m"
echo -e "      ____  ____ _____                        "
echo -e "     |    \|  _ )_   _|___ ____   __  __      "
echo -e "     | |_  )  _ \ | |/ .__|  _ \_|  \/  |     "
echo -e "     |____/|____/ |_|\____/\_____|_/\/\_|     "
echo -e "                                              \033[0;00m"
echo -e "          Developers @Josepdal @MaSkAoS       "
echo -e "      steady by @iicc1         start by @Jarriz  "
echo -e "\e[34m"
echo "Please, select your language."
echo -e "\033[38;5;208m"
echo "   1) English."
echo -e "\e[32m"
# Read VAR of languages. First language Spanish.
# options
# English Lang
elif [ "$VAR" = 1 ]; then
clear
echo -e "\e[34m"
echo "Please, select your option."
echo -e "\033[38;5;208m"
echo "   1) Run DBTeam (tmux)."
echo "   2) Last session (register)."
echo "   3) Last session (tmux)."
echo "   4) Close all sessions."
echo "   5) Restart DBTeam (tmux)."
echo "   6) Update DBTeam."
echo "   7) Backup DBTeam."
echo "   8) Change number."
echo "   9) Restore and Update plugins."
echo "  10) Install DBTeam."
echo "  11) Exit."
echo -e "\e[32m"
# options
read VAR
if [ "$VAR" = 1 ]; then
	tmux new-session -s script "bash steady.sh -t" 
elif [ "$VAR" = 2 ]; then
	tmux attach-session -t DBTeam
elif [ "$VAR" = 3 ]; then
	tmux attach-session -t script
elif [ "$VAR" = 4 ]; then
	killall screen
	killall telegram-cli
	killall tmux
	clear
	echo -e "\e[34m"
	echo Sessions closed.
	echo -e "\e[32m"
	echo
elif [ "$VAR" = 5 ]; then
	clear
	killall tmux
	read -n1 -r -p 'Press any key to continue...' 
	tmux new-session -s script "bash steady.sh -t" 
elif [ "$VAR" = 6 ]; then
	clear
	git pull
elif [ "$VAR" = 7 ]; then
	clear
	mkdir /home/DBTeamBackup
	rm -R /home/DBTeamBackup/DBTeam
	clear
	cp -R ../DBTeam/ /home/DBTeamBackup
	echo "Backup finished! Saved in /home/DBTeamBackup."
	read -n1 -r -p 'If you want delete all backups type bkpdel at run start.sh. Press any key to exit'
	clear
elif [ "$VAR" = 8 ]; then
	clear
	killall screen
	killall tmux
	killall telegram-cli
	rm -R ../.telegram-cli
	./launch.sh install
	read -n1 -r -p 'Finished!, press any key to the next step.'
	./launch.sh
elif [ "$VAR"  = 9 ]; then
	clear
	echo -e "\e[31m"
	echo "IMPORTANT: All your plugins will be deleted and updated."
	echo "           Any Modifications will be replaced with the DBTeam repository."
	echo "           Start.sh will make a backup in /home/DBTeamBackup/plugins."
	echo "           If you want delete all backups, type bkpdel at run Start.sh."
	echo "Are you sure?"
	echo "	Yes = y			Not= n		"
# SubVar confirmation and change color
echo -e "\e[32m"
read subVAR
	if [ "$subVAR"  = y ]; then
		mkdir /home/DBTeamBackup/
		rm -R /home/DBTeamBackup/plugins
		clear
		cp -R plugins/ /home/DBTeamBackup
		clear
		echo -e "\e[32m"
		dpkg -s subversion 2>/dev/null >/dev/null || sudo apt-get -y install subversion
		rm -rf plugins
		svn export https://github.com/Josepdal/DBTeam/trunk/plugins
		echo "Plugins restored and updated!"
		read -n1 -r -p 'Press any key to back.'
		./start.sh
	elif [ "$subVAR"  = n ]; then
		clear
		echo -e "\e[32m"
		exit
	elif [ "$subVAR" = "" ]; then
		clear
		echo -e "\e[31m"
		echo "Option invalid"
		echo -e "\e[32m"
		else
		clear
		echo -e "\e[31m"
		echo "Option invalid"
		echo -e "\e[32m"
	fi
# end
elif [ "$VAR" = 10 ]; then
	clear
	echo -e "      DBTeam installation will start.      "
	echo -e "DBTeam was developed by @Josepdal and @MaSkAoS"
	echo -e "Thanks to @iicc1 and @Jarriz because DBTeam works easily and more stable."
	read -n1 -r -p 'Press any key to start install'
	sudo apt-get update && apt-get upgrade
	read -n1 -r -p 'Step 1/3. Packages updated, Press any key to the next step'
	sudo apt-get install libreadline-dev libconfig-dev libssl-dev lua5.2 liblua5.2-dev libevent-dev make unzip git redis-server g++ libjansson-dev libpython-dev expat libexpat1-dev
	read -n1 -r -p 'Step 2/3. Dependences installed. Press any key to the next step'
	./launch.sh install
	read -n1 -r -p 'Step 3/3. Instalation finished! Thanks to install DBTeam, the team of DBTeam say thank you! We hope you like DBTeam. Then, the script will ask your number y and the confirmation code, Telegram will send a sms o Telegram msg, please, type your numer with + [Code state] [Your phone]'
	clear
	service redis-server start
	clear
	./launch.sh
elif [ "$VAR" = 11 ]; then
	clear
	exit
elif [ "$VAR" = "" ]; then
	clear
	echo -e "\e[31m"
	echo "Option invalid"
	echo -e "\e[32m"
else
	clear
	echo -e "\e[31m"
	echo "Option invalid"
	echo -e "\e[32m"
fi

