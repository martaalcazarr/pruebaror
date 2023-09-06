# Prueba certificación RoR - Marta Alcázar

Proyecto en Ruby on Rails para certificación Talento Digital. Realizado con Ruby on Rails, bootstrap y las gemas Devise y Kaminari.
Proyecto para empresa ficticia JetMaintain, dedicada al mantenimiento de motores de avión. Permite a sus usuarios gestionar los mantenimientos a los motores de dicha empresa.

Para ejecutar este proyecto:
Clonar git
2. Editar el archivo config/database.yml con tus credenciales para la base de datos
3. rails db:create
4. rails db:seed
5. rails s -b 0.0.0.0

El proyecto inicia en el indice que contiene una breve descripción, desde la barra de navegación es posible acceder a Términos y condiciones, registrarse e iniciar sesión. 
El proyecto permite registrarse como usuario con el rol "operador" por defecto. Vienen dos usuarios que se crean después del seed, para poder utilizar un usuario "administrador". Estos son:
(email: 'admin@example.com') 
    user.password = '123456'
    user.role = 'administrador'

  
(email: 'op@example.com') 
    user.password = '123456'
    user.role = 'operador'
Al iniciar sesión, el administrador tiene acceso a motores y mantenimientos en su totalidad, pero el operador solo a mantenimientos (y no puede eliminarlos, solo crear y editar)

Para crear un nuevo mantenimiento, el script no se logra ejecutar si no se recarga la página (no solucionado), al recargar funciona y pueden crearse. Primero debe elegirse el tipo de motor, para que se desplieguen las demás opciones (según el tipo de motor, se puede elegir entre los motores disponibles).

Para crear un nuevo motor, el nombre debe respetar la estructura REAC-n o TURBO-n. 

Para editar un mantenimiento, el nombre y tipo de motor no pueden ser editados. 