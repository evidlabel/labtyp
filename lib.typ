// State to track the current headings hierarchy
#let current-headings = state("current-headings", ())

// State for document title
#let document-title = state("document-title", none)

// State for document author
#let document-author = state("document-author", none)

// State for current date
#let current-date = state("current-date", none)

#let original-page = state("orig-page", none)

// Function to set document title
#let set-title(title) = {
  document-title.update(title)
}

// Function to set document author
#let set-author(author) = {
  document-author.update(author)
}

// Function to set current date
#let set-date(date) = {
  current-date.update(date)
}

#let set-page(page) = {
  original-page.update(page)
}


// Function to create a label with underlined text, footnote, and metadata
#let lab(key, text, note) = {
  context [
    #underline(stroke: blue)[#text]#footnote[#key: #note]#hide[
      #metadata((
        key: key,
        text: text,
        note: note,
        // the keys below here can be in a dict
        page: counter(page).at(here()).first(),
        // heading: current-headings.at(here()),
        original-page: original-page.at(here()), 
        title: document-title.at(here()),
        author: document-author.at(here()),
        date: current-date.at(here()),
      )) <lab>
    ]
  ]
}

// Function to list all labels in a table with hyperlinks
#let lablist() = {
  context {
    let labels = query(selector(<lab>))
    if labels.len() == 0 {
      [No labels found.]
    } else {
      table(
        columns: (auto, auto, auto, auto, auto, auto, auto, auto, auto),
        [*Key*], [*Text*], [*Note*], [*Page*], [*Original Page*], [*Title*], [*Author*], [*Date*],
        ..labels.map(l => {
          let data = l.value
          (
            link(l.location(), data.key),
            link(l.location(), data.text),
            link(l.location(), data.note),
            link(l.location(), str(data.page)),
            link(l.location(), if data.at("original-page") != none { str(data.at("original-page")) } else { [Undefined] }),
            // link(l.location(), if data.heading.len() > 0 { data.heading.join(" / ") } else { [No Heading] }),
            link(l.location(), if data.title != none { data.title } else { [Undefined] }),
            link(l.location(), if data.author != none { data.author } else { [Undefined] }),
            link(l.location(), if data.date != none { data.date } else { [Undefined] })
          )
        }).flatten()
      )
    }
  }
}
