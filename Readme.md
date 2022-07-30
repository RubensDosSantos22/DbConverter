# Descrição do DbConverter

### Objetivo:

​	O objetivo básico do sistema, é reduzir o tempo gasto no processo de conversão de base de dados realizado nos clientes. O mesmo conta com Atalhos, Separadores de arquivos, configuradores e verificadores de dados, todos para garantir o menor tempo necessário para realizar a conversão e agilizar o processo.

### Descrição das funções:

- Botões de rápido acesso aos aplicativos: Ibexpert, Datapump, BDE, ODBC e Paint;
- Botão de atalho para abrir os diretórios padrões usados na conversão;
- Visualização dos caminhos padrões onde são comportadas as bases de dados do sistema de cada cliente, assim como seu nome fantasia e o cd da emrpesa;
- Conferência dos dados e das tabelas;
- Configuração do arquivo Ini (que comporta os dados da empresa para emissão de Nfe) e CTE;
- Configuração do arquivo Sat (que comporta os dados da empresa para emisão do Cupom S@t);
- Separação dos arquivos da pasta.

### Arquitetura Básica do Sistema:

​	Todas as Units que não fazem parte da seção principal de administração do sistema, possuem em seu início a letra "C". 

​	Por conta da especificidade das funções exercidas pelo aplicativo, a mesma não está provida de bibliotecas para resumo de código, tornando a forma de trabalho de cada formulário independente e residente somente em seu arquivo próprio.
