#!/bin/bash

# Check de systeme d'exploitation installer 

. /etc/os-release 2>/dev/null || true
case "${ID:-}:${VERSION_ID:-}" in
  rhel:10*)   echo Telechargement du script pour RHEL10 ; 
  wget https://raw.githubusercontent.com/Arrera-linux/elk-installer/refs/heads/main/install-rhel.sh ;;
  debian:13*) echo Telechargement du script pour Debian13 ; 
  wget  https://raw.githubusercontent.com/Arrera-linux/elk-installer/refs/heads/main/install-d13.sh ;;
  debian:12*) echo Telechargement du script pour Debian12 ; 
  wget https://raw.githubusercontent.com/Arrera-linux/elk-installer/refs/heads/main/install-d12.sh ;;
  *)          echo "Imposible de lancer le script sur cette distribution" ;;
esac