(import-macros {: lazy-spec!} :lvim.lazy)
(import-macros {: g!} :hibiscus.vim)

(lazy-spec! :gpanders/nvim-parinfer
           {:config (fn []
                      (g! parinfer_force_balance true)
                      (g! parinfer_mode "smart"))})
