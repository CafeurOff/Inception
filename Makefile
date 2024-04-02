# Inception | Docker initialisation script

#Some colors
GREEN	=	\033[0;32m
RED		=	\033[0;31m
DEFAULT	=	\033[0m
ORANGE =   \033[0;33m

# Build Docker containers
all: build


build:
	@clear
	@echo "$(ORANGE)Building Inception..."
	@cd srcs && docker-compose build
	@echo "$(GREEN)Inception is ready to use !"

down:
	@clear
	@echo "$(ORANGE)Stopping Inception..."
	@cd srcs && docker-compose down -v --remove-orphans --rmi all --volume
	@echo "$(GREEN)Inception is now stopped !"

prune: down
	@clear
	@echo "$(ORANGE)Pruning Inception..."
	@cd srcs && docker system prune -af --volumes
	@echo "$(GREEN)Inception is now pruned !"

re: prune build
	@clear
	@echo "$(ORANGE)Restarting Inception..."

.PHONY: all build up down prune re