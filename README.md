# OTUS. Извлечение признаков - Spark MLlib

## План работы

0. Развернем DataProc кластер из репозитория [otus-practice-cloud-infra](https://github.com/NickOsipov/otus-practice-cloud-infra)
    - Клонируем репозиторий
    - Заполняем переменные в `infrastructure/terraform.tfvars`
    - Запускаем:
        ```bash
        cd infrastructure
        terraform init
        terraform plan
        terraform apply -auto-approve
        ```
1. Пройдем по `commands.sh` для развертывания окружения
2. Пройдем по ноутбуку `notebooks/feature_extraction.ipynb`
3. Удаляем кластер:
    ```bash
    terraform destroy -auto-approve
    ```