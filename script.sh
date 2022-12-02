#!/bin/bash

echo "Criando as imagens........"

docker build -t flaviosantana1/projeto-backend:1.0 backend/.
docker build -t flaviosantana1/projeto-database:1.0 database/.

echo "Realizando o push das imagens...."

docker push flaviosantana1/projeto-backend:1.0
docker push flaviosantana1/projeto-database:1.0

echo "Criando serviços no cluster kubernetes..."

kubctl apply -f ./services.yml


echo "Criando os deployments...."

kubctl apply -f ./deployments.yml



