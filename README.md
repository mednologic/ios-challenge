# iOS Challenge Project

## Bonus opcionales cumplidos + extras
> Para encontrar fácilmente las tareas bonus, revisar los comentarios marcados con `/// Optional Bonus` en el código.

## Características

- **Pantalla de Listado:** Muestra una colección de anuncios con un diseño limpio y adaptable.
- **Pantalla de Detalle:** Permite ver la información completa de cada anuncio, incluyendo imágenes, descripción y datos adicionales.
- **Favoritos:** Los usuarios pueden marcar anuncios como favoritos, y se guarda la fecha en que se realizaron.
- **Integración con API:** Los datos se obtienen a través de endpoints predefinidos.
- **Diseño Responsive:** La app se adapta a diferentes tamaños de pantalla (iPhone e iPad).
- **Integración SwiftUI:** Se utilizan componentes SwiftUI junto con UIKit para mejorar la experiencia de usuario.
- **Soporte para Modo Oscuro:** La app se ve genial en entornos claros y oscuros.
- **Localización:** Base preparada para soportar múltiples idiomas (español por defecto e inglés).

## Características adicionales destacadas

- **Arquitectura Modular:** El proyecto está organizado en modelos, vistas, viewModels y servicios, lo que facilita la escalabilidad y el mantenimiento.
- **Código Limpio y Testable:** Se presta especial atención a la escritura de código limpio, con componentes reutilizables y testeables.
- **Integración de UIKit y SwiftUI:** Se aprovechan las ventajas de ambos frameworks para construir una experiencia de usuario robusta y adaptable.
- **Uso de Concurrency (async/await):** Se utiliza la programación asíncrona de Swift para gestionar llamadas a la API y otras tareas, mejorando el rendimiento y la capacidad de respuesta de la app.

## Compatibilidad

- **iOS:** 16 hasta la versión actual

## Estructura del Proyecto

- **Modelos:** Define las estructuras de datos (anuncios, detalles, etc.).
- **Vistas:** Contiene tanto vistas UIKit como SwiftUI (pantallas de listado, detalle, celdas, etc.).
- **ViewModels:** Gestionan la lógica de negocio y la vinculación de datos.
- **Servicios:** Manejan las llamadas a la API, la persistencia y otras utilidades.
- **Design System:** Tokens de diseño (colores, espaciados, tipografía, etc.) para mantener la coherencia visual.
- **AppCoordinator:** Coordina la navegación de UIKit con el TabBar.
- **Capa de red:** Gestión de las llamadas a la API.
- **Managers genéricos:** Clases utilitarias para manejo de imágenes, persistencia, etc.

## Preview Content & Mocks

El proyecto incluye una carpeta específica para contenidos de vista previa y mocks, que se utilizan tanto en las vistas de SwiftUI Preview como en los tests unitarios. Esta carpeta permite usar datos simulados y assets de prueba sin interferir con el producto final.  
Mediante la configuración del proyecto, **todo lo que se encuentre en esta carpeta se excluye de las builds de release**, garantizando que el paquete final de la app no incluya información o recursos de prueba.

Esta estrategia facilita el desarrollo y el testing sin comprometer la integridad del build de producción.

## Testing

El proyecto incorpora pruebas utilizando tanto los métodos clásicos de XCTest como el nuevo framework **swiftTesting**. Esto permite:

- **Tests:** Se han escrito pruebas utilizando XCTest para validar la funcionalidad de la capa de red, la persistencia y otros componentes clave.
- **Tests con SwiftTesting:** Se aprovecha la sintaxis moderna de *swiftTesting* para escribir tests de forma más expresiva y concisa, mejorando la legibilidad y facilitando la detección de errores.
- **Cobertura de Código:** Se ha configurado la cobertura de tests para asegurar la calidad y robustez del código.
- **Mocks y Stubs:** Se utilizan mocks y stubs (ubicados en la carpeta de Preview Content & Mocks) para simular comportamientos y validar funcionalidades sin depender de servicios externos.


¡Espero que les guste! 🎉
