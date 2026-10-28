#import "lib/common.typ": is-page-empty

#let title = "Einsatz eines Flux-Kompensators für Zeitreisen mit einer maximalen Höchstgeschwindigkeit von WARP 7"
#let authors = (
  "Max Mustermann",
) // Note: The array of length one needs a trailing comma, as in (1,).
#let matriculation-numbers = (
  "1234567",
)
#let date = datetime.today()

#let kind = "PA2" // "Bachelor", "Master", "PA1", "PA2"

#let logo-left = image("assets/DHBW-Logo.png")
#let logo-right = image("assets/sv_informatik-logo.png")

#let university = "DHBW Mannheim"
#let program-director = "Prof. Dr. Anna Beispiel"
#let field-of-study = "Wirtschaftsinformatik | Software Engineering"
#let course-name = "XXX24XXX"

#let company = "SV Informatik GmbH"
#let company-department = "Softwareentwicklung - Abteilung Testing und Typst"

#let scientific-advisor = "Prof. Peter Mustermann"
#let scientific-advisor-email = "peter.mustermann@dhbw.de"
#let scientific-advisor-phone = "+49 621 12341234"

#let company-supervisor = "Erika Mustermann"
#let company-supervisor-mail = "erika.mustermann@sv-informatik.de"
#let company-supervisor-phone = "+49 621 56785678"

#let heading-font = "New Computer Modern" // "New Computer Modern" for LaTeX look, "Latin Modern Sans" or like HSMA: "Arial"
#let body-font = "New Computer Modern" // "libertinus serif"

#let timeframe = "12 Wochen"
#let submission-date = "xx.xx.20xx"

#let body-text-size = 11pt
#let numbering-alignment = center

// Workaround for "Using sub-files imported into main file, while citing a single bibliography."
// https://www.reddit.com/r/typst/comments/12pdmzc/using_subfiles_imported_into_main_file_while/?rdt=58657
#let bib_state = state("bib_state", bibliography("literature.bib", title: none))

//
// Template
//

#let template = body => {
  set document(title: title, author: authors.join(", "), date: date)

  set page(
    margin: (
      top: 3.8cm,
      bottom: 4.5cm,
      x: 3cm,
    ),
    number-align: numbering-alignment,
    // https://github.com/typst/templates/blob/main/wonderous-book/lib.typ#L91
    header: context {
      // Is this an empty page inserted to keep page parity?
      if is-page-empty() {
        return
      }

      // Are we on a page that starts a chapter?
      let i = here().page()
      if query(heading.where(level: 1)).any(it => it.location().page() == i) {
        return
      }

      let headings = query(selector(heading.where(level: 1)).before(here()))

      if headings.len() == 0 {
        return
      }

      let heading-last = headings.last()
      let heading-counter = counter(heading).get()
      let header-txt = str("")

      if heading-last.numbering != none {
        header-txt += [#heading-last.supplement #numbering(heading-last.numbering, heading-counter.first()) -- ]
      }
      header-txt += heading-last.body

      set align(center)
      stack(
        dir: ttb,
        header-txt,
        v(0.8em),
        line(length: 100%, stroke: 0.75pt),
      )
    },
  )

  show heading: set text(weight: "semibold", font: heading-font)
  show heading.where(level: 1): set text(size: 1.4em)
  show heading.where(level: 2): set text(size: 1.2em)
  show heading.where(level: 3): set text(size: 1.1em)
  show heading.where(level: 4): set text(size: 1.1em)
  set text(font: body-font, lang: "de", body-text-size, region: "DE")

  // Zeilenabstand
  set enum(spacing: 1.2em)
  set par(justify: true, leading: 1.2em, spacing: 1.2em)
  show raw.where(block: true): set par(
    justify: false,
    leading: 1.25em,
    spacing: 1.25em,
  )

  // Inline-Code mit hellgrauem Hintergrund
  show raw.where(block: false): it => box(
    fill: luma(240),
    inset: (x: 3pt, y: 0pt),
    outset: (y: 3pt),
    radius: 2pt,
    it,
  )

  set figure.caption(separator: [ -- ], position: bottom)
  show figure: set block(breakable: true, above: 1.75em, below: 1.75em)

  show heading.where(level: 1): it => {
    it + v(1em)
  }
  show heading.where(level: 2): it => v(0.65em) + it + v(0.65em)
  show heading.where(level: 3): it => v(0.65em) + it + v(0.65em)
  show heading.where(level: 4): it => v(0.65em) + it + v(0.65em)

  show figure.where(kind: raw): set figure(supplement: [Quellcode])

  body
}
