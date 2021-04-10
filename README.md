# Lyrics-iOS

## Installation
Run git clone to download proyect

```ruby
git clone https://github.com/luisMan97/Lyrics-iOS.git
```

#### Third Party Libraries
The project does not use third party libraries. Don't cocoapods, don't cartage, don't worry :)

#### Funcionalidades
- La pantalla principal consta de un formulario con dos campos de texto, "artista" y "título de la canción", y el botón de buscar.
- Se muestra mensaje de error y mensaje cuando no se encuentra una búsqueda.
- Debajo del formulario hay una sección de "Búsqueda anterior" que permite ir a otra pantalla para ver la letra.
- La función de búsqueda sólo funciona si se tiene acceso a Internet.
- La sección de historial está disponible sin acceso a Internet.

#### Funcionalidades adicionales: 
- La sección de "Búsqueda anterior" también persiste y se puede ver sin conexión a internet
- Hay una modal de loading que se muestra cada vez que se hace la petición al servicio web.
- La sección de historial cuenta con una barra de búsqueda.
- El formulario no permite hacer llamados al servicio web sin los dos campos, se validan y se muestra mensaje en caso de no ingresarlos.

#### Funcionalidades técnicas:
- La aplicación está desarrollada en Swift 5, con SwiftUI y Combine.
- La aplicación tiene cómo arquitectura un tipo de MVVM extendido (CLEAN Architecture).
- La aplicación usa programación reactiva.
- La aplicación implementa diferentes patrones de diseño (Repository, DAO, Coordinator, Builder entre otros).
- La aplicación usa CoreData como gestor de datos locales.
- La aplicación no usa librerías de terceros.
- La aplicación usa una capa genérica y extensible con URLSession para hacer los llamados a los servicios.  
- La aplicación usa Codable para el mapeo de JSON a objetos. 
- La aplicación contiene un .gitignore para no subir archivos innecesarios.
- La aplicación contiene un readme.md para indicar la instalación, las funcionalidades y una explicación resumida de cada una de las capas de la arquitectura.

#### Arquitectura
Se implementó CLEAN como arquitectura, con las siguientes capas:
1) UI: Contiene las View de SwiftUI
2) Presentation: Contiene los ViewModels
3) UseCase: Contiene los casos de uso (acciones de la aplicación y lógica de negocios)
4) Domain: Contiene las entidades
5) Data: Contiene el patron repository para obtener los datos ya sea de una API o una base de datos local
6) Framework: Contiene la implementación a más detalle de la obtención de datos usando ya la respectiva librería o framework (Alamofire, URLSession, CocoaPods y etc)
