(import-macros {: lazy-spec!
                : lazy-key! } :lvim.lazy)

; -- (lazy-spec! :nvim-neo-tree/neo-tree.nvim
; --            {:enabled false
; --             :keys [(lazy-key! "<leader>td" (fn [] (print "testeng2")))
; --                    {1 "<leader>tf"
; --                     2 (fn [] (print "testing"))}]})

(lazy-spec! :gbprod/yanky.nvim
            {:config {:highlight {:on_put true
                                  :on_yank true
                                  :timer 400}
                      :preserve_cursor_position {:enabled true}}})


(lazy-spec! :gbprod/cutlass.nvim
            {:config {:cut_key "m"
                      :override_del true}})
