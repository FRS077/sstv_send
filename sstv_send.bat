:: ================================================================
:: Script de transfert automatique d’images SSTV via SFTP/WinSCP
:: Réalisé par frs077 Romuald en 2025 pour le projet SSTV SVXLink.
::
:: Utilisation :
::  Ce script envoie toutes les images (.jpg et .png) présentes dans
::  le dossier local spécifié vers un serveur VPS Linux dans le dossier
::  /var/www/html/sstv, via le protocole SFTP sur le port configuré.
::
:: Configurez les variables en fonction de votre environnement,
:: puis lancez simplement le fichier par double-clic ou en ligne de commande.
:: Un message s’affiche pour confirmer le succès ou l’échec du transfert.
::
:: Destiné aux passionnés et développeurs du monde radioamateur SSTV.
:: ================================================================

@echo off
setlocal

rem ------------------------------------------------------
rem Chemin local vers le dossier des images à transférer
set IMGDIR=C:\Users\conta\Documents\Image SSTV

rem ------------------------------------------------------
rem Identifiants de connexion au serveur VPS
set SERVEUR=141.15.222.32
set UTILISATEUR=linux
set MOTDEPASSE=Polux
set PORT=22

rem ------------------------------------------------------
rem Dossier de destination sur le serveur Linux
set DESTDIR=/var/www/html/sstv

rem ------------------------------------------------------
rem Chemin vers l’exécutable WinSCP (doit être installé sur la machine)
set WINSCPEXE="C:\Program Files (x86)\WinSCP\WinSCP.com"

rem ------------------------------------------------------
rem Demande de confirmation utilisateur avant transfert (O = oui, N = non)
set /p ACCEPT="Voulez-vous lancer le transfert des images vers le serveur (O/N) ? "

rem Transforme la valeur en majuscule pour gestion robuste
set ACCEPT=%ACCEPT:~0,1%
if /I NOT "%ACCEPT%"=="O" (
    echo Transfert annulé par l'utilisateur.
    powershell -command "Add-Type -AssemblyName PresentationFramework; [System.Windows.MessageBox]::Show('Transfert annulé.','Info')"
    endlocal
    exit /b
)

rem ------------------------------------------------------
rem Génère dynamiquement le script WinSCP pour la connexion et le transfert
echo open sftp://%UTILISATEUR%:%MOTDEPASSE%@%SERVEUR%:%PORT% > transfert.winscp
echo lcd "%IMGDIR%" >> transfert.winscp
echo cd "%DESTDIR%" >> transfert.winscp
echo put *.jpg *.png >> transfert.winscp
echo exit >> transfert.winscp

rem ------------------------------------------------------
rem Exécute WinSCP avec le script généré
%WINSCPEXE% /script=transfert.winscp

rem ------------------------------------------------------
rem Affiche un message de succès ou d’échec selon le résultat du transfert
if %ERRORLEVEL% EQU 0 (
    echo Transfert OK !
    powershell -command "Add-Type -AssemblyName PresentationFramework; [System.Windows.MessageBox]::Show('Transfert OK !','Info')"
) else (
    echo Erreur de transfert
    powershell -command "Add-Type -AssemblyName PresentationFramework; [System.Windows.MessageBox]::Show('Erreur de transfert !','Erreur')"
)

rem ------------------------------------------------------
rem Efface le script WinSCP temporairement généré
del transfert.winscp

endlocal
