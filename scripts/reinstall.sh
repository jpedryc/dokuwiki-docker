#!/bin/bash

echo "Reinstalling DokuWiki"

# Variables
DOKUWIKI_SRC=""
CURRENT_REINSTALL_BACKUP_DIR=""

echo -n "-- Checking .env file ... "
if [ -f ".env" ]; then
  echo "found!"
else
  echo "not found!"
  echo "[ERROR] First create an .env file and make sure the 'DOKUWIKI_SRC' variable is correctly set"
  exit 1
fi

echo -n "-- Checking DOKUWIKI_SRC variable ... "
DOKUWIKI_SRC=$(cut -d "=" -f2- <<< "$(grep DOKUWIKI_SRC < .env)")
if [ -n "$DOKUWIKI_SRC" ]; then
  echo "found!"
else
  echo "not found!"
  echo "[ERROR] DOKUWIKI_SRC variable either not found in an .env file or invalid"
  exit 1
fi

# Check if backups directory exists
echo -n "-- Checking 'backups' directory ... "
if [ -d "backups" ]; then
  echo "found!"
else
  echo "not found!"
  mkdir backups
  echo "-- * Directory for backups created!"
fi

# Check if reinstall directory exists
echo -n "-- Checking 'backups/reinstall' directory ... "
if [ -d "backups/reinstall" ]; then
  echo "found!"
else
  echo "not found!"
  mkdir backups/reinstall
  echo "-- * Directory for reinstall files created!"
fi

# Create directory for current reinstall files
CURRENT_REINSTALL_BACKUP_DIR=$(date +%F_%H-%M-%S)
echo -n "-- Creating 'backups/reinstall/$CURRENT_REINSTALL_BACKUP_DIR' for backup files ... "
mkdir backups/reinstall/"$CURRENT_REINSTALL_BACKUP_DIR"
echo "done!"

# Check /conf/local.php
echo -n "-- Checking 'conf/local.php' ... "
if [ -f "$DOKUWIKI_SRC/conf/local.php" ]; then
  echo "found!"
  mv "$DOKUWIKI_SRC/conf/local.php" backups/reinstall/"$CURRENT_REINSTALL_BACKUP_DIR"/local.php
  echo "-- * conf/local.php moved!"
else
  echo "not found!"
fi

# Check /conf/plugins.local.php
echo -n "-- Checking 'conf/plugins.local.php' ... "
if [ -f "$DOKUWIKI_SRC/conf/plugins.local.php" ]; then
  echo "found!"
  mv "$DOKUWIKI_SRC/conf/plugins.local.php" backups/reinstall/"$CURRENT_REINSTALL_BACKUP_DIR"/plugins.local.php
  echo "-- * conf/plugins.local.php moved!"
else
  echo "not found!"
fi

# Check /conf/users.auth.php
echo -n "-- Checking 'conf/users.auth.php' ... "
if [ -f "$DOKUWIKI_SRC/conf/users.auth.php" ]; then
  echo "found!"
  mv "$DOKUWIKI_SRC/conf/users.auth.php" backups/reinstall/"$CURRENT_REINSTALL_BACKUP_DIR"/users.auth.php
  echo "-- * conf/users.auth.php moved!"
else
  echo "not found!"
fi

# Check /conf/acl.auth.php
echo -n "-- Checking 'conf/acl.auth.php' ... "
if [ -f "$DOKUWIKI_SRC/conf/acl.auth.php" ]; then
  echo "found!"
  mv "$DOKUWIKI_SRC/conf/acl.auth.php" backups/reinstall/"$CURRENT_REINSTALL_BACKUP_DIR"/acl.auth.php
  echo "-- * conf/acl.auth.php moved!"
else
  echo "not found!"
fi