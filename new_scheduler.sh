#!/bin/bash

timestamp=`date +%Y-%m-%d-%H-%M-%S`
REMOVE=RAxML_* #Remove os arquivos de saída do RAxML (não está sendo usado)
repetitions=5 #Numero de repetições do experimento
tempo_fila="01:00:00" #Tempo extimado para a execuçao de cada experimento
fila="nvidia_small" #Fila de submissão 
max_jobs_in_queue=4 #Número máximo de tarefas em execução por usuário permitido pela fila

for input_file in `cat input_files.txt`; do #percorre os arquivos de entrada contidos no arquivo input_files.txt
	PREFIX=`basename -s .phylip ${input_file}`
	for nodes in 1 5 10 20; do #percorre o número de nós
		for threads in 2 4 8 12 24; do  #percorre o número de threads
			for bootstraps in 10 100 1000 2000; do #percorre os valores de bootstrap (parâmetro da aplicação raxml)
        #Cria o script de submissão, parâmetros: <num de nós> <num de tarafas por nó> <total de tarefas> <num de threads> <fila> <nome do job> <tempo de fila> <input> <bootstrap>
				python3 create_script.py $nodes 1 $nodes $threads $fila ${bootstraps}bs-${threads}th-${PREFIX} ${tempo_fila} $input_file $bootstraps
				SCRIPT="sub.sh"

        #loop para repetição de um mesmo experimento
        #é consultado se a fila está disponível a cada 5m para a submissão de um novo job
				for i in $(seq 1 ${repetitions}); do
					while true; do
						sleep 5m 
						jobs_in_queue=`squeue -p $fila -u $USER | wc -l`
						jobs_in_queue=$((jobs_in_queue-1))
						if [ $jobs_in_queue -lt $max_jobs_in_queue ]; then
							break;
						fi
					done
					
					echo $SCRIPT
					#rm ${REMOVE}
					#job_id=`sbatch -p $fila --parsable $SCRIPT`
					job_id=`sbatch --parsable $SCRIPT $i` #pega o identificador do job
					echo $job_id >> all_jobs_${timestamp}.txt #salva o identificador do job no .txt
				done
			done
		done
	done
done

#verifica se todos os jobs já foram executados, ou seja, que não há mais jobs na fila
while true; do
	sleep 5m
	jobs_in_queue=`squeue -p $fila -u $USER | wc -l`
	jobs_in_queue=$((jobs_in_queue-1))
	if [ $jobs_in_queue -lt 1 ]; then
		break;
	fi
done

echo all_jobs_${timestamp}.txt
#realiza o comando sacct para coletar as informações sobre consumo de memória e tempo de cada execução
sacct -p --delimiter=, -j `tr '\n' ',' < all_jobs_${timestamp}.txt` -o JobName,NNodes,MaxVMSize,AveVMSize,MaxVMSizeNode,MaxVMSizeTask,MaxRSS,MaxRSSNode,MaxRSSTask,AveCPU,CPUTime,CPUTimeRAW,Elapsed,Start,End,State > saida_sacct.txt
