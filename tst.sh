clear
echo -e "\033[38;5;208m"
echo -e "  __ _ _ __ ___ (_)_ __   "
echo -e " / _  |  _   _ \| |  __|  "
echo -e "| (_| | | | | | | | |     "
echo -e " \__,_|_| |_| |_|_|_|     "
echo -e "\e[34m"
echo -e "  ThisIsAmiR Best BOT Developer    "
echo -e "  MY Channel & Team : @OffLiNeTeam "
echo -e "  Me In Telegram : @This_Is_AmiR   "
echo -e "  Messnger Bot : @This_Is_AmiRBot  "
echo "Please, select your language."
echo -e "\033[38;5;208m"
echo "   1) English."
echo "   2) Persian."
echo -e "\e[32m"
# options
read VAR
# English Lang
if [ "$VAR" = 1 ]; then

clear
echo -e "\e[34m"
echo "Please, select your option."
echo -e "\033[38;5;208m"
echo "   1) InFo About Amir."
echo "   2) My Team In TG."
echo "   3) Me On Telegram"
echo "   4) About OffLiNeTeam."
echo "   5) Exit."
echo -e "\e[32m"
# options
read VAR
if [ "$VAR" = 1 ]; then
	echo -e "  ThisIsAmiR Is A YoungMan And Good Developer." 
elif [ "$VAR" = 2 ]; then
	echo -e "  MY Team Is : OffLiNeTeam  And TeamChannel In Telegram : @OffLiNeTeam."
elif [ "$VAR" = 3 ]; then
	echo -e "  Me In Telegram : @This_Is_AmiR Messnger Bot : @This_Is_AmiRBot."
elif [ "$VAR" = 4 ]; then
	echo -e "My Team Begins Start In 2015/December/20 And Work About Develope."
	echo -e "Team Owner : ThisIsAmiR And AliReza."
	echo -e "You Can Join TeamChannel In Telegram With This Adders : @OffLiNeTeam."
elif [ "$VAR" = 5 ]; then
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
