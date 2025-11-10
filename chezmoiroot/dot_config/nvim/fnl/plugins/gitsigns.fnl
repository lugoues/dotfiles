(import-macros {: lazy-spec!} :lvim.lazy)

(lazy-spec! :lewis6991/gitsigns.nvim
            {:lazy false
             :dependencies [:nvim-lua/plenary.nvim]
             :config (fn []
                       (let [gitsigns (require :gitsigns)]
                         (gitsigns.setup)))})
