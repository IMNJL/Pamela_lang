// LTL формулы
ltl f1 { <> (g && X(v)) }
ltl f2 { (tr_v) -> ( (tr_v) U (o) ) }
ltl f3 { [] (o -> (X(qr) || X(m) || X(c) || X(tr_input))) }
ltl f4 { <> (qr && X(tr_input)) }
ltl f5 { (d) U (v) }