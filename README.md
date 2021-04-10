# Lyrics-iOS

## Installation
Run git clone to download proyect

```ruby
git clone https://github.com/luisMan97/Lyrics-iOS.git
```

#### Third Party Libraries
The project does not use third party libraries. Don't cocoapods, don't cartage, don't worry :)

#### Arquitectura
Se implementó CLEAN como arquitectura, con las siguientes capas:
1) UI: Contiene las View de SwiftUI
2) Presentation: Contiene los ViewModels
3) UseCase: Contiene los casos de uso (acciones de la aplicación y lógica de negocios)
4) Domain: Contiene las entidades
5) Data: Contiene el patron repository para obtener los datos ya sea de una API o una base de datos local
6) Framework: Contiene la implementación a más detalle de la obtención de datos usando ya la respectiva librería o framework (Alamofire, URLSession, CocoaPods y etc)

