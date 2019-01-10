DOTPATH := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
DOTFILES := $(wildcard dotfiles/.??*) 

.DEFAULT_GOAL := help

list: ## Show dot files in this repository
	@$(foreach val, $(DOTFILES), /bin/ls -dF $(val);)

init: ## Setup environment settings
	@DOTPATH=$(DOTPATH) bash $(DOTPATH)/etc/init/init.sh

update: ## Fetch changes for this repository
	@DOTPATH=$(DOTPATH) bash $(DOTPATH)/etc/update.sh

deploy: ## Create symlink for dotfile and install plugin
	@$(foreach val, $(DOTFILES), ln -snfv $(abspath $(val)) $(HOME)/$(subst dotfiles/,,$(val)))
	@DOTPATH=$(DOTPATH) bash $(DOTPATH)/etc/deploy/fisher.sh

test: ## Test environment settings
	@DOTPATH=$(DOTPATH) bash $(DOTPATH)/etc/test/test.sh

help: ## Self-documented Makefile
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
