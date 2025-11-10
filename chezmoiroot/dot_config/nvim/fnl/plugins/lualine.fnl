(import-macros {: lazy-spec!} :lvim.lazy)

; (lambda section! [identifier ?options]
;   (let [options (or ?options {})]
;     (doto options (tset 1 identifier))
;     :return
;     options))
;
;
; (lambda icon [] (let [devicons (require :nvim-web-devicons)
;                       fullname (vim.api.nvim_buf_get_name 0)
;                       name (vim.fn.fnamemodify fullname ":t")
;                       ext (vim.fn.fnamemodify name ":e")
;                       [icon color] (devicons.get_icon_color name ext {:default true})]
;                   (and icon (.. icon ""))))
;
; (lambda buf-empty? [] (let [name (vim.fn.expand "%:t")
;                             empty? (vim.fn.empty name)]
;                         (not (= empty? 1))))
;
; (lambda git-repo? [] (let [filepath (vim.fn.expand "%:p:h")
;                            gitdir (vim.fn.finddir ".git" (.. filepath ";"))]
;                         (and gitdir (> (length gitdir) 0) (< (length gitdir) (length filepath)))))

(lazy-spec! :nvim-lualine/lualine.nvim
            {:lazy false
             :dependencies [:nvim-tree/nvim-web-devicons]
             :config (lambda []
                       (let [lualine (require :lualine)
                             ; devicons (require :nvim-web-devicons)
                             config {:options {:component_separators ""
                                               :section_separators ""
                                               ;:always_divide_middle true
                                               :theme "oxocarbon"
                                               :refresh {:statusline 200}}}]

                                     ; :sections {:lualine_a [(section! ; Color mode block
                                     ;                                  (lambda [] "  ")
                                     ;                                  {:padding {:left 0}})
                                     ;                        (section! ; file type icon)]
                                     ;                                  (lambda [] (when devicons (icon))))
                                     ;                        (section! ; filename
                                     ;                                  "filename"
                                     ;                                  {:path 0
                                     ;                                   :symbols {:modified "●"
                                     ;                                             :readonly ""
                                     ;                                             :unnamed "[No Name]"
                                     ;                                             :newfile "[New]"}})
                                     ;                        (section! ; git
                                     ;                                  "branch"
                                     ;                                  {:icon ""})]
                                     ;            :lualine_b []
                                     ;            :lualine_c []
                                     ;            :lualine_x []
                                     ;            :lualine_y []
                                     ;            :lualine_z []}
                                     ; :inactive_sections {:lualine_a ["filename"]
                                     ;                     :lualine_b ["location"]}}]
                           (lualine.setup config)))})
             ; :opts {:options.{:theme "auto"}}})
