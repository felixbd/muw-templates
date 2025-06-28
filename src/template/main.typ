#import "./../presentation.typ" as muw_presentation
#import muw_presentation: *

// for cool task, hint and other blocks



#set text(lang: "de")

#polylux.enable-handout-mode(false)


#let muw-logo-white(..args) = muw-box(fill: gray, figure(image("./../../img/MedUni-Wien-white.svg", ..args)))
#let muw-logo-blue(..args) = muw-box(fill: gray, figure(image("./../../img/MedUni-Wien.svg", ..args)))
#let custom-muw-logos = (muw-logo-white, muw-logo-blue)


#show: slides.with(
    title: [Titel mit blauem Hintergrund],
    series: [],
    author: [Univ. Prof. Dr. Maximilian Mustermann],
    klinik: [Universitätsklinik für XY],

    // if you want to use custom logs for your institute
    // for example for the Comprehensive Center for AI in Medicine (CAIM)
    logos: none, // custom-muw-logos, 
    

    // OPTIONAL:
    
    // paper: "presentation-16-9",  // 16-9 v. 4-3
    // toc: true,
    
    /* no: 1,
    series: [Logik-Tutorium],
    title: [Organisatorisches und Einführung in die Logik],

    box-task-title: [Aufgabe],
    box-hint-title: [Hinweis],
    box-solution-title: [Lösung],
    box-definition-title: [Definition],
    box-notice-title: [Achtung!],
    box-example-title: [Beispiel],

    outline-title-text: "Ablauf",
    // show-todolist: false,

    author: "Tristan Pieper",
    email: link("mailto:tristan.pieper@uni-rostock.de"),
    */
    
)





// Use #slide to create a slide and style it using your favourite Typst functions
#slide[
  #set align(horizon)
  = Very minimalist slides m

  A lazy author

  #muw-logo-white(height: 25mm)

  July 23, 2023
]




#slide[
  == First slide

  Some static text on this slide.
]




#slide[
  == This slide changes!

  You can always see this.
  // Make use of features like #uncover, #only, and others to create dynamic content
  #polylux.uncover(2)[But this appears later!]
  
  #muw-box(fill: gray,
      width: 6cm, height: 6cm,
      figure(
        box(fill: gray, width: 100%, "Hello")
      )
  )
  
]


#black-slide[

  this is a black slide for all you radiologists ...

  if you are even more fancy, use `color-slide` for either a `coral`, `green` or any other colord background

  use:
  
  ```typst
  #color-slide(
    bg-fill: muw_colors.coral, 
    font-fill: black  // default
  )[
    some content ...
  ]
  ```
]

#color-slide[
    #show: align.with(center + horizon)
    
    
    // #heading(outlined: false)[Nun eine kurze Demonstration]

    #text(size: 120pt, weight: "bold")[Nun eine kurze Demo]
]

#color-slide(bg-fill: muw_colors.gruen)[
  hier in grün ...
]




#slide[
  #set align(horizon)
  = My fabulous talk

  Jane Doe

  Conference on Advances in Slide Making
]

#slide[
  Hello, world!
]



#slide[
  == Some random text ...

  #polylux.toolbox.side-by-side[
    #lorem(7)
  ][
    #lorem(10)
  ][
    #lorem(5)
  ]

  #polylux.toolbox.side-by-side(gutter: 3mm, columns: (1fr, 2fr, 1fr))[
    #rect(width: 100%, stroke: none, fill: aqua)
  ][
    #rect(width: 100%, stroke: none, fill: teal)
  ][
    #rect(width: 100%, stroke: none, fill: eastern)
  ]


]


#color-slide[
  === progress bar

  #let my-progress = {
    [#polylux.toolbox.slide-number / #polylux.toolbox.last-slide-number]
  
    polylux.toolbox.progress-ratio(ratio => {
      stack(
        dir: ltr,
        rect(stroke: blue, fill: blue, width: ratio       * 8cm),
        rect(stroke: blue, fill: none, width: (1 - ratio) * 8cm),
      )
    })
  }
  
  #set align(horizon)
  
  #for _ in range(6) {
    color-slide[
      #my-progress
    ]
  }

]



// kleiner einschub von euler und seiner tollen identität (tau is besser als pi!!)


// for the meme ...
#import "@preview/gru:0.1.0": gru


#[
  
#set text(size: 20pt)
  
#show: gru.with(last-content: [$ \ \ forall phi in ZZ: \ "e"^(i phi tau ) = 1 $ ])

$  "e"^(i pi) = -1 \ \ tau := 2 pi \ \ "e"^(i tau) = 1 $

$ \ \ forall psi in 2ZZ: \ "e"^(i psi pi ) = 1 $

]

#slide[
  hello there ...
]




/*

#slide[
  hello oder so @some-paper
]

#slide[
  #bibliography("some-file-name.bib")
]

*/