#import "../template.typ": *

#let hrule = align(center, line(length: 100%))

#let info-label = content => text(weight: "semibold", size: 12pt, font: heading-font, content)
#let info-value = content => text(weight: "regular", size: 12pt, font: heading-font, content)

#let titlepage-font-size = 14pt
#set text(size: titlepage-font-size)
#set page(margin: (x: auto, y: auto))

#stack(
  dir: ltr,
  spacing: 1fr,
  if logo-left != none {
    set image(height: 2cm)
    logo-left
  },
  if logo-right != none {
    set image(height: 2.2cm)
    logo-right
  },
)

#v(3em)

#hrule
#v(0.5em)
#align(center, box(
  width: 100%,
  par(justify: false, linebreaks: "optimized", text(
    weight: "semibold",
    font: heading-font,
    size: 18pt,
    hyphenate: false,
  )[#title]),
))
#v(0.5em)
#hrule

#v(2em)

#align(
  center,
  if kind == "Bachelor" {
    par(leading: 0.8em)[
      #text(weight: "semibold")[Bachelor-Thesis] \
      #text(size: 12pt)[zur Erlangung des akademischen Grades Bachelor of Science (B.Sc.)] \
      \
      #text(size: 14pt)[
        #university \
        #field-of-study \
      ]
    ]
  } else if kind == "Master" {
    par(leading: 0.8em)[
      #text(weight: "semibold", size: 19pt)[Master-Thesis] \
      \
      #text(size: 12pt)[zur Erlangung des akademischen Grades Master of Science (M.Sc.)] \
      \
      #text(size: 14pt)[
        #university \
        #field-of-study \
      ]
    ]
  } else if kind == "PA1" {
    par(leading: 0.8em)[
      #text(weight: "semibold", size: 19pt)[Projektarbeit I] \
      \
      #text(size: 14pt)[
        #university \
        #field-of-study \
      ]
    ]
  } else {
    par(leading: 0.8em)[
      #text(weight: "semibold", size: 19pt)[Projektarbeit II] \
      \
      #text(size: 14pt)[
        #university \
        #field-of-study \
      ]
    ]
  },
)

#v(1em)

#align(center, block[
  #table(
    stroke: none,
    columns: (auto, auto),
    inset: 5.5pt,
    align: start,
    table.header(
      info-label[Verfasser:],                   info-value[#author],
      info-label[Matrikelnummer:],              info-value[#matriculation-number],
      info-label[Unternehmen:],                 info-value[#company],
      info-label[Abteilung:],                   info-value[#company-department],
      info-label[Kurs:],                        info-value[#course-name],
      info-label[Studiengangsleiter:],          info-value[#program-director],
      info-label[Wissenschaftlicher Betreuer:], info-value[#supervisor-hs],
      [],                                       info-value[#supervisor-hs-email],
      [],                                       info-value[#supervisor-hs-phone],
      info-label[Unternehmensbetreuer:],        info-value[#supervisor-company],
      [],                                       info-value[#supervisor-company-email],
      [],                                       info-value[#supervisor-company-phone],
      info-label[Bearbeitungszeitraum:],        info-value[XX.XX.20XX-XX.XX.20XX],
    ),
  )
])

#v(2em)

#pagebreak(weak: true)
