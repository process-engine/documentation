# Modul Interaktion

Wenn der Stack mit so viele Klassen verwendet wird, gibt es Klassen, welche von
anderen Klassen abhängen, um ihre Arbeit zu erledigen. Es wird wahrscheinlich
eine ganze Reihe solcher Abhängigkeiten geben, so dass ein einheitlicher Umgang
mit ihnen gebraucht wird, um Chaos zu verhindern.

Dies wird mit einem IoC-Container erreicht, in dem alle Abhängigkeiten
registriert werden. Das Ergebnis aller Registrierungen ist das, was
Abhängigkeitsgraph genannt wird.
