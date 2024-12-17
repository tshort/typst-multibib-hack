

'typst query t.typ "selector(ref.where(element: none)).or(metadata)"'


import json
import subprocess
import re
import pathlib

def makebib(fn, bibfile, cslfile):
    keys = []
    a = json.loads(subprocess.run(
        ["typst", "query", fn, 'selector(ref.where(element: none)).or(metadata)', "--root", "."],
        capture_output = True).stdout) 
    for el in a:
        if el["func"] == "ref":
            keys.append("@" + el["target"][1:-1])
        if el["func"] == "metadata" and len(el["value"]) > 5 and el["value"][:5] == "ref:<":
            keys.append("@" + el["value"][5:-1])
    print(" ".join(keys))
    a = subprocess.check_output(
        ["pandoc", "--bibliography=" + bibfile, "--citeproc", "-t", "typst", "--csl", cslfile],
        input = " ".join(keys),
        text = True) 
    # strip off the `cite`s at the beginning
    a = re.sub(re.compile(r".*?#block", re.DOTALL), "#block", a, count = 1)
    with open(pathlib.Path(fn).parents[0].joinpath("bibliography.typ"), "w") as out:
        out.write(a)

makebib("1/ch1.typ", "main.bib", "harvard-cite-them-right.csl")
makebib("2/ch2.typ", "main.bib", "harvard-cite-them-right.csl")
makebib("3/ch3.typ", "main.bib", "harvard-cite-them-right.csl")
