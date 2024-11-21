# Description: Команды для работы с Yandex.Cloud DataProc

# Подключаемся к прокси виртуальной машине 
ssh ubuntu@{proxy_vm_ip}

# Подключаемся к мастер-ноде кластера
ssh dataproc-master

# Создаем папку для данных
hdfs dfs -mkdir -p /user/ubuntu/data

# Копируем данные из S3 в HDFS
hadoop distcp s3a://{bucket_name}/ /user/ubuntu/data

# Проверяем, что данные скопировались
hdfs dfs -ls /user/ubuntu/data

####################################################################################################

# Запуск Jupyter Notebook
# Для этого необходимо пробросить порт 8888 с мастер-ноды на прокси-виртуальную машину и на локальную машину

# Подключаемся к прокси виртуальной машине
ssh -L 8888:localhost:8888 ubuntu@{proxy_vm_ip}

# Подключаемся к мастер-ноде кластера
ssh -L 8888:localhost:8888 dataproc-master

# Запускаем Jupyter Notebook
jupyter notebook \
    --no-browser \
    --port=8888 \
    --ip=0.0.0.0 \
    --allow-root \
    --NotebookApp.token='' \
    --NotebookApp.password=''

# Далее можем поключиться в VS Code к Jupyter Notebook по адресу http://localhost:8888