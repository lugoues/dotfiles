(import-macros {: lazy-spec! } :lvim.lazy
               {: exec!
                : set!
                : set+
                : augroup!}  :hibiscus.vim)

[(lazy-spec! :folke/trouble.nvim
             {:dependencies [:nvim-tree/nvim-web-devicons]})

 (lazy-spec! :VonHeikemen/lsp-zero.nvim
             {:lazy false
              :branch "v3.x"
              :event ["BufReadPre" "BufNewFile"]
              :config (fn []
                        (let [lsp-zero (require :lsp-zero)]
                              ; lsp (lsp-zero.preset {})]
                          (lsp-zero.on_attach (fn [client bufnr]
                                                (lsp-zero.default_keymaps {:buffer bufnr})))
                          (lsp-zero.setup {})))})


 (lazy-spec! :hrsh7th/nvim-cmp
               {:lazy false
                :dependencies [:L3MON4D3/LuaSnip
                               :hrsh7th/nvim-cmp
                               :hrsh7th/cmp-nvim-lsp]
                 :config (fn []
                           ; (print "nvim-cmp")
                           (let [cmp (require :cmp)
                                 luasnip (require :luasnip)]
                              (cmp.setup {:preselect cmp.PreselectMode.None
                                          :sources [{:name "nvim_lsp"}
                                                    {:name "luasnip"}]
                                          :mapping {"<CR>" (cmp.mapping.confirm {:select false})
                                                    "<C-Space" (cmp.mapping.complete)}
                                          :window {:completion (cmp.config.window.bordered)
                                                   :documentation (cmp.config.window.bordered)}
                                          :snippet {:expand (fn [args]
                                                                (luasnip.lsp_expand args.body))}})))})

 (lazy-spec! :neovim/nvim-lspconfig
            {:lazy false
             :dependencies [:VonHeikemen/lsp-zero.nvim]
             :config (fn [])})
                       ; (print "lsp"))})
                       ; (let [lspconfig (require :lspconfig)
                       ;       lsp-zero (require :lsp-zero)]
                       ;   (lspconfig.lua_ls.setup (lsp-zero.nvim_lua_ls))))})
                       ;
 (lazy-spec! :wilriamboman/mason.nvim
             {:lazy false
              ; :opts {:run_on_start true}
              :ops {:ui {:icons
                         {:package_installed "✓"
                          :package_pending "➜"
                          :package_uninstalled "✗"}}}
              :config (fn [_ opts]
                        (let [mason (require :mason)]
                         ; (print "mason setup")
                         (mason.setup opts)))})

 (lazy-spec! :camspiers/luarocks
            {:dependencies [:rcarriga/nvim-notify]
             :ops {:rocks ["fzy"]}})


 (lazy-spec! :williamboman/mason-lspconfig.nvim
             {:lazy false
              :dependencies [:williamboman/mason.nvim
                             :VonHeikemen/lsp-zero.nvim
                             :neovim/nvim-lspconfig
                             :hrsh7th/cmp-nvim-lsp
                             :camspiers/luarocks]
              :config (fn []
                        ; (print "mason-lspconfig")
                       (let [mason-lspconfig (require :mason-lspconfig)
                             lspconfig (require :lspconfig)
                             cmp-nvim-lsp (require :cmp_nvim_lsp)
                             lsp-capabilites (cmp-nvim-lsp.default_capabilities)]
                         (mason-lspconfig.setup
                           {:ensure_installed [:fennel_ls
                                               :lua_ls
                                               ; :tsserver
                                               :yamlls
                                               :bashls
                                               :dockerls]
                            :handlers {1 (fn [server]
                                           ; (print (.. "default handler - " server))
                                           (let [server (. lspconfig server)]
                                             (server.setup {:capabilities lsp-capabilites})))
                                       :fennel_ls (fn []
                                                    (lspconfig.fennel_ls.setup
                                                      {:settings
                                                        {:fennel-ls
                                                          {:extra-globals "hs spoon vim"
                                                           :macro-path (.. "./nvim/fnl/?.fnl;"
                                                                           "./nvim/fnl/?/init-macros.fnl;"
                                                                           "./nvim/macros/?.fnl;"
                                                                           "./?.fnl;./?/init-macros.fnl;./?/init.fnl;src/?.fnl;src/?/init-macros.fnl;src/?/init.fnl;"
                                                                           (.. (vim.fn.stdpath "data") "/lazy/tangerine.nvim/fnl/?.fnl;")
                                                                           (.. (vim.fn.stdpath "data") "/lazy/tangerine.nvim/fnl/?/init-macros.fnl;")
                                                                           (.. (vim.fn.stdpath "data") "/lazy/hibiscus.nvim/fnl/?.fnl;")
                                                                           (.. (vim.fn.stdpath "data") "/lazy/hibiscus.nvim/fnl/?/init-macros.fnl;"))}}}))
                                       :lua_ls (fn []
                                                 ; (print "configure lua_ls")
                                                 (lspconfig.lua_ls.setup {
                                                                         ; gcc:capabilites (cmp-nvim-lsp.default_capabilites)
                                                                          :settings {:Lua {:runtime {:version "LuaJIT"}
                                                                                           :diagnostics {:globals ["vim"]}
                                                                                           :workspace {:library [vim.env.VIMRUNTIME]}}}}))}})))})]


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
              ;;  (lsp.clojure_lsp.setup {})
                       ; (lsp.tsserver.setup {})))})
        ;;  (lsp.sumneko_lua.setup {:cmd ["lua-language-server"]
        ;;                          :settings {:Lua {:telemetry {:enable false}}}})



