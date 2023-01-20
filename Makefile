api/bin/pip:
	@echo "$(GREEN)==> Setup Virtual Env$(RESET)"
	python3 -m venv .

.PHONY: start
start:
	@echo "start mkdocs server"
	bin/mkdocs serve

.PHONY: install
install: api/bin/pip
	@echo "setting up mkdocs server"
	bin/pip install -r requirements.txt

.PHONY: clean
clean:
	@echo "removing py build"
	rm -rf bin lib pyvenv.cfg
