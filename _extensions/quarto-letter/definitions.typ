// Farben definieren
#let HSNRblue1 = rgb("185191")
#let HSNRblue2 = rgb("07A1E2")

// Tabellenköpfe blau
#show table.cell.where(y: 0): it => {
  rect(
    width: 99.19%,    // Ausdehnung
    fill: HSNRblue2,  // Hintergrundfarbe
    inset: 1pt,       // für Innenabstand
    radius: 1pt,      // abgerundete Ecken
    text(fill: white, // Text weiß
         size: 1.1em, // Schrift etwas größer
         it)
  )
}
//------------------------------------------


#let callout(body: [], title: "Callout", background_color: rgb("#dddddd"), icon: none, icon_color: black, body_background_color: white) = {
  block(
    breakable: false,
    fill: background_color,
    stroke: (paint: icon_color, thickness: 0.5pt, cap: "round"),
    width: 100%,
    radius: 2pt,
    block(
      inset: 1pt,
      width: 100%,
      below: 0pt,
      block(
        fill: background_color,
        width: 100%,
        inset: 8pt)[#text(icon_color, weight: 900)[#icon] #title]) +
      if(body != []){
        block(
          inset: 1pt,
          width: 100%,
          block(fill: body_background_color, width: 100%, inset: 8pt, body))
      }
    )
}
