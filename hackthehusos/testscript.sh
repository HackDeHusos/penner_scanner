#!/bin/bash

#Farben definieren
ROT=$(tput setaf 1)
GRUEN=$(tput setaf 2)
ORANGE=$(tput setaf 3)
#BLAU=$(tput setaf 4)
#LILA=$(tput setaf 5)
HELLBLAU=$(tput setaf 6)



nmap_window() {		# TO DO	

sleep 1

clear			#Fenster neu

read -ep "$GRUEN-Welches Scan möchtest du ausführen ? 

$ROT(1)$HELLBLAU-normal		
$ROT(2)$HELLBLAU-Scan + OS Detection
$ROT(3)$HELLBLAU-dirbuster
$ROT(99)$HELLBLAU-Main
	:$ORANGE	" program_nmap
	
if [[ $program_nmap == "1" ]]
then
	nmap $wunsch_domain				# normaler nmap scan
	echo "Scan für $wunsch_domain abgeschlossen"
	
elif [[ $program_nmap == "2" ]]
then
	sudo nmap -O $domain | grep OS
	
	
	
elif [[ $program_nmap == "99" ]]
then
	clear
	main_window

else 
	echo "ungültige Eingabe..."
	sleep 1
	echo "versuche es erneut: "
	#sleep 1
	#exit
	nmap_window
fi
}



main_window() {

read -ep "$GRUEN-Welches Programm möchtest du starten ? 

$ROT(1)$HELLBLAU-nmap
$ROT(2)$HELLBLAU-dirb 	(einfacher Scan)	
$ROT(3)$HELLBLAU-dirbuster
$ROT(99)$HELLBLAU-Main
	:$ORANGE	"  program
	
if [[ $program == "1" ]]
then

	nmap_window
	
	
	#read -p "Domain eingeben z.B: google.com
	#:	" domain
	#sleep 2
	#nmap $domain
	
elif [[ $program == "2" ]]
then
	
	 read -p "Domain eingeben z.B: google.com
	:	" domain1
	sleep 2
	dirb "https://$domain1"
	
	
elif [[ $program == "99" ]]
then
	clear
	main_window

else 
	echo "ungültige Eingabe..."
	sleep 1
	echo "verlassen..."
	sleep 1
	exit
fi
}



# Hauptprogramm


figlet Lars Ritter		#Banner erstellen
figlet Hack The Husos		#Banner erstellen
echo ""


read -ep "$GRUEN-Domain eingeben oder [Enter] für gespeicherte Domains:$ROT  " domain  # domain als variable speichern

echo $domain >> domains.txt #domain in Textdatei speichern
#wc -l domains.txt | cut echo "bisher gespeicherte domains"

sleep 2

cat -n domains.txt   # Datei inkl. Zeilennummern anzeigen

sleep 2


read -p "Geben sie bitte die Zeilennummer der Wunschdomain ein:   " zeilennummer

#wunsch_domain=$(awk "NR== $zeilennummer ")

#echo $wunsch_domain
wunsch_domain=$(head -n $zeilennummer domains.txt | tail -1) #Zeile aus der Textdatei einlesen

main_window












