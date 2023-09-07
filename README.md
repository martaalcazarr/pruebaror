# Prueba de Certificación RoR - Marta Alcázar

Este proyecto en Ruby on Rails ha sido desarrollado para la certificación de Talento Digital. Está construido utilizando Ruby on Rails, Bootstrap y las gemas Devise, Faker y Kaminari.

## Descripción del Proyecto

El proyecto está diseñado para la empresa ficticia "JetMaintain", la cual se dedica al mantenimiento de motores de avión. Permite a los usuarios gestionar los mantenimientos de los motores de la empresa.

## Ejecución del Proyecto

Para ejecutar este proyecto, sigue los siguientes pasos:

1. Clona el repositorio desde GitHub.
2. Edita el archivo `config/database.yml` con tus credenciales para la base de datos.
3. Ejecuta `rails db:create` para crear la base de datos.
4. Ejecuta `rails db:seed` para poblar la base de datos con datos iniciales.
5. Ejecuta `rails s -b 0.0.0.0` para iniciar el servidor Rails.

## Funcionalidades Principales

El proyecto incluye las siguientes funcionalidades principales:

- Registro e inicio de sesión de usuarios.
- Roles de usuario: "administrador" y "operador".
- Dos usuarios predefinidos para el rol de "administrador" y "operador":

    - **Administrador**
        - Email: admin@example.com
        - Contraseña: 123456
        - Rol: administrador

    - **Operador**
        - Email: op@example.com
        - Contraseña: 123456
        - Rol: operador

- Panel de administrador con acceso total a motores y mantenimientos.
- Panel de operador con acceso solo a mantenimientos (sin capacidad para eliminar).
- Creación y edición de mantenimientos, incluyendo la selección del tipo de motor.
- Creación de nuevos motores siguiendo la estructura REAC-n o TURBO-n.
- Edición de mantenimientos (con limitación en la edición del nombre y tipo de motor).

## Nota sobre la Creación de Mantenimientos

Es importante tener en cuenta que, para crear un nuevo mantenimiento, es posible que necesites recargar la página debido a un problema conocido. Al recargar la página, deberías poder crear mantenimientos correctamente. Recuerda que primero debes seleccionar el tipo de motor antes de elegir entre los motores disponibles.

## Notas Adicionales

Asegúrate de tener Ruby on Rails correctamente instalado en tu entorno de desarrollo antes de ejecutar este proyecto.

¡Disfruta explorando y utilizando esta aplicación de gestión de mantenimientos de motores de avión!

