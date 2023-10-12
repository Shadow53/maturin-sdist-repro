This repository exists as a reproduction of an issue in [Maturin](https://github.com/PyO3/maturin)
where the sdist fails to build if the original crate is part of a workspace.

To reproduce:

1. Clone the repository
2. Make sure `make` and `docker` are available on your machine
3. Run `make test`

You should see the following error:

```
  Running command Preparing metadata (pyproject.toml)
  error: current package believes it's in a workspace when it's not:
  current:   /tmp/pip-req-build-_gj0kdlu/crates/word-count/Cargo.toml
  workspace: /tmp/pip-req-build-_gj0kdlu/Cargo.toml

  this may be fixable by adding `crates/word-count` to the `workspace.members` array of the manifest located at: /tmp/pip-req-build-_gj0kdlu/Cargo.toml
  Alternatively, to keep it out of the workspace, add the package to the `workspace.exclude` array, or add an empty `[workspace]` table to the package's manifest.
  💥 maturin failed
    Caused by: Cargo metadata failed. Does your crate compile with `cargo build`?
    Caused by: `cargo metadata` exited with an error:
  Error running maturin: Command '['maturin', 'pep517', 'write-dist-info', '--metadata-directory', '/tmp/pip-modern-metadata-niydeb24', '--interpreter', '/usr/bin/python3']' returned non-zero exit status 1.
  Checking for Rust toolchain....
  Running `maturin pep517 write-dist-info --metadata-directory /tmp/pip-modern-metadata-niydeb24 --interpreter /usr/bin/python3`
  error: subprocess-exited-with-error

  × Preparing metadata (pyproject.toml) did not run successfully.
  │ exit code: 1
  ╰─> See above for output.
```
