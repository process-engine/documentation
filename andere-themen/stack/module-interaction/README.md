# Modul Interaktion

Wenn Sie einen Stack mit so vielen Klassen verwenden, haben wir Klassen, die von anderen Klassen abhängen, um ihre Arbeit zu erledigen. Es wird wahrscheinlich eine ganze Reihe solcher Abhängigkeiten geben, so dass wir einen einheitlichen Umgang mit ihnen brauchen, um Chaos zu verhindern.

Dies erreichen wir mit einem IoC-Container, in dem wir alle Abhängigkeiten registrieren. Das Ergebnis aller Registrierungen ist das, was wir den Abhängigkeitsgraphen nennen.