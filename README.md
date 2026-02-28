
#Antes de subir o container
sudo mkdir -p /srv/docker/volumes/portainer_app_data/_data

#Roda o compose para criar as subpastas

#Concede permissao 
sudo chown -R 203:203 /srv/docker/volumes/portainer_app_data
sudo chmod 771 /srv/docker/volumes/portainer_app_data