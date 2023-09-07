.PHONY: help # Generate list of targets with descriptions.
help:
	clear
	@echo '---------------------------------------------------------------------------------------------------'
	@echo 'LIST OF AVAILABLE COMMANDS [TERRAFORM]'
	@echo '---------------------------------------------------------------------------------------------------'
	@grep '^.PHONY: .* #' Makefile | sed 's/\.PHONY: \(.*\) # \(.*\)/\1:\t\2/' | column -ts "$$(printf '\t')"
	@echo '---------------------------------------------------------------------------------------------------'

.PHONY: rebuild # Rebuild all remote objects managed by Terraform.
rebuild:
	$(MAKE) destroy \
			build mode=0

.PHONY: destroy # Destroy all remote objects managed by Terraform.
destroy:
	terraform destroy -auto-approve

.PHONY: build [mode] # Build all remote objects managed by Terraform.
build:
	if [ $(mode) = 1 ]; \
		then terraform init; \
	fi

	terraform apply -auto-approve
	terraform output > $(PWD)/output.txt
	chmod -R 400 $(PWD)/certs/admin.pem