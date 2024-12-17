#import "../template.typ": *

= Chapter <ch3>


Citing Jane Doe from the prior chapter is broken, so `@doe22b` doesn't work.

We need to enter the citation text manually and add metadata, so the ref shows up in the references:  (Doe, 2022) and `#metadata("ref:<doe22b>")` #metadata("ref:<doe22b>").

#let syscite = cite
#let cite(a, ..args) = {
  syscite(a, ..args) + metadata("ref:" + repr(a))
}

#metadata("xyz")

<end>

#cite(<aslin-49>, form: "prose") show that...

Another fact #cite(<singer-whole>).

#heading("References", depth: 2, numbering: none)

#include "bibliography.typ"

#load-bib()
