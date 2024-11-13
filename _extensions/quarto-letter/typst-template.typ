// Logo-Pfad escapen
#let logo_path = "$logo$"
#let logo_path = logo_path.replace("\\", "")

#let signature = "$signature$"
#let signature = signature.replace("\\", "")

// Schriftart und Sprache
#set text(font: "Times New Roman", 
          size: 11pt,
          lang: "$lang$",)

#set par(justify: true)

// Los gehts
#let quarto-letter(
  // Hauptinhalt des Dokuments
  body
) = {
  // Farben definieren
  let HSNRblue1 = rgb("185191")
  let HSNRblue2 = rgb("07A1E2")
  
  // blaue Überschriften
  
  show heading.where(level: 1): it => block(
    // hellblau bei stufe 2
    text(HSNRblue1)[#it.body 
                    #v(5mm)]
  )  
  
  show heading.where(level: 2): it => block(
    // hellblau bei stufe 2
    text(HSNRblue2)[#it.body
                    #v(2mm)]
  )  
  
  show heading.where(level: 3): it => block(
    // hellblau bei stufe 2
    text(HSNRblue2)[#it.body
                    #v(2mm)]
  )
  

  // Seitengröße und -ränder festlegen
  set page(width: 210mm, 
           height: 297mm,  
           margin: (top: 35mm, bottom: 30mm, left: 20mm, right: 20mm),
           numbering: "1",
           number-align: center,
           header: align(center)[#image(logo_path, width: 90mm)],
           header-ascent: -0mm,
           footer: align(right)[#text(8pt)[Seite #context counter(page).display("1 von 1",both: true,)]]
  )

  v(15mm) //insgesamt 40mm Abstand vom Rand
  
  // Adressfelder
  //-------------
  grid(columns: (1fr, 1fr),
       align: (left, right),
       
       // Empfängerin
       //------------
       box()[#underline()[#text(7pt)[$sender.firstname$ $sender.lastname$ | $sender.street$ | $sender.plz$ $sender.city$]]
             #v(-1mm)
             #h(5mm)
             #box()[ 
                    #text(11pt)[$for(address)$$address$$sep$ #v(-2mm) $endfor$]  
                   ]
            
            ], 

       // sender
       //---------
       box()[#align(right)[
                           #text(11pt, weight: "extrabold")[$sender.graduate$ $sender.firstname$ $sender.lastname$]
                           #v(-3mm)
                           #text(8pt, weight: "bold")[$sender.firstline$]
                           #v(1mm)
                           #text(8pt)[$sender.street$]
                           #v(-4mm)
                           #text(8pt)[$sender.plz$] #text(8pt)[$sender.city$]
                           #v(-1mm)
                           #text(8pt)[Telefon: $sender.telefon$] 
                           #v(-2mm)
                           #text(8pt)[$sender.email$] 
                           #v(-3mm)
                           #text(8pt)[$sender.www$] 
                           #linebreak()
                           $if(filenumber)$
                           #text(8pt)[Aktenzeichen: $filenumber$]
                           #v(-3mm)
                           $endif$
                           #text(8pt)[Datum: $date$]
                           ]
            ]
       )
  //----------------------
  //---- Ende Adressfelder


  // Abstand 
  v(15mm)
  
  // Betreff
  text(12pt, weight: "bold")[Betreff: $subject$]
  
  v(5mm)
  
  text()[$opening$]
  
  // Abstand 
  v(5mm)

  // Hauptteil des Dokuments
  body

  // Abstand 
  v(5mm)

  text()[$closing$]
  
  $if(signature)$
  image(signature, width: 4cm)
  v(-6mm)
  $endif$
  text()[$sender.graduate$ $sender.firstname$ $sender.lastname$]
  
  v(5mm)
  
  $if(attachment)$
  text(11pt)[Anlage(n):
      $for(attachment)$
       - $attachment$
      $endfor$
    ]
  $endif$
}