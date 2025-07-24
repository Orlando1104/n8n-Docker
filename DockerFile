# Utiliza la última imagen oficial de n8n como base
FROM n8nio/n8n:latest

# Cambia al usuario root para crear directorios y cambiar permisos
USER root

# Crea el directorio para los datos de n8n y asegura que el usuario 'node' sea el propietario
# Esto es importante para que n8n pueda escribir en este directorio.
RUN mkdir -p /data && chown -R node:node /data

# Cambia de nuevo al usuario no privilegiado 'node' por seguridad
USER node

# Establece una variable de entorno para que n8n sepa dónde guardar sus datos
ENV N8N_USER_FOLDER=/data

# La imagen base de n8n ya expone el puerto 5678, por lo que no es necesario
# volver a exponerlo a menos que lo cambies.```

**Comandos para construir y ejecutar:**

1.  **Construir la imagen de Docker:**
    ```bash
    docker build -t mi-n8n-personalizado .
    ```

2.  **Ejecutar el contenedor de Docker:**
    ```bash
    docker run -d --name mi-n8n-app -p 8080:5678 -v n8n_data:/data mi-n8n-personalizado
    ```
    *   `-p 8080:5678`: Accederás a n8n en tu navegador a través de `http://localhost:8080`.
    *   `-v n8n_data:/data`: Tus datos de n8n (workflows, credenciales, etc.) se guardarán en un volumen de Docker llamado `n8n_data`, persistiendo aunque el contenedor se detenga o se elimine.

---
