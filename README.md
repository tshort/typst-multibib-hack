
This is a hacky way to add end-of-chapter bibliography sections to
Typst. This feature is not natively supported
(https://github.com/typst/typst/issues/1097). The hack works as follows:

* The Typst document has a main bibliography that's invisible. All
  author-date citations get filled in normally by Typst.

* The Python script
  [update-bibliographies.py](./update-bibliographies.py) uses `typst
  query` to pull in the list of citations in each chapter. These are
  passed to [Pandoc](https://pandoc.org/) to format based on a CSL file.
  Run this before compiling the Typst document. Using `typst query` is a
  bit tricky because we need both `ref`'s and `cite`'s, but `cite`'s are
  not locatable. To get around this, `cite` is redefined to add metadata
  that is queried.

One huge drawback of this approach happens with conflicting citations
in different chapters. If you have two (Smith, 2024) citations, one will
be labeled 2024a, and the next will be labeled 2024b. That works if
those references are cited in the same chapter and nowhere else. If they
are in separate chapters, you'll get a 2024a in one and a 2024b in the
second. The main workaround for this is manual entry of the citations.
