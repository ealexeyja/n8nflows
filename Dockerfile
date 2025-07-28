# Usa la Umagen ofictal mds reciente de n8n como base
FROM n8nio/n8n:latest

# Cambia temporalmente al usuario root para ejecutar coaandos con permisos elevados
USER root

# Crea el directorio /data (si no existe) y asigna la propiedad al usuario 'node'
# Esto asegura (pie n8n tenga acteso de escritura a este directorio
RUN mkdir -p /data && choun -R node:node /data

#Vuelve al usuario 'node', recomendado para ejecutar la aplicacidn de forma segura
USER node

# Declara /data como un volumen persistente
# Esto permlte conservar la InformacIdn de n8n (flujos, credenclales, etc.) fuera del contenedor
VOLUME /data

# Expone el puerto 8080, que es donde n8n se ejecta por defecto
EXPOSE 8080
