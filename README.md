# SSTV Image Transfer Script

Ce script batch Windows permet de transférer automatiquement des images SSTV (.jpg, .png) depuis un dossier local vers un serveur VPS Linux via SFTP, en utilisant WinSCP.

---

## Description

Ce script est conçu pour les passionnés de SSTV souhaitant automatiser l’envoi d’images vers un dossier web accessible sur un serveur VPS. Il utilise WinSCP en mode commande pour réaliser le transfert sécurisé.

---

## Fonctionnalités

- Transfert des images JPG et PNG depuis un dossier local Windows.
- Connexion SFTP sécurisée sur un port personnalisé.
- Demande de confirmation avant le transfert (réponse O/N).
- Affichage d’une notification popup et message console pour indiquer le succès ou l’échec.
- Nettoyage automatique du script temporaire utilisé par WinSCP.

---

## Prérequis

- Windows 10 ou supérieur.
- WinSCP installé (https://winscp.net).
- Accès SSH/SFTP fonctionnel au VPS avec identifiants valides.
- Droits d’écriture sur le dossier distant `/var/www/html/sstv`.
- PowerShell activé (pour afficher les popups).

---

## Installation

1. Téléchargez et installez WinSCP.
2. Modifiez les variables en début de script selon votre configuration (chemin local, identifiants VPS, port, etc.).
3. Enregistrez le fichier batch, par exemple `sstv_send.bat`.

---

## Utilisation

- Lancez le script par double-clic ou via invite de commandes.
- Le script demande une confirmation (O pour oui, N pour non).
- En cas de confirmation, les images sont transférées.
- Une popup indique si le transfert a réussi ou échoué.

---

## Variables à configurer

| Variable   | Description                          | Exemple                           |
|------------|------------------------------------|---------------------------------|
| `IMGDIR`   | Chemin local contenant les images  | `C:\Users\conta\Documents\Image SSTV` |
| `SERVEUR`  | Adresse IP ou domaine du VPS        | `141.94.251.32`                 |
| `UTILISATEUR` | Nom utilisateur SSH sur VPS      | `debian`                       |
| `MOTDEPASSE` | Mot de passe SSH                  | `f62dmr-62`                    |
| `PORT`     | Port SSH utilisé                   | `59480`                        |
| `DESTDIR`  | Dossier cible sur le serveur       | `/var/www/html/sstv`            |
| `WINSCPEXE` | Chemin vers l’exécutable WinSCP   | `"C:\Program Files (x86)\WinSCP\WinSCP.com"` |

---

## Sécurité

- Le mot de passe est en clair dans le script, ce qui peut poser un risque.
- Pour plus de sécurité, privilégiez une authentification par clé SSH.
- Protégez l’accès à votre script et à votre machine Windows.

---

## Auteur

Réalisé par **frs077 Romuald** en 2025 pour la communauté SSTV.

---

## Licence

Libre d’utilisation et d’adaptation sous réserve de citer l’auteur.

---

## Support

Pour toute question ou suggestion, merci de me contacter directement.


