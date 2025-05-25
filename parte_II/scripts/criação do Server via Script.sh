-- Cria o SGBD Azure SQL chamado sqlserver-kidelicia  
az sql server create -l brazilsouth -g cp3-dw -n kidelicia -u admsql -p db@FIAP25 --enable-public-network true

-- Cria o banco de dados chamado dbinsighthuntersrm554066  
az sql db create -g cp3-dw -s kidelicia -n dbinsighthuntersrm554066 --service-objective Basic --backup-storage-redundancy Local --zone-redundant false

-- Libera o acesso para qualquer endereço IP da rede (somente para testes iniciais)  
az sql server firewall-rule create -g cp3-dw -s kidelicia -n AllowAll --start-ip-address 0.0.0.0 --end-ip-address 255.255.255.255

-- Usuário e senha do banco de dados  
-- admsql
-- db@FIAP25
