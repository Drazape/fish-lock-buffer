function _fish-lock-buffer_uninstall --on-event=fish-lock-buffer_uninstall --description='Remove all sub-functions'
    rm ~/.config/fish/functions/_lock-buffer_*.fish
end

function _fish-lock-buffer_install --on-event=fish-lock-buffer_install --description='Install dependencies; parse sub-function file-names'
    cd ~/.config/fish/functions/
    for file in _lock-buffer/**.fish
        mv {$file} _(string replace --all -- / _ {$file})
    end
    rm -r ./_lock-buffer/
    prevd
end

function _fish-lock-buffer_update --on-event=fish-lock-buffer_update --description='Update dependencies; redo installation steps'
    _fish-lock-buffer_uninstall
    _fish-lock-buffer_install
end
