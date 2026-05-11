#import "../template.typ": course-name, title, author, company

#heading(outlined: false, "Abstract")

#table(
  columns: (1fr, 3fr),
  inset: 7pt,
  stroke: none,
  table.header(
    [*Titel:*],       [#title],
    [*Verfasserin:*], [#author],
    [*Kurs:*],        [#course-name],
    [*Unternehmen:*], [#company],
  ),
)

#lorem(80)

#v(0.8em)

#lorem(80)

#v(0.8em)

#lorem(80)

#pagebreak()
