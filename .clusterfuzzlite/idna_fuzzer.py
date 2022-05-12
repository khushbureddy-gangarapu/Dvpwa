import atheris
import sys
import os


# This tells Atheris to instrument all functions in the `struct` and
# `example_library` modules.
with atheris.instrument_imports():
  import struct
  import idna


@atheris.instrument_func  # Instrument the TestOneInput function itself

def TestOneInput(data):
    try:
        idna.decode(data)
    
    except idna.IDNAError:
        pass
  

atheris.instrument_all()
atheris.Setup(sys.argv, TestOneInput)
atheris.Fuzz()
