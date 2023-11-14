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

## Cite
Se você considerar a Ferramenta de Coleta de Dados ou a base de dados úteis para sua pesquisa, recomendamos citar os seguintes artigos em seus trabalhos:

```
@inproceedings{wscad,
 author = {Micaella Coelho and Guilherme Freire and Kary Ocaña and Carla Osthoff and Marcelo Galheigo and André Carneiro and Francieli Boito and Philippe Navaux and Douglas Cardoso},
 title = {Desenvolvimento de um Framework de Aprendizado de Máquina no Apoio a Gateways Científicos Verdes, Inteligentes e Eficientes: BioinfoPortal como Caso de Estudo Brasileiro},
 booktitle = {Anais do XXIII Simpósio em Sistemas Computacionais de Alto Desempenho},
 location = {Florianópolis},
 year = {2022},
 pages = {205--216},
 publisher = {SBC},
 address = {Porto Alegre, RS, Brasil},
 doi = {10.5753/wscad.2022.226377},
 url = {https://sol.sbc.org.br/index.php/wscad/article/view/21945}
}
```
```
@inproceedings{coelho2022development,
  title={Development of a Machine Learning Framework to Support Efficient Scientific Gateways},
  author={Coelho, M. and Freire, G. and Ocaña, K. and Osthoff, C. and Galheigo, M. and Carneiro, A.R. and Boito, F. and Navaux, P. and Cardoso, D.O.},
  booktitle={Conferência Latino-Americana de Computação de Alto Desempenho (BioCARLA)},
  address={Porto Alegre, Brasil},
  year={2022}
}
```
