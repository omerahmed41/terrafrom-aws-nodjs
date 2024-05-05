build_and_push:
	docker-compose build && docker tag energy-app_js:latest omerahmed41/energy-app:latest && docker push omerahmed41/energy-app:latest


terrafrom_init:
	terraform init

terrafrom_fmt:
	terraform fmt

terrafrom_validate:
	terraform validate

terrafrom_apply:
	terraform apply
