DOTPATH := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
DOTFILES := $(wildcard dotfiles/.??*) 

.DEFAULT_GOAL := help

list: ## Show dot files in this repository
	@$(foreach val, $(DOTFILES), /bin/ls -dF $(val);)

require_root_privilege: ## Exec sudo command for require root privilege commands
	@echo 'Require root privilege'
	@sudo -S echo 'Root privilege accepted'

init: ## Setup environment settings
	@DOTPATH=$(DOTPATH) sudo -S bash $(DOTPATH)/etc/init/init.sh

user_init: ## Setup apps by user privilege
	@DOTPATH=$(DOTPATH) bash $(DOTPATH)/etc/user_init/user_init.sh

update: ## Fetch changes for this repository
	@DOTPATH=$(DOTPATH) bash $(DOTPATH)/etc/update.sh

deploy: ## Create symlink for dotfile and install plugin
	@$(foreach val, $(DOTFILES), ln -snfv $(abspath $(val)) $(HOME)/$(subst dotfiles/,,$(val)))
	@DOTPATH=$(DOTPATH) bash $(DOTPATH)/etc/deploy/fisher.sh

after_deploy: ## Instoll apps depends on dotfiles
	@DOTPATH=$(DOTPATH) bash $(DOTPATH)/etc/after_deploy/after_deploy.sh

install: require_root_privilege update init user_init deploy after_deploy ## Run initial setup commands
	@echo 'Set default shell by "chsh -s $$(which fish)"'

test: ## Test environment settings
	@DOTPATH=$(DOTPATH) bash $(DOTPATH)/etc/test/test.sh

help: ## Self-documented Makefile
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
