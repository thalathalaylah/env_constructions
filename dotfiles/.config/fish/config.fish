set PATH $HOME/bin $HOME/.anyenv/bin $PATH
status --is-interactive; and source (anyenv init -|psub)

function fish_user_key_bindings
  bind \cr 'peco_select_history (commandline -b)'
  bind \c] peco_select_ghq_repository
  bind \cx peco_recentd
end
