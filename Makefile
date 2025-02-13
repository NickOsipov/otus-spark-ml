include .env

check-venv:
	which python3

create-bucket:
	s3cmd mb s3://$(S3_BUCKET)

upload-data:
	s3cmd put --recursive data/titanic s3://$(S3_BUCKET)/