#    PERSONAL SETTINGS    #
###########################

echo "################################################################"
echo "###################    AIRPLAY  ######################"
echo "################################################################"
cd Files/AirPlay
sudo make install
cp -a toggle.sh ~/.toggle.sh
chmod +x ~/.toggle.sh
cd ..

echo "################################################################"
echo "###################    WALLPAPERS   ######################"
echo "################################################################"
sudo cp -a ~/Imágenes/Wallpapers/. /usr/share/wallpapers/
sed -i -e '$a\' ~/.bashrc
echo "alias walls='sudo -S <<< "PASS" rm -r /usr/share/wallpapers/*; sudo cp -a ~/Imágenes/Wallpapers/. /usr/share/wallpapers/;'" >> ~/.bashrc
source ~/.bashrc

echo "################################################################"
echo "###################    DESKTOPS FILES   ######################"
echo "################################################################"
cp -a Files/Desktops/. ~/.local/share/applications/

echo "################################################################"
echo "###################    DLNA ALIAS   ######################"
echo "################################################################"
echo "alias dlna='sudo -S <<< "PASS" pulseaudio-dlna --encoder wav'" >> ~/.bashrc
source ~/.bashrc                               

echo "################################################################"
echo "###################    THEMES   ######################"
echo "################################################################"
mkdir ~/.local/share/aurorae
mkdir ~/.local/share/aurorae/themes
cp -a Files/Themes/. ~/.local/share/aurorae/themes/

echo "################################################################"
echo "###################    FONTS   ######################"
echo "################################################################"
mkdir ~/.local/fonts
cp -a Files/Fonts/. ~/.local/fonts && sudo fc-cache -f -v

echo "################################################################"
echo "###################    SET AS WALLPAPER   ######################"
echo "################################################################"
mkdir ~/.local/share/kservices5
mkdir ~/.local/share/kservices5/ServiceMenus
cp -a Files/SetAsWallpaper.desktop ~/.local/share/kservices5/ServiceMenus/

echo "################################################################"
echo "###################   WINDOW SETTINGS   ######################"
echo "################################################################"
yes | cp Files/kwinrc  ~/.config/

echo "################################################################"
echo "###################   LATTE CONFIG   ######################"
echo "################################################################"
cp Files/latte.sh  ~/.config/autostart/
cp Files/latte.sh.desktop  ~/.config/autostart/
latte-dock --import-layout Files/plasma_dark.layout
latte-dock --import-layout Files/plasma_light.layout