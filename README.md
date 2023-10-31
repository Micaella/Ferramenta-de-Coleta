Ferramenta para a coleta dos dados

Para realizar o treinamento dos modelos preditivos, Extra Trees Classifier e o Extra Trees Regressor, é fundamental dispor de um conjunto de dados que contenha informações sobre as execuções do RAxML. Portanto, para obter esse conjunto de dados, foi necessário coletar e armazenar os dados relacionados ao desempenho da aplicação no que se refere ao tempo de execução e ao uso de memória para cada execução no ambiente SDumont.

A ferramenta de coleta de dados é composta por dois módulos: um desses módulos, desenvolvido em Python, responsável pela criação do script de submissão, adaptado conforme a configuração do experimento; e o outro, desenvolvido em Shell Script, que se encarrega de submeter o script, verificar se alguma tarefa já submetida foi finalizada e, assim que uma termina, submete a próxima. Ao final, quando todas as tarefas do experimento são concluídas, realiza-se a coleta dos dados de execução de cada uma delas através do comando sacct. Esses dados são então armazenados em um arquivo no formato CSV (valores separados por vírgula), formando, assim, a base de dados.

Para tornar a ferramenta mais abrangente, os módulos podem ser ajustados para gerar um script de submissão para a aplicação desejada, junto com as configurações do experimento desejado (como número de nós, threads, parâmetros da aplicação e outros). A classe RunRamxl pode ser modificada para ajustar os parâmetros da aplicação, enquanto a classe SubmissionFile pode ser ajustada para os parâmetros do sbatch. No módulo Shell Script, é possível alterar as configurações do experimento, incluindo o número de nós, threads, parâmetros da aplicação, e mais.

O arquivo "input_files.txt" é aquele que deve conter os caminhos para os arquivos de entrada necessários para a execução da aplicação. No diretório "exemplos", pode ser encontrada amostras de arquivos de saída da ferramenta, bem como um arquivo de entrada para o RAxML (aminoacido.phylip). O arquivo "sub.sh" exemplifica o script de submissão gerado pela ferramenta. O arquivo "all_jobs_2022-11-18-12-49-48.txt" é um exemplo do arquivo onde os identificadores dos jobs submetidos pela ferramenta no ambiente SD estão salvos, e o arquivo "saida_sacct" ilustra o exemplo final de saída da ferramenta, formando a base de dados.

Para a execução da ferramenta pode ser utilizada a linha: bash new_scheduler.sh
