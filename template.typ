// Adapted from PgBiel's post at:
// https://forum.typst.app/t/how-to-share-bibliography-in-a-multi-file-setup/1605/9

#let load-bib(main: false) = {
  counter("bibs").step()
  show bibliography: none

  context if main {
    [#bibliography("main.bib", style: "harvard-cite-them-right") <main-bib>]
  } else if query(<main-bib>) == () and counter("bibs").get().first() == 1 {
    // This is the first bibliography, and there is no main bibliography
    bibliography("main.bib", style: "harvard-cite-them-right")
  }
}

#let syscite = cite
#let cite(a, ..args) = {
  syscite(a, ..args) + metadata("ref:" + repr(a))
}

