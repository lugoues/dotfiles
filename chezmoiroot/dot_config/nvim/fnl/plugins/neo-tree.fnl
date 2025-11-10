(import-macros {: lazy-spec!
                : lazy-key! } :lvim.lazy)

(lazy-spec! :nvim-neo-tree/neo-tree.nvim
           {:enabled false
            :keys [(lazy-key! "<leader>td" (fn [] (print "testeng2")))
                   {1 "<leader>tf"
                    2 (fn [] (print "testing"))}]})
