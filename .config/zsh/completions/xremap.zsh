#compdef xremap

autoload -U is-at-least

_xremap() {
    typeset -A opt_args
    typeset -a _arguments_options
    local ret=1

    if is-at-least 5.2; then
        _arguments_options=(-s -S -C)
    else
        _arguments_options=(-s -C)
    fi

    local context curcontext="$curcontext" state line
    _arguments "${_arguments_options[@]}" \
'*--device=[Include a device name or path]:DEVICE: ' \
'*--ignore=[Ignore a device name or path]:IGNORE: ' \
'*--watch=[Targets to watch \[possible values: device, config\]]:WATCH:((device\:"Device to add new devices automatically"
config\:"Config to reload the config automatically"))' \
'--completions=[Generate shell completions]:SHELL:(bash elvish fish powershell zsh)' \
'-h[Print help information]' \
'--help[Print help information]' \
'-V[Print version information]' \
'--version[Print version information]' \
'--mouse[Match mice by default]' \
'*::configs -- Config file(s):' \
&& ret=0
}

(( $+functions[_xremap_commands] )) ||
_xremap_commands() {
    local commands; commands=()
    _describe -t commands 'xremap commands' commands "$@"
}

_xremap "$@"
