FROM rust:latest

RUN apt-get update && apt-get install -y python3 python3-pip
RUN python3 -V && pip3 -V

# --break-system-packages allows us to avoid needing to create a venv
RUN pip3 install --break-system-packages --upgrade maturin==1.3.0

COPY . .

# Build a wheel and an sdist. The wheel will be created successfully, but the sdist will later fail
RUN maturin build --sdist --features pyo3/extension-module --release --strip --manifest-path crates/word-count/Cargo.toml

