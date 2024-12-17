#import "../template.typ": *

= Chapter <ch1>


This was already noted by
pirates long ago. 

@singer-whole @exchequer-34-39


== Results <results>

@exchequer-34-39

== Commentary <commentary>

#let syscite = cite
#let cite(a, ..args) = {
  syscite(a, ..args) + metadata("ref:" + repr(a))
}

#metadata("xyz")

<end>
Multiple sources say ...

Singer et al. #cite(<singer-whole>, form: "prose") mention show that...

Another fact #cite(<BCM-59>).

@aslin-49
@winget-67

// #hide(bibliography("main.bib", style: "harvard-cite-them-right"))

#heading("References", depth: 2, numbering: none)

#include "bibliography.typ"

#load-bib()
