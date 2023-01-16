#!/bin/bash

# piping to xargs trims the string
THEME_COLOR=$(gsettings get org.gnome.desktop.interface color-scheme | xargs)

if [ $THEME_COLOR == 'prefer-dark' ]
then
  PICTURE_URI_SLUG='picture-uri-dark'
else
  PICTURE_URI_SLUG='picture-uri'
fi

# piping to xargs trims the string
CURRENT_BACKGROUND_URI=$(gsettings get org.gnome.desktop.background $PICTURE_URI_SLUG | xargs)

case $CURRENT_BACKGROUND_URI in

  file://$HOME/Pictures/Wallpapers/Used/yucong-tang.jpeg)
    gsettings set org.gnome.desktop.background $PICTURE_URI_SLUG file://$HOME/Pictures/Wallpapers/Used/yucong-tang-dual.jpeg
    gsettings set org.gnome.desktop.background picture-options 'spanned'
    ;;

  file://$HOME/Pictures/Wallpapers/Used/yucong-tang-dual.jpeg)
    gsettings set org.gnome.desktop.background $PICTURE_URI_SLUG file://$HOME/Pictures/Wallpapers/Used/yucong-tang.jpeg
    gsettings set org.gnome.desktop.background picture-options 'centered'
    ;;

  *)
    gsettings set org.gnome.desktop.background $PICTURE_URI_SLUG file://$HOME/Pictures/Wallpapers/Used/yucong-tang.jpeg
    gsettings set org.gnome.desktop.background picture-options 'centered'
    ;;
esac
