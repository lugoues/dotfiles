(import-macros {: lazy-spec!} :lvim.lazy)

[]
  ; (lazy-spec! :williamboman/mason-lspconfig.nvim
  ;            {:lazy false
  ;             :dependencies [:williamboman/mason.nvim
  ;                            :neovim/nvim-lspconfig]
  ;             :config (fn []
  ;                      (let [lsp (require :lspconfig)]
  ;
  ;              ;;  (lsp.clojure_lsp.setup {})
  ;                       (lsp.tsserver.setup {})))})
  ;       ;;  (lsp.sumneko_lua.setup {:cmd ["lua-language-server"]
  ;       ;;                          :settings {:Lua {:telemetry {:enable false}}}})
  ;
  ;
  ; (lazy-spec! :williamboman/mason.nvim
  ;            {:lazy false
  ;             :opts {:run_on_start true}})]
  ;
  ;   ;; :opts {:ui
  ;   ;;         {:icons
  ;   ;;           {:package_installed "✓"}}
  ;   ;;         :ensure_installed [:lua-language-server
  ;   ;;                                           :vim-language-server
  ;   ;;                                           :shellcheck
  ;   ;;                                           :bashls
  ;   ;;                                           :yamlls
  ;   ;;                                           :tsserver
  ;   ;;                                           :yamllint
  ;   ;;                                           ;; :sqlls
  ;   ;;                                           :html-lsp
  ;   ;;                                           :json-lsp
  ;   ;;                                           :fennel_language_server
  ;   ;;                                           :dagger]
  ;   ;;           :auto_update false
  ;   ;;           :run_on_start true}}}
  ;
  ;
