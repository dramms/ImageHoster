Informationen um die Application ans laufen zu bekommen.

1) Allgemein:
1.1 Dropbox Zugangsdaten:
E-Mail: image.hoster@gmx.de
Password: imagehoster123

Diesen befehl ausführen:
rake dropbox:authorize APP_KEY=rirzg3k330zg8a3 APP_SECRET=lb93gsg1e0hj5r5 ACCESS_TYPE=app_folder
!!bevor ihr "y" eingebt auf den Bestätigungslink klicken!!

Weitere Dropbox Informationen
access_token: cn611bh6vly3mrk
access_token_secret: o9kwxcil3ifaac5
user_id: 148455259

1.2 Heroku
Test-URL: http://imagehosterdr.herokuapps.com

1.3 Sonstiges
1.3.1 Vor jedem ausführen der Seeds müssen die Ordner: "Apps/imagehoster/avatar" und "Apps/imagehoster/images" in der Dropbox gelöscht werden, da es sonst zu Problemen mit bereits existierenden Dateinamen geben kann!
1.3.2 Das ausführen der Seeds kann länger dauern, da einige Bilder auf Dropbox geladend werden müssen
1.3.3 PostGreSQL muss installiert sein (gem wegen Heroku)
1.3.4 Es muss ImageMagick installiert sein, damit Paperclip funktioniert (sudo apt-get install imagemagick imagemagick-doc)


2) Applikation
2.1) Applikation ans laufen bekommen
2.1.1) git pull...
2.1.2) bundle install ausführen
2.1.3) evtl. "rake dropbox:authorize APP_KEY=rirzg3k330zg8a3 APP_SECRET=lb93gsg1e0hj5r5 ACCESS_TYPE=app_folder" ausführen
2.1.4) "rake db:migrate" ausführen
2.1.5) "rake db:seeds" ausführen (Achtung: Kann einige Minuten dauern bis es durchgelaufen ist -> Fortschritt kann auf Dropbox beobachtet werden, indem geguckt wird ob die einzelnen Ordner unter Avatar und später under images angelegt werden)
2.1.6) "rails s" ausführen um den Server zu starten

2.2) Wichtige Informationen zum Verhalten
2.2.1) Das lokale Projekt und Heroku nutzen den gleichen Ordner in der Dropbox, weshalb es dabei zu überschneidungen von Dateinamen kommen kann.
2.2.2)

2.3) Funktionen

