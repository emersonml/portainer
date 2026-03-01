sudo adduser --system --uid 1203 --no-create-home --group portainer
sudo usermod -aG docker portainer
sudo usermod -aG projects portainer


#Antes de subir o container
sudo mkdir -p /srv/docker/volumes/portainer_app_data/_data

#Roda o compose para criar as subpastas

#Concede permissao 
sudo chown -R 1203:1203 /srv/docker/volumes/portainer_app_data
sudo chmod 771 /srv/docker/volumes/portainer_app_data

tcp://portainer-agent:9001