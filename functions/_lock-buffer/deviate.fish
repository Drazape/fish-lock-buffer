function _lock-buffer_deviate --description='Deviate locked buffer on unmatched input'
    string match --quiet --invert -- ^(commandline --current-buffer | string escape --style=regex) {$_locked_buffer} &&
        set --erase --global -- _locked_buffer
end
