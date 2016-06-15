#!/bin/bash
# This script upgrades a sendy installation, retaining the configuration,
# languages & uploads.

if [ $# -ne 1 ]; then
    echo "Usage: sendy_upgrade.sh <upgrade zip file>"
    echo ""
    echo "    sendy_upgrade.sh ~/sendy-2.0.1.zip"
    exit
fi

SENDY_PACKAGE="$1"
SENDY_INSTALL_DIR="/var/www/html"

# Unzip the package
UNZIP_DIR="$HOME/sendy"
TEMP_SENDY_DIR="$UNZIP_DIR/sendy"
mkdir -p $UNZIP_DIR
unzip $SENDY_PACKAGE -d $UNZIP_DIR

# Remove files we will replace
rm -rf $TEMP_SENDY_DIR/includes/config.php $TEMP_SENDY_DIR/.htaccess \
       $TEMP_SENDY_DIR/uploads $TEMP_SENDY_DIR/locale/en_US

# Copy over files from old installation
cp $SENDY_INSTALL_DIR/includes/config.php $TEMP_SENDY_DIR/includes/
cp $SENDY_INSTALL_DIR/.htaccess $TEMP_SENDY_DIR/
cp -r $SENDY_INSTALL_DIR/uploads $SENDY_INSTALL_DIR/locale $TEMP_SENDY_DIR

# Backup & Replace the old installation
CURRENT_TIME="`date +%s`"
BACKUP_DIR="$HOME/sendy_backup_$CURRENT_TIME/"
mkdir -p $BACKUP_DIR
mv $SENDY_INSTALL_DIR $BACKUP_DIR
mv $TEMP_SENDY_DIR $SENDY_INSTALL_DIR
chown www-data:www-data -R $SENDY_INSTALL_DIR

rm -rf $UNZIP_DIR
