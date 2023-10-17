# Desafio: SQL - Azure - Power BI

## Visão Geral 🚀

  O Desafio consiste em estruturar desde a criação do banco de dados e suas integrações, até obtenção de um relatório por meio da ferramenta Power BI (SQL - Azure - Power BI) é um projeto abrangente de gerenciamento de banco de dados e visualização de dados projetado para demonstrar habilidades em SQL, Azure e Power BI. Este projeto inclui a criação de esquema de banco de dados, inserção de dados, restrições de chave estrangeira, tratamento dos dados e opções de consultas. E depois, visualização de dados usando Power BI.

## Sumário 📑

- [Esquema de Banco de Dados](#esquema-de-banco-de-dados)
- [Inserção de Dados](#inserção-de-dados)
- [Restrições de Chave Estrangeira](#restrições-de-chave-estrangeira)
- [Visualização com Power BI](#visualização-com-power-bi)
- [Tratamento de Dados](#tratamento-de-dados)
- [Consultas](#consultas)

## Esquema de Banco de Dados 🗃️

O projeto começa com a criação do esquema "azure_company" e várias tabelas:

- `employee`: Armazena informações de funcionários.
- `dependent`: Registra informações sobre dependentes dos funcionários.
- `department`: Contém dados sobre os departamentos da empresa.
- `dept_locations`: Gerencia as localizações dos departamentos.
- `project`: Armazena detalhes de projetos da empresa.
- `works_on`: Acompanha o trabalho dos funcionários em projetos.

## Inserção de Dados 📥

Os dados são inseridos nessas tabelas usando declarações SQL `INSERT`. Cuidados são tomados para garantir a integridade dos dados, incluindo restrições de chave estrangeira.

## Restrições de Chave Estrangeira 🔒

Restrições de chave estrangeira são implementadas para garantir a integridade referencial. Por exemplo, a coluna `Super_ssn` na tabela `employee` é uma chave estrangeira que faz referência à coluna `Ssn` da mesma tabela.

## Integração com o Power BI

O projeto inclui a integração dos dados armazenados no banco de dados do SQL Azure com o Power BI para visualização e análise de dados. Isso permite que você crie relatórios interativos e dashboards que destacam informações valiosas a partir dos dados brutos.

### Fluxo de Trabalho

1. **Conexão com SQL Azure**: Os dados são armazenados e gerenciados no banco de dados SQL Azure.

2. **Conexão com o Power BI**: O Power BI se conecta diretamente ao banco de dados do SQL Azure para importar os dados em tempo real.

3. **Criação de Relatórios**: Usando o Power BI, você pode criar relatórios personalizados e painéis interativos para visualizar os dados.

4. **Análise de Dados**: Explore e analise os dados usando recursos avançados do Power BI, como gráficos dinâmicos, filtros e medições personalizadas.

### Acesso aos Dados

Todos os dados utilizados neste projeto estão disponíveis para consulta através deste repositório. Você pode acessar e utilizar os dados do SQL Azure no Power BI neste repositório.



## Visualização com Power BI 📊

O projeto se estende à visualização de dados usando o Power BI. Métricas e insights importantes são apresentados por meio de painéis interativos e relatórios.

## Tratamento de Dados 🧹

Além do projeto original, um novo script foi criado para o tratamento de dados. Este script inclui etapas como verificação de nulos, conversão de valores monetários e criação de consultas adicionais para análise de dados.

## Consultas 📝

Um conjunto de consultas SQL está incluído para recuperar informações específicas do banco de dados. Essas consultas cobrem uma variedade de cenários de recuperação de dados.


## Versões 🌟

- SQL
- Azure
- Power BI

---

Sinta-se à vontade para fazer um fork deste projeto, adaptá-lo às suas necessidades e usá-lo como parte do seu portfólio.

Se você tiver alguma dúvida ou precisar de assistência com este projeto, não hesite em entrar em contato. 😃

**Feliz codificação!** 🚀🔥
