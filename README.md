# `labtyp`

A Typst package for creating labeled notes with underlined text, footnotes, and a hyperlinked table, supporting standard headings and document metadata (title, author, date).

## Installation

### Local Installation
1. Place the package in:
   - Linux/macOS: `~/.local/share/typst/packages/local/labtyp/0.1.0`
   - Windows: `%APPDATA%\typst\packages\local\labeled-notes\0.1.0`
2. Import in your document:
   ```typ
   #import "@local/labtyp:0.1.0": set-title, set-author, set-date, lab, lablist
   ```

## Test document
```typst
#import "@local/labeled-notes:0.1.0": set-title, set-author, set-date, lab, lablist

#set-title("My Document")
#set-author("John Doe")
#set-date("2025-07-31")

= Heading
== Subheading
This is some text.

#lab("key", "Highlighted text", "This is a note") // Creates underlined text and footnote

#set-date("2025-08-01") // Redefine date for subsequent labels
= Another Heading
#lab("key2", "More text", "Another note")

= List of Labels
#lablist() // Displays a table of all labels with hyperlinks
```