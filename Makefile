.PHONY: install
install:
	pip install .

.PHONY: uninstall
uninstall:
	pip uninstall stock-cutting

.PHONY: build-container
build-container: 
	docker build -t drewblasius/stock-cutting .

.PHONY: run-test-container
run-test-container:
	docker run --rm -v ${PWD}:/home/project --workdir /home/project \
		drewblasius/stock-cutting make test

.PHONY: test-container
test-container: build-container run-test-container

.PHONY: test
test: install
	tox

.PHONY: clean
clean:
	rm -rf .tox/

.PHONY: dist
dist:
	python setup.py sdist bdist_wheel	

.PHONY: notebook
notebook:
	docker-compose up --build -d
