# Portainer (VM dedicada)

Este repositório contém a configuração do `docker-compose` para rodar apenas o Portainer em uma VM dedicada com Docker.

## Premissas

- VM limpa com Docker instalado.
- O projeto fica em `/opt/projects/portainer`.
- O usuário do host que gerencia o projeto é `emerson`.
- O `portainer-agent` deve rodar em outras VMs/hosts Docker, não nesta VM.

## Estrutura

- `docker-compose.yml`: define o serviço `portainer`.
- `portainer_data`: volume Docker para persistência de dados.

## Preparar a VM

1. Garanta que o usuário `emerson` está no grupo `docker`:

```bash
sudo usermod -aG docker emerson
```

2. Crie o diretório do projeto e dê a propriedade para `emerson`:

```bash
sudo mkdir -p /opt/projects/portainer
sudo chown -R emerson:emerson /opt/projects/portainer
```

3. Entre no diretório do projeto como `emerson`:

```bash
cd /opt/projects/portainer
```

> O usuário `portainer` do container é interno ao serviço Portainer e não precisa existir no host.

## Permissões e grupos

- O diretório `/opt/projects/portainer` deve ser propriedade de `emerson:emerson`.
- O usuário `emerson` deve fazer parte do grupo `docker` para executar `docker compose`.
- O diretório deve ter permissão `r-x` para o dono e os arquivos devem ter permissão `r`.

Se ainda quiser evitar ajustes de permissões, use `sudo` ao executar o comando.

## Executar o Portainer

Como `emerson`, execute:

```bash
docker compose up -d
```

Se `emerson` não tiver acesso ao diretório ou ao Docker, use:

```bash
sudo docker compose up -d
```

## Acessar o Portainer

- HTTP: `http://<IP-da-VM>:8999`
- HTTPS: `https://<IP-da-VM>:9443`

## Observações de segurança

- Nesta VM só roda o `portainer`.
- O `portainer-agent` deve ser implantado nas demais VMs/hosts Docker.
- O Portainer aponta ao agente por endereço remoto ou IP do host do agente, não por `tcp://portainer-agent:9001` local.

## Exemplo de uso com agentes remotos

No Portainer, adicione um endpoint do tipo "Agent" apontando para cada host remoto que execute o `portainer-agent`.

> Mantenha o agente separado do Portainer na arquitetura de segurança descrita.

##