#
# OS2display infrastructure makefile.

# =============================================================================
# MAIN COMMAND TARGETS
# =============================================================================
.DEFAULT_GOAL := help
# Include environment variables and re-export them.
include _variables.source
export

help: ## Display a list of the public targets
# Find lines that starts with a word-character, contains a colon and then a
# doublehash (underscores are not word-characters, so this excludes private
# targets), then strip the hash and print.
	@grep -E -h "^\w.*:.*##" $(MAKEFILE_LIST) | sed -e 's/\(.*\):.*##\(.*\)/\1	\2/'

# We attempt to stick with the reload infra images for now.
# build-infra-images: ## Build docker-images.
# 	images/build-infra-images.sh

build-release-image: ## Build a release and tag it by TAG
	images/build-release-image.sh $(ADMIN_RELEASE_TAG)

push-release-image: ## Push a release specified by TAG
	images/push-release-image.sh $(ADMIN_RELEASE_TAG)

# We attempt to stick with the reload infra images for now.
# push-infra-images: ## Push docker-images.
# 	images/push-infra-images.sh

.PHONY: help build-infra-images build-release-image push-release-image push-infra-images
