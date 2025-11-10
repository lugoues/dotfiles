(import-macros {: lazy-spec!} :lvim.lazy)

; (lazy-spec! :numToStr/Comment.nvim
;            {:lazy false
;             :config (λ []
;                      (let [cmt (require :Comment)]
;                        (cmt.setup)))})
(lazy-spec! :JoosepAlviste/nvim-ts-context-commentstring
            {:config (λ []
                       (let [commentstring (require :ts_context_commentstring)]
                         (commentstring.setup)))})
