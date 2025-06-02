# Description: Команды для работы с Yandex.Cloud DataProc

# Обновляем переменные окружения в файле .env
# S3_BUCKET - название бакета S3
# PROXY_VM_IP - IP-адрес прокси-виртуальной машины

# Подгружаем переменные окружения
source .env

# Копируем данные в созданный бакет S3
# Предварительно нужно добавить AWS_ACCESS_KEY_ID и AWS_SECRET_ACCESS_KEY в файл конфиг s3cmd
make upload-data

# Подключаемся к прокси виртуальной машине 
ssh ubuntu@${PROXY_VM_IP}

# Подключаемся к мастер-ноде кластера
ssh dataproc-master

# Создаем папку для данных
hdfs dfs -mkdir -p /user/ubuntu/data

# Копируем данные из S3 в HDFS
hadoop distcp s3a://${S3_BUCKET}/titanic/* /user/ubuntu/data/titanic

# Проверяем, что данные скопировались
hdfs dfs -ls /user/ubuntu/data

####################################################################################################

# Запуск Jupyter Notebook
# Для этого необходимо пробросить порт 8888 с мастер-ноды на прокси-виртуальную машину и на локальную машину

# Подключаемся к прокси виртуальной машине
ssh -L 8888:localhost:8888 ubuntu@${PROXY_VM_IP}

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