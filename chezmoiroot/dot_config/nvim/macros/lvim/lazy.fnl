;; fennel-ls: macro-file

(local M {})

(lambda M.lazy-key! [lhs rhs ?options]
  (let [options (or ?options {})]
    (doto options
      (tset 1 lhs)
      (tset 2 rhs))
    :return
    options))

(lambda M.lazy-spec! [identifier ?options]
  "Helper for Lazy to work around mixed tables in Fennel"
  (let [options (or ?options {})]
    (doto options (tset 1 identifier))
    :return
    options))

;; (lambda M.deepcopy [obj ?seen]
;;  (when (not= (type obj) :table) (lua "return obj"))
;;  (when (and ?seen (. ?seen obj))
;;    (let [___antifnl_rtn_1___ (. ?seen obj)]
;;      (lua "return ___antifnl_rtn_1___")))
;;  (let [s (or ?seen {})
;;        res {}]
;;   (tset s obj res)
;;   (each [k v (pairs obj)] (tset res (M.deepcopy k s) (M.deepcopy v s)))
;;   (setmetatable res (getmetatable obj))))

M
