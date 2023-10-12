# This boilerplate enables the Rust-built and pure-Python package contents to coexist in the same package root.
# See: https://www.maturin.rs/project_layout.html
from .word_count import *

__doc__ = word_count.__doc__
if hasattr(word_count, "__all__"):
    __all__ = word_count.__all__
