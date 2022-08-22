# Descrição do DbConverter



## Justificativa:

​	O objetivo básico do sistema, é reduzir o tempo gasto no processo de conversão de base de dados realizado nos clientes. O mesmo conta com Atalhos, Separadores de arquivos, configuradores e verificadores de dados, todos para garantir o menor tempo necessário para realizar a conversão e agilizar o processo.

## Funções Gerais:

- Botões de rápido acesso aos aplicativos externos usados na conversão;
- Botão de atalho para abrir os diretórios padrões usados na conversão;
- Visualização dos caminhos padrões onde são comportadas as bases de dados do sistema de cada cliente, assim como seu nome fantasia e o cd da empresa;
- Conferência dos dados e das tabelas;
- Configuração do arquivo Ini (que comporta os dados da empresa para emissão de Nfe) e CTE;
- Configuração do arquivo Sat (que comporta os dados da empresa para emisão do Cupom S@t);
- Separação dos arquivos da pasta.

## Especificando as Funções:

- Os botões estão localizados na tela principal, e abrem os aplicativos: Ibexpert, Datapump, BDE, ODBC e Paint;
- O botão de atalho abre as pastas que são acessadas durante a conversão;
- A visualização é feita na tela principal e traz os dados informados na área de funções gerais;
- A conferência fio baseada no aplicativo original de conferência, e traz uma comparação de valores entre a base em firebird e a base em dbf;
- A configuração é feita encontrando o arquivo ini e usando-o para configurar a tabela ini;
- A configuração é feita encontrando o arquivo sat e usando-o para configurar a tabela ini;
- A separação analisa os arquivos com nomes alterados e também arquivos que não possuem a extensão DBF.

## Padrões de arquivo:

Todas as Units que não fazem parte da seção principal de administração do sistema, possuem em seu início a letra "C". 

## Padrões de código:

​	Por conta da especificidade das funções exercidas pelo aplicativo, a mesma não está provida de bibliotecas para resumo de código, tornando a forma de trabalho de cada formulário independente e residente somente em seu arquivo próprio.
