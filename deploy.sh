#!/bin/bash

echo "Deteniendo contenedor anterior..."

docker stop flask-devops || true
docker rm flask-devops || true

echo "Construyendo nueva imagen..."

docker build -t flask-devops .

echo "Levantando nuevo contenedor..."

docker run -d \
  -p 5000:5000 \
  --name flask-devops \
  flask-devops

echo "Deploy completado"