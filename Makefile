.PHONY: all
all: test

.PHONY: test
test:
	docker build --tag maturin-repro .
	docker run -it maturin-repro find target/wheels -type f -name "*.whl" -execdir pip3 install -U -v --break-system-packages {} \;
	docker run -it maturin-repro find target/wheels -type f -name "*.tar.gz" -execdir pip3 install -U -v --break-system-packages {} \;
	docker rm maturin-repro
