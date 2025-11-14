# Dockerfile - serves static HTML/CSS/JS from templates using nginx
FROM nginx:alpine

# Remove default nginx content
RUN rm -rf /usr/share/nginx/html/*

# Copy static files (templates folder) into nginx web root
COPY templates /usr/share/nginx/html

# Expose port 80 (http)
EXPOSE 80

# Start nginx in foreground
CMD ["nginx", "-g", "daemon off;"]