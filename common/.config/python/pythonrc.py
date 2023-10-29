#!/usr/bin/env python
"""
Enable custom python_history location, set this file as environment variable
    PYTHONSTARTUP
"""

import atexit
import os
import readline
import time


def write_history(path):
    import os
    import readline
    try:
        os.makedirs(os.path.dirname(path), mode=0o700, exist_ok=True)
        readline.write_history_file(path)
    except OSError:
        pass


history = os.path.join(
        os.path.join(
                os.environ.get('XDG_CACHE_HOME') or os.path.expanduser('~/.cache'),
                'python'
            ),
        # if the variable is set it will be an absolute path and override previous
        #   set path
        os.environ.get('PYTHONPYCACHEPREFIX'),
        'python_history'
    )

try:
    readline.read_history_file(history)
except FileNotFoundError:
    pass

# Prevents creation of default history if custom history is empty
if readline.get_current_history_length() == 0:
    readline.add_history(f'# History created at {time.asctime()}')


# Jedi completion
try:
    from jedi.utils import setup_readline
except ImportError:
    # Fallback to stdlib readline completer
    print("Jedi is not installed, falling back to readline")
    try:
        import readline
        import rlcompleter
        readline.parse_and_bind("tab: complete")
    except ImportError:
        print("Readline is not installed either. No tab completion is enabled.")
else:
    setup_readline()
