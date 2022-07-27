# ProductsMeLi
Fetch data from MeLi API

#### Funcionalidades técnicas de la aplicación:
- Desarrollada en Swift 5.
- Las vistas están desarolladas programáticamente.
- Se utilizó la arquitectura MVVM extendida.
- Comportamiento reactivo.
- No se utilizan librerías de terceros.
- Se utiliza una capa genérica y extensible con URLSession para hacer el llamado de los servicios.  
- Se utiliza Codable para el mapeo de JSON a objetos.
- Los enlaces de las capas se implementan con cierres.
#### Arquitectura:
Se implementó MVVM como arquitectura, con las siguientes capas:
1) Model: Contiene las entidades.
2) View: Contiene las vistas y la lógica de vista.
3) ViewModel: Contiene los casos de uso (acciones de la aplicación y lógica de negocios)
4) Manager: Se encarga de la obtención de los datos.
5) Router: Se encarga de la navegación entre controladores.
6) Factory: Utilizado para la construcción de objetos complejos.
#### Funcionalidades generales:
- La pantalla principal tiene una barra de búsqueda que al recibir datos por parte del usuario llama al servicio automáticamente.
- La pantalla principal muestra un listado de productos obtenidos de la API de Mercado Libre.
- Cuando se selecciona un producto se direcciona al detalle de este.
- La pantalla del detalle cuenta con un botón que dirige a una web view con el sitio web del producto en Mercado Libre.
- La pantalla del detalle tiene una sección de productos recomendados que al seleccionar alguno nos direcciona al sitio web del mismo.
- Hay un activity indicator que se muestra cuando se está realizando una petición al servicio web
- Hay una alerta que se muestra cuando en el proceso de obtención de datos ocurre un error

