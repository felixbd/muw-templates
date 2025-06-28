/**
 * This is a beamer template for the Medical University of Vienna
 *
 * see: https://www.meduniwien.ac.at/web/studierende/service-center/meduni-wien-vorlagen/
 */


// Get Polylux from the official package repository
#import "@preview/polylux:0.4.0" as polylux

#import "colors.typ" as muw_colors

#let muw-logo-white(..args) = image("./../img/MedUni-Wien-white.svg", ..args)
#let muw-logo-blue(..args) = image("./../img/MedUni-Wien.svg", ..args)
#let muw_logos = (muw-logo-blue, muw-logo-white)

#let muw-box(radius: 15%, ..args) = box(radius: (top-left: radius, bottom-right: radius), clip: true, ..args)


#let custom-footer(
  logos: muw_logos,
  footer-title: [Titel der Präsentation ODER des Vortragenden],
  orga: [Organisationseinhait]
) = {
  let logos = if logos != none {logos} else {muw_logos}

  context {
    set text(fill: if page.fill != muw_colors.dunkelblau { white } else { muw_colors.dunkelblau })

    let current-margin = if page.margin == auto {
      (2.5 / 21) * calc.min(page.height, page.width)       
    } else {
      // TODO: scheint bisschen komplexer zu sein...
      0mm  // page.margin.left  .left .right .x .y oder so ...
    }

    // if paper is 16-9 its perfect
    place(bottom, dx: -current-margin)[
      #box(
        fill: if page.fill == muw_colors.dunkelblau { white } else { muw_colors.dunkelblau },
        height: 100% + 3mm,
        width: 100% + 2 * current-margin
      )[
  
        #set align(center + horizon) 
        
        #stack(dir: ltr, spacing: 1fr,
          [
            #box(inset: (x: 3mm))[
              #if page.fill != muw_colors.dunkelblau {
                logos.last()(height: 15mm)
              } else {
                logos.first()(height: 15mm)
              }
            ]
          ],
          [
            #{
              set align(left)
              stack(dir: ttb, spacing: 3mm,
                text(size: 10pt, footer-title),
                text(size: 12pt, weight: "semibold", orga)
              )
            }
          ],
          [ 
            #if here().page() > 1 {
              set text(size: 15pt)
              set align(right)
              box(inset: (x: 4mm))[
              #stack(
                dir: ttb, spacing: 3mm,
                datetime.today().display("[day]. [month repr:long] [year]")
                //time.display("h:[hour repr:12][period]")
                , [
                  #counter(page).at(here()).first() / #counter(page).final().first()
                  // #calc.round( eval( str(counter(page).at(here()).first()) +
                // "/" +  str(counter(page).final().first()) + "* 100" ) , digits: 2)%   
                
                ]
              ) 
            ]
                
                          
            }
          ],
        )    
      ]
    ]
  }
}


#let slide(..args) = {
  polylux.slide(..args)
}

#let color-slide(
  bg-fill: muw_colors.coral,
  font-fill: black,
  ..args
) = {
  set page(fill: bg-fill)
  set text(fill: font-fill)
  
  polylux.slide(..args)
}

#let black-slide(
  bg-fill: black,
  font-fill: white,
  ..args
) = {
  set page(fill: bg-fill)
  set text(fill: font-fill)
  
  polylux.slide(..args)
}

#let blue-slide(
  bg-fill: muw_colors.dunkelblau,
  ..args
) = {
  set page(fill: bg-fill)
  set text(fill: white)
 
  polylux.slide(..args)
}


// --- template -------------------------------------------------------------------

#let slides(
  title: [Titel],
  series: [series],
  author: [Univ. Prof. Dr. Maximilian Mustermann],
  klinik: [Universitätsklinik für XY],
  footer-title: [Titel der Präsentation ODER des Vortragenden],
  orga: [Organisationseinhait],
  paper: "presentation-16-9",
  toc: false,
  logos: none,
  //(  // logo in both dunkelblau and white (for normal footer and titlepage ...)
  //  image("images/MedUni-Wien.svg"),
  //  image("images/MedUni-Wien-white.svg")
  //),


  // TODO ...
  page-numbering: (n, total) => {
        text(size: 0.75em, strong[#n.first()])
        text(size: 0.5em, [ \/ #total.first()])
    },

    
  body
) = {
  set page(
    paper: paper,
    footer: custom-footer(
      logos: logos,
      footer-title: footer-title,
      orga: orga
    )

    
    // margin: (left: 5mm),  // TODO fix footer for custom (non auto/default) margins
    // numbering: "1/1"
  )

  // TODO:
  //  Primärschrift: Danton
  //  Systemschrift: Georgia
  //  Sekundärschrift: Akkurat Pro
  //  Systemschrift: Lucida Sans
  
  set text(size: 25pt, font: "Lora")  // "Lato"
  show math.equation: set text(font: ("STIX Two Math", "New Computer Modern Math"), size: 25pt)
  
  blue-slide[
    #[
      #set align(horizon)
      
      = #title
      
      #author \
      #klinik
    ]
  ]

  if toc == true{
    slide()[
      #outline()
    ]
  }
  
  body
}
