#!/bin/bash
bGiris="Bilgi Girisi"
mainMenu () {
	CHOICE=$(whiptail --menu "Secimini yap " 18 100 10 \
		"Bilgi Girisi" "" \
		"Kayıt Arama" "" \
		"Tum kayitlari göster" "" \
		"Kayit sil" "" \
		"Cikis" "" 3>&1 1>&2 2>&3)
	if [ -z "$CHOICE" ]
	then
	 echo "None"
	elif [ "$CHOICE" == "Bilgi Girisi" ]
	then
		bilgiGiris
	elif [ "$CHOICE" == "Kayıt Arama" ]
	then
		kayitArama
	elif [ "$CHOICE" == "Tum kayitlari göster" ]
	then
		kayitlarGoster
	elif [ "$CHOICE" == "Kayit sil" ]
	then
		kayitlariSil
	elif [ "$CHOICE" == "Cikis" ]
	then
		Cikis
	else
		echo "Secim yapilmadi !"
	fi
	}
bilgiGiris () {
	NAME=$(whiptail --inputbox "Adinizi Girin" 10 100 3>&1 1>&2 2>&3)
	echo "$NAME" >> test.txt
	mainMenu
}

kayitArama () {
	QUERY=$(whiptail --inputbox "Aranacak kayidi girin" 10 100 3>&1 1>&2 2>&3)
	RESULT=`cat test.txt | grep "$QUERY"`
	echo "$RESULT"
	if [ "$RESULT" == "" ]
	then
		whiptail --msgbox "Kayit Bulunamadi !" 10 100
	else
		whiptail --msgbox "$RESULT" 10 100
	fi
	mainMenu
}

kayitlarGoster () {
	whiptail --textbox test.txt 10 100 --scrolltext
	mainMenu
}

kayitlariSil () {
	` > test.txt`
	mainMenu
}

Cikis () {
	exit 0 
}

mainMenu	

