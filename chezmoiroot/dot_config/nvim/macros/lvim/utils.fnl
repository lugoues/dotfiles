;; fennel-ls: macro-file

(local M {})

(fn M.nil? [x]
  (= nil x))

(fn M.str? [x]
  (= :string (type x)))

(fn M.num? [x]
  (= :number (type x)))

(fn M.bool? [x]
  (= :boolean (type x)))

(fn M.fn? [x]
  (= :function (type x)))

(fn M.tbl? [x]
  (= :table (type x)))

(fn M.->str [x]
  (tostring x))

(fn M.->bool [x]
  (if x true false))

(fn M.merge! [a b]
  (each [k v (pairs b)] (tset a k v)))

(fn M.in [key table]
  `(let [v (rawget ,table ,key)]
     (not= v nil)))

(fn M.pack [...]
  "Portable `table.pack` implementation."
  (doto [...]
    (tset :n (select :# ...))))

(lambda M.lazy-key! [lhs rhs ?options]
  (let [options (or ?options {})]
    (doto options
      (tset 1 lhs)
      (tset 2 rhs))
    :return
    options))

M
