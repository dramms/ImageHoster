Informationen um die Application ans laufen zu bekommen.

1) Allgemein:
1.1 Dropbox Zugangsdaten:
E-Mail: image.hoster@gmx.de
Password: imagehoster123

Evtl muss dieser Befehl ausgeführt werden, aber es sollte erstmal ohne probiert werden
rake dropbox:authorize APP_KEY=rirzg3k330zg8a3 APP_SECRET=lb93gsg1e0hj5r5 ACCESS_TYPE=app_folder
!!bevor  "y" eingeben wird auf den Bestätigungslink klicken!!

Weitere Dropbox Informationen
access_token: cn611bh6vly3mrk
access_token_secret: o9kwxcil3ifaac5
user_id: 148455259

1.2 Heroku
Test-URL: http://imagehosterdr.herokuapps.com
Auf heroku liegt eine mit seeds fertig eingerichtete Datenbank. Sofern nicht ein seed lokal ausgeführt wird, sollte das Testen über Heroku funktionieren (siehe u.a. bei 1.3.1 oder bei 2.1.9)

1.3 Sonstiges
1.3.1 Vor jedem ausführen der Seeds müssen die Ordner: "Apps/imagehoster/avatar" und "Apps/imagehoster/images" in der Dropbox gelöscht werden, da es sonst zu Problemen mit bereits existierenden Dateinamen geben kann!
1.3.2 Das ausführen der Seeds kann länger dauern, da einige Bilder auf Dropbox geladend werden müssen
1.3.3 PostGreSQL muss installiert sein (gem wegen Heroku)
1.3.4 Es muss ImageMagick installiert sein, damit Paperclip funktioniert (sudo apt-get install imagemagick imagemagick-doc)


2) Applikation
2.1) Applikation ans laufen bekommen
2.1.1) git config --global http.postBuffer 524288000
2.1.2) git clone http://github.com/Dominic90/ImageHoster
2.1.3) sudo apt-get update
2.1.4) sudo apt-get install postgresql
2.1.5) sudo apt-get install libpq-dev
2.1.6) sudo apt-get install imagemagick
2.1.7) bundle install
2.1.8) rake db:migrate
2.1.9) rake db:seeds (Achtung: da die Bilder schon im Dropbox ordner liegen, müssen dort erst die Ordner "Apps/imagehoster/avatar" und "Apps/imagehoster/image" gelöscht werden, damit der seed durchlaufen kann. Der Seed ist auf Heroku schon durchgelaufen und somit greift Heroku auf die gleichen Daten zu, weshalb man es nicht nutzen sollte, solange der seed durchläuft. Wenn der lokale seed fertig ist, sind heroku und die lokale Anwendung auf dem gleichen Stand.
Das Ausführen der Seeds kann recht lange dauern. Den aktuellen Fortschritt der Bilder kann man auf in der Dropbox erkennen, in man guckt, ob die einzelnen Ordner angelegt werden)
2.1.10) "rails s" ausführen um den Server zu starten

2.2) Wichtige Informationen zum Verhalten
2.2.1) Das lokale Projekt und Heroku nutzen den gleichen Ordner in der Dropbox, weshalb es dabei zu überschneidungen von Dateinamen kommen kann.
2.2.2) Namen, E-Mail-Adressen und Passwörter von Beispielnutzern stehen in der DB (Passwörter verschlüsselt) und in der seeds.rb. Passwörter sind immer "123456". Die ersten angelegten Nutzer sind miteinander befreundet und haben Projekte mit Bildern und Nachrichten, während die Nutzer weiter unten nichts dergleichen haben.
