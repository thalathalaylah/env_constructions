DOTPATH := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
DOTFILES := $(wildcard dotfiles/.??*) 

.DEFAULT_GOAL := help

list: ## Show dot files in this repository
	@$(foreach val, $(DOTFILES), /bin/ls -dF $(val);)

help: ## Self-documented Makefile
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

