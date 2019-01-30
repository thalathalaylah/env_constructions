set -gx PATH $HOME/bin $HOME/.anyenv/bin $PATH
anyenv init - fish | source

function fish_user_key_bindings
  bind \cr 'peco_select_history (commandline -b)'
  bind \c] peco_select_ghq_repository
  bind \cx peco_recentd
end
