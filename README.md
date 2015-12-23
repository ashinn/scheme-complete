# scheme-complete

Scheme-complete provides a single function, `scheme-smart-complete`,
which you can use for intelligent, context-sensitive completion for
any Scheme implementation.  The intelligent completion comes from the
use of simple type inference. In many cases this can drastically prune
the list of possible completions. For example, given the text

    (string-ref (n^

where the cursor is represented by ^, typing tab (or whatever you bind
the completion function to) would know that in the default R7RS
environment the only possible completion of a procedure returning a
string and beginning with "n" is number->string and would complete
that for you automatically.

Given

    (let ((len (string-length str)))
      (string-ref str (- ^

completing would fill in "len" as the only possible completion since a
number is required as an argument to - and all the standard R5RS
bindings are procedures and syntax.

Relying on this completion for known type procedures is a handy way to
avoid type errors, even before the compilation. In more general cases
it's just nice to have basic pruning, such as not completing syntax in
a non-operator position.

Currently completion inside strings does filename completion, though
this may be made more flexible in the future.
