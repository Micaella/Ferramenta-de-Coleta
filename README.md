# Ferramenta de Coleta de Dados para Treinamento de Modelos Preditivos

## Visão Geral
A coleta de dados detalhada é crucial para o treinamento eficiente dos modelos preditivos Extra Trees Classifier e Extra Trees Regressor. Esses dados fornecem uma visão sobre o desempenho do RAxML em termos de tempo de execução e uso de memória em cada operação dentro do supercomputador Santos Dumont.

### 📋 Pré-requisitos

* Python 3.8.10 
* Bibliotecas: pandas e numpy.
```
pip install pandas numpy scikit-learn
```

## Componentes da Ferramenta
A ferramenta é composta por dois módulos principais:

1. **Módulo Python:** Encarregado da criação do script de submissão, ajustável conforme os parâmetros específicos do experimento.
2. **Módulo Shell Script:** Responsável por submeter o script ao sistema de gerenciamento de jobs, monitorar o status dos jobs e coletar os dados após a conclusão dos experimentos usando o comando `sacct`.

## Coleta e Armazenamento de Dados
Os resultados são coletados e armazenados em um arquivo CSV, constituindo a base de dados necessária para o treinamento dos modelos.

## Personalização
- A classe `RunRaxml` é adaptável para modificar parâmetros específicos da aplicação RAxML.
- A classe `SubmissionFile` permite ajustes nos parâmetros de submissão `sbatch`.
- No módulo Shell Script, pode-se personalizar as configurações do experimento, incluindo número de nós, threads, parâmetros da aplicação, entre outros.

## Arquivos e Diretórios Importantes
- `input_files.txt`: Contém os caminhos para os arquivos de entrada necessários para a execução da aplicação.
- `exemplos/`: Contém amostras de arquivos de saída da ferramenta e um arquivo de entrada de exemplo para o RAxML (`aminoacido.phylip`).
- `sub.sh`: Um exemplo de script de submissão gerado pela ferramenta.
- `all_jobs_2022-11-18-12-49-48.txt`: Contém os identificadores dos jobs submetidos no ambiente SD.
- `saida_sacct`: Exemplifica a saída final da ferramenta, formando a base de dados.

## Execução
Para iniciar a coleta de dados dentro do seu ambiente computacional, execute o seguinte comando no terminal:
```bash
bash new_scheduler.sh
