# OTUS. Извлечение признаков - Spark MLlib

## План работы

0. Развернуть DataProc кластер из папки `infra`
    - Заполняем переменные в `terraform.tfvars`
    - Запускаем:
        ```bash
        cd infra
        terraform init
        terraform plan
        terraform apply -auto-approve
        ```
1. Пройдем по `commands.sh` для развертывания окружения
2. Проходим ноутбук `notebooks/feature_extraction.ipynb`
3. Удаляем кластер:
    ```bash
    cd infra
    terraform destroy -auto-approve
    ```