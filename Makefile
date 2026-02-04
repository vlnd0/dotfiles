.PHONY: help install uninstall update test

help:
	@echo "Dotfiles Management"
	@echo ""
	@echo "  make install    - Install all dotfiles"
	@echo "  make uninstall  - Remove symlinks"
	@echo "  make update     - Pull and reinstall"
	@echo "  make test       - Test configuration"

install:
	@./install.sh

uninstall:
	@cd $(HOME)/dotfiles && stow -D zsh p10k fzf git scripts wakatime aerospace atuin ghostty zed

update:
	@git pull
	@$(MAKE) install

test:
	@zsh -n ~/.zshrc && echo "✓ .zshrc OK"
	@zsh -n ~/.zshenv && echo "✓ .zshenv OK"
	@find ~/.config/zsh -name "*.zsh" -exec zsh -n {} \; && echo "✓ All modules OK"
