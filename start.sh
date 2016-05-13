#!/bin/bash 
# running start.sh with sudo privileges.
sudo start.sh
clear
echo -e "\033[38;5;208m"
echo -e "\033[38;5;208m  ___   __  __ _     _ _   _     _____                        \033[0;00m"
echo -e "\033[38;5;208m / _ \ / _|/ _| |   (_) \ | | __|_   _|__  __ _ _ __ ___      \033[0;00m"
echo -e "\033[38;5;208m| | | | |_| |_| |   | |  \| |/ _ \| |/ _ \/ _` | '_ ` _ \     \033[0;00m"
echo -e "\033[38;5;208m| |_| |  _|  _| |___| | |\  |  __/| |  __/ (_| | | | | | |    \033[0;00m"
echo -e "\033[38;5;208m \___/|_| |_| |_____|_|_| \_|\___||_|\___|\__,_|_| |_| |_|    \033[0;00m"
echo -e "\033[38;5;208m                                            @OffLiNeTeam      \033[0;00m"
echo -e "\e[34m"
echo "Please, select your language."
echo -e "\033[38;5;208m"
echo "   1) English."
echo "   2) فارسی."
echo "   3) Portuguese."
echo -e "\e[32m"
# Read VAR of languages. First language Spanish.
# options
read VAR
if [ "$VAR" = 2 ]; then
clear
echo -e "\e[34m"
echo "لطفا زبان را انتخاب کنید."
echo -e "\033[38;5;208m"
echo "   1) اجرای سورس ما (tmux)."
echo "   2) ترمینال قبلی (registros)"
echo "   3) ترمینال قبلی (tmux)."
echo "   4) بستن همه ترمینال ها."
echo "   5) ری استارت  (tmux)."
echo "   6) اپدیدت کردن."
echo "   7) گرفتن بکاپ"
echo "   8) تعویض شماره."
echo "   9) بازیابی و اپدیت پلاگین ها."
echo "  10) نصب سورس."
echo "  11) خروج."
echo -e "\e[32m"
# Suboptions spanish
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
	echo ترمینال ها بسته شدند.
	echo -e "\e[32m"
elif [ "$VAR" = 5 ]; then
	clear
	killall tmux
	read -n1 -r p 'برای ادامه کلید کنید' 
	tmux new-session -s script "bash steady.sh -t" 
elif [ "$VAR" = 6 ]; then
	clear
	git pull
elif [ "$VAR" = 7 ]; then
	clear
	mkdir /home/OffLiNeTGBackup
	rm -R /home/OffLiNeBackup/OffLiNeTG
	clear
	cp -R ../OffLiNeTG/ /home/OffLiNeTGBackup
	echo "بکاپ زخیره شد در /home/OffLiNeTG."
	read -n1 -r -p 'اگر تمایل به پاک کردن تمام بکاپ ها دارید bkpdel را تایپ کنید تا اجرا شود  برای خروج یک دکمه دلخواه را فشار دهید'
	clear
elif [ "$VAR" = 8 ]; then
	clear
	killall screen
	killall tmux
	killall telegram-cli
	rm -R ../.telegram-cli
	./launch.sh install
	read -n1 -r -p 'تموم شدش !!برای رفتن به مرحله بعدی کلیدی بزنید'
	./launch.sh
elif [ "$VAR"  = 9 ]; then
	clear
	echo -e "\e[31m"
	echo "مهم : تمام پلاگین ها پاک و آپدیدت شدند."
	echo "هرگونه تغییرات در سورس اصلی اعمال خواهد شد."
	echo "یک بکاپ کامل در home/OffLiNeTGBackup/pluginsگرفته شده است .
	echo "اگر تمایل به پاک کردن تمام بکاپ ها دارید bkpdel را تایپ کنید تا اجرا شود."
	echo "آیا مطمئن هستید؟"
	echo "	Si = نه		No = بله	"
# SubVar confirmation and change color.
echo -e "\e[32m"
read subVAR
	if [ "$subVAR"  = y ]; then
		mkdir /home/OffLiNeTGBackup
		rm -R /home/OffLiNeTGBackup/plugins
		clear
		cp -R plugins/ /home/OffLiNeTGBackup
		clear
		echo -e "\e[32m"
		dpkg -s subversion 2>/dev/null >/dev/null || sudo apt-get -y install subversion
		rm -rf plugins
		svn export https://github.com/thisisamir/OffLiNeTG/trunk/plugins
		echo "پلاگین ها بازیابی و اپدید شدند"
		read -n1 -r -p 'برای برگشت یک کلید انتخاب کنید'
		./start.sh 
	elif [ "$subVAR"  = n ]; then
		clear
		echo -e "\e[32m"
		exit
	elif [ "$subVAR" = "" ]; then
		clear
		echo -e "\e[31m"
		echo "گزینه نامعتبر"
		echo -e "\e[32m"
		else
		clear
		echo -e "\e[31m"
		echo "گزینه نامعتبر"
		echo -e "\e[32m"
	fi
# end
elif [ "$VAR" = 10 ]; then
	clear
	echo -e "      نصب سورس افلاین شروع می شود.      "
	echo -e "نوشته شده توسط تیم افلاین"
	read -n1 -r -p 'برای شروع کلیدی به دلخواه بزنید'
	sudo apt-get update && apt-get upgrade
	sudo apt-get install libreadline-dev libconfig-dev libssl-dev lua5.2 liblua5.2-dev libevent-dev make unzip git redis-server g++ libjansson-dev libpython-dev expat libexpat1-dev
	./launch.sh install
	read -n1 -r -p 'Paso 3/3. نصب به پایان رسید . از شما برای انتخاب افلاین تشکر میکنیم برای اجرا شدن ربات شماره ربات و کد ورود به تلگرام را وارد نمایید'
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
	echo "گزینه نامعتبر"
	echo -e "\e[32m"
	else
	clear
	echo -e "\e[31m"
	echo "گزینه نامعتبر"
	echo -e "\e[32m"
fi

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
