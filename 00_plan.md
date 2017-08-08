* quick start guide (viele screenshots und code beispiele)
  * intro
    * ziel des guides (z.B. screenshot)
    * checken, ob role an swimlane pflicht ist
  * setup / installation skeleton project
  * UI / neues diagramm erstellen
    * hello world
      * User Task einrichten 
      * Prozess ausführen
    * REST API call wird in user task angezeigt
      * service task wird vor user task ausgeführt
        * z.B. http://api.fixer.io/latest
      * benötigt mapper
      * user task anpassen
    * Mail versenden wenn OK
      * User task cancel button hinzufügen
      * Service Task für Mailversand hinzufügen
      * Gateway hinzufügen
        * Expressions an Gatewayflows
    * mögliche erweiterungen (link to use cases)
      * persistenz via entity
        * abfrage des datastore für die persistierte entity via HTTP REST API (im browser als demo)
      * 


* use cases (wie quickstart für spezielle themen)
  * routing by role

* cheat sheet (extrakt aus anderen dokumenten / destillat)


SKELETON REQUIREMENTS

* Backend
* HTTP REST API
* Admin UI
* Postgres DB (am besten via Docker in separatem Ordner)



// <Landing page>
* overview
  * what is the goal or problem?
  * what are we doing to achieve or solve it?
  * what are your benefits of using the process engine?
* see it in action
  * deployed demo with daily db reset to see and use the UI / Modeler combo
  * graphql explorer to see and use the generic db
  * postman collections to see and use the REST API
* quick start guide (nur verlinkt)
* cheat sheet (nur verlinkt)
* community
  * how do i contribute?
  * where to find people to discuss?
    * gitter link
    * stack overflow link
    * orga link
    * twitter link
  * which companies are backing the development?
  * who is contributing?
* roadmap
  * what are we working on?
  * what is planned for the future?
* faq
* troubleshooting
// </Landing page>






* frontend
  * how can i create a new diagram?
  * how can i use an existing diagram?
  * what do i need to do to prepare a diagram for execution with the process engine?
    * service tasks
    * user tasks
    * roles
    * gateways
    * events / messages / signals
    * mappings
  * how do i execute a diagram?
* infrastructure
  * what infrastructure components make up the solution?
  * what are typical setups (with diagrams)
  * what is supported / compatible?
  * how can I get it to work with an unsupported technology (e.g. database or messagebus)
* stack
  * set up your own
    * setup using the cli (tbd)
    * fast and easy setup with docker (tbd)
      * auch mit verteiltem system / konfiguration hierfür
    * full setup without docker
  * what does it consist of?
  * how is it structured?
  * how do the modules work together?
    * ioc / discovery
  * what base implementations do i need to know to start using?
    * entities / entity services
    * datastore
    * iam
    * extensions (http)
  * what concepts are implemented and how?
    * (something like http://sailsjs.com/documentation/concepts)
    * hauffe group / zalando - gitbook interne api dokumentation