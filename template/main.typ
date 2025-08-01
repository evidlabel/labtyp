#import "../lib.typ": lablist, lab, set-title, set-author, set-date, set-page
// Set document metadata
#set-title("The title of the document")
#set-author("Jane Doe")
#set-date("2025-07-31")

= Introduction
== Subsection
#set-page(1)



This is an example document using the `labtyp` package.

#lab("sample_key", "Sample text", "This is a sample note")

// Redefine date for subsequent labels
#set-date("2025-08-01")
#set-page(2)

= Another Section

This is more content.
// #set-title("Sample Document two")


#lab("another_key", "Another text", "Another note")

= List of Labels
#lablist()

