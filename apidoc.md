# Am gitbook angewandte Änderungen:
## Hinzufügen von custom website-layouts und styles

**TL;DR: wenn eine Page mit einem iframe anfängt, wird das IFrame nun Seitenfüllend dargestellt**

Hier habe ich das standard gitbook-layout so angepasst, dass einige Elemente andere css-klassen bekommen oder ggf. nicht gerendert werden,
Falls der Inhalt einer Seite mit `<iframe` anfängt (siehe `_layouts`-Ordner). Insbesondere wird:
- der inhalts-bereich dann nicht auf 800 Pixel breite beschränkt (weil die `page-inner`-css-klasse dann nicht gesetzt wird)
- die Navigationsleiste bekommt `display: inline-block` und durch das entfernen des `h1` werden die social-media-icons auf iframe-pages nicht hinzugefügt.
  Das sorgt dafür, dass einzig der Button zum ein/ausblenden der gitbook-navigation bleibt (siehe `styles`-Ordner)


# spectacle-docs Änderungen:
## custom app-ordner

**TL;DR: ich die spectacle-templates angepasst, um css- und js inline verwenden zu können**

Spectacle erlaubt das angeben eines eigenen app-ordners. Das wird hier gemacht. Der
verwendete Ordner ist `spectacle_app`. Er beinhaltet alle Handlebar-templates und sass-styles 
und JavaScript-files die im Gitbook verwendet werden. Hier habe ich hauptsächlich die head.hbs
angepasst, um die css- und js-files inline in der index.html zu haben, anstatt sie zu referenzieren. Dadurch bekommen wir eine einzige, statische Datei, die unsere Api-Doku darstellt

## custom config-file

**TL;DR: ich die spectacle-config angepasst, um css- und js inline verwenden zu können**

Spectacle erlaubt das angeben einer Konfigurationsdatei, in der man die von spectacle verwendeten
grunt-tasks frei konfigurieren kann. Hier habe ich hauptsächlich gesagt, dass style- und script-tags
im finalen HTML-Dokument nicht prettified werden sollen, und die template-data für die handlebar-
templates in eine Datei ausgelagert (siehe task `load-minified-files`).

Vorher war in den Templatedaten nur der inhalt der swagger.json-Datei, mit den Änderungen sind auch
die fertigen minifieten js- und css-Dateien die gitbook braucht in den Templatedaten. Das erlaubt es,
die inline zur index.html hinzuzufügen, anstatt sie zu referenzieren

## custom spectacle.js

**TL;DR: ich habe spectacle-docs hierhin kopiert, um einen weiten build-task angeben zu können**

Spectacle hat normalerweise eine `bin/spectacle.js`, die command-line-arguments einließt, und dann
die in `index.js` definierte spectacle-Funktion ausführt. Ich habe den Inhalt der `bin/spectacle.js`
und der `index.js` in einer `spectacle.js` zusammengefügt und hier in das Repo gelegt.

Das ist notwendig, damit ich einen eigenen Task (`load-minified-files`) nach dem minifien, aber vor
dem Templates rendern ausführen kann. So anpassbar spectacle out-of-the-bo auch ist, das ging leider
(scheinbar) nicht anders.

## spectacle als dependency

**TL;DR: Spectacle ist als dependency drin, damit wir nicht dessen dependencies bei uns eintragen müssen**

Wir haben spectacle zwar als dependency eingetragen, führen das installierte spectacle aber nie aus.
stattdessen führen wir die vorhin beschriebene, angepasste `spectacle.js` mit dem extra grunt-task aus.
spectacle-docs ist aber dennoch als dependency angegeben, damit dessen dependencies beim `npm install`
mit installiert werden, ohne dass wir diese 27 Dependencies in unsere package.json übernehmen müssen.

# Verwendung:

**TL;DR:**
- `npm run render_api_doc`
- Inhalt von `public/index.html` in `reference/apidoc.html` kopieren
- gitbook neu rendern

um aus der `swagger.js` die API-Doku zu rendern `npm run render_api_doc` ausführen. Das erstellt
einen `public` ordner, mit (zurzeit) ein paar weiteren (leeren) Ordnern, einer `sources.json` und
vor allem einer `index.html`. Diese `index.html` stellt die gerenderte API-Doku dar.
Der Inhalt davon muss dann kopiert, und in die `reference/apidoc.html` eingefügt werden. Wenn dann
anschließend das gitbook neu gerendert wird, ist die API-Doku darin ebenfalls aktualisiert.

# Anmerkung:
Das ist eine POC-version. Es geht darum zu zeigen wie man eine Dokumentation im OpenAPI-Format rendern
und in ein Gitbook integrieren kann. Der Code dazu ist noch sehr verbesserungswürdig, genau wie diese Beschreibung
