;; fennel-ls: macro-file
(require-macros :hibiscus.utils
                :hibiscus.core
                :lvim.utils)

(local M {})

(lambda build-component [opts]
 (when (table? opts)
    (let [init (. opts :init)
          components (. opts :components)]
      (when (not (= init nil))
        (set opts.initxx `(lambda [self]
                            ,(let [t (init self)]
                               (each [k v (pairs t)]
                                 (tset self k v))))))
      (when (table? components)
         (tset opts :components nil)
         (each [k v (ipairs components)]
             (tset opts k v)
             (when (table? v)
               (build-component v)))))
  :return opts))


(lun component! [name component]
  ; "Helper for heirline to work around mixed tables in Fennel"
  (check [:sym name
          :table component])
  (set component.initxxxx "x")

  `(local ,name ,(build-component component)))


:return M
