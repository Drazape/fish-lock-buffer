function _lock-buffer_write --description='Write buffer from bindings' --on-event=fish_postexec
    set --query --global -- _locked_buffer &&
        commandline --current-buffer -- {$_locked_buffer}
end
