# ~/.bash_functions: user-written functions executed by bash(1) on startup.

mkcd()
{
  mkdir -p -- "$1" && cd -P -- "$1"
}

