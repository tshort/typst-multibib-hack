
#import "template.typ": *

#set heading(numbering: "1.")

#align(center, text(17pt)[
  *Example*
])

#include("1/ch1.typ")
#include("2/ch2.typ")
#include("3/ch3.typ")

#show bibliography: none

#load-bib(main: true)