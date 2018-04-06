# How to Render the Documentation as PDF

## Install Required Software

For the PDF-generation to work, you need to have `svgexport` and `ebook-convert`
installed. To install them:

- Be on OS X.
- Make sure you have node installed.
- run `./pdf_generation_preparation_osx.sh`

you might need to enter your root-password

## Generate the PDF

To generate the PDF, run `npm run generate_pdf`. This will take a while (about 3
to 4 minutes), and will create a `documentation.pdf`
