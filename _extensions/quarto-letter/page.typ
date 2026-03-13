#set page(
        paper: "$paper$",
        margin: (
            top: $margin.top$,
            bottom: $margin.bottom$,
            left: $margin.left$,
            right: $margin.right$
        ),
        numbering: numbering,
        number-align: $number-align$,
        header: align(center)[#image("$logo.path$", width: 90mm)],
        //header-ascent: -2mm,
        footer: align(right)[#text(9pt)[Seite #context counter(page).display("1 von 1",both: true,)]]
  )
