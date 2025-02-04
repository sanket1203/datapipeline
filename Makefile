# Makefile for python3 code
# 
# > make help
#
# The following commands can be used.
#
# init:  sets up environment and installs requirements
# clean:  Remove build and cache files
# env:  Source venv and environment files for testing
# test:  Run pytest
# run:  Executes the logic


VENV_PATH='env\Scripts\activate.bat'
ENVIRONMENT_VARIABLE_FILE='.env'

define find.functions
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'
endef

help:
	@echo 'The following commands can be used.'
	@echo ''
	$(call find.functions)

init: ## sets up environment and installs requirements
init:
	python3 -m venv env
	bash $(VENV_PATH)
	pip3 install -r requirements.txt

clean: ## Remove build and cache files
clean:
	rm -rf *.egg-info
	rm -rf build
	rm -rf dist
	rm -rf .pytest_cache
	# Remove all pycache
	find . | grep -E "(__pycache__|\.pyc|\.pyo$\)" | xargs rm -rf

env: ## Source venv and environment files for testing
env:
	python3 -m venv env
	source $(VENV_PATH)

leave: ## Cleanup and deactivate venv
leave: deactivate

test: ## Run pytest
test:
	pytest . -p no:logging -p no:warnings

run: ##Run the entry point
run: 
	bash $(VENV_PATH)
	env/bin/python3 pipeline/main.py


# package: ## Create package in dist
# package: clean
# 	python3 setup.py sdist bdist_wheel

# upload-test: ## Create package and upload to test.pypi
# upload-test: package
# 	python3 -m twine upload --repository-url https://test.pypi.org/legacy/ dist/* --non-interactive --verbose

# upload: ## Create package and upload to pypi
# upload: package
# 	python3 -m twine upload dist/* --non-interactive