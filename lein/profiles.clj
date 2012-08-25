{:user
 {:plugins [[lein-tarsier "0.9.1"]
            [lein-localrepo "0.4.0"]
            [lein-marginalia "0.7.1"]]
  :dependencies [[clj-stacktrace "0.2.4"]]
  :injections [(let [orig (ns-resolve (doto 'clojure.stacktrace require)
                                       'print-cause-trace)
                     orig2 (ns-resolve (doto 'clojure.stacktrace require)
                                       'print-stack-trace)
                     orig3 (ns-resolve (doto 'clojure.repl require)
                                       'pst)
                     new (ns-resolve (doto 'clj-stacktrace.repl require)
                                     'pst+)
                     ]
                 ;; goddamn, just replace the stack trace plz
                  (alter-var-root orig (constantly @new))
                  (alter-var-root orig2 (constantly @new))
                  (alter-var-root orig3 (constantly @new))
                 )]
  }}
