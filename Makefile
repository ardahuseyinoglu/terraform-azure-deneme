TF_DIR := deployment/terraform
TF_RUN=terraform -chdir=${TF_DIR}
TF_PLAN_FILE=apply.tfplan
# ENV := $(shell ./get-env.sh ${GIT_BRANCH})
# GIT_BRANCH := $(shell git rev-parse --abbrev-ref HEAD)

tf-init:
	$(TF_RUN) init 

tf-plan-show:
	$(TF_RUN) show \
		-json \
		${TF_PLAN_FILE}

tf-plan: tf-init
	$(TF_RUN) plan \
		-out=${TF_PLAN_FILE}

deploy: tf-plan
	$(TF_RUN) apply ${TF_PLAN_FILE}

tf-destroy:
	$(TF_RUN) plan -destroy \
		-out=${TF_PLAN_FILE}
	$(TF_RUN) apply ${TF_PLAN_FILE}

tf-state-backup: tf-init
	$(TF_RUN) state pull > ${ENV}-state.bkp

create-storage:
	./scripts/create-tfstate-storage.sh