(lang dune 3.10)

(name fractals2d)

(generate_opam_files true)

(source
 (github username/reponame))

(authors "isaiah perumalla")

(maintainers "Maintainer Name")

(license LICENSE)

(documentation https://url/to/documentation)

(package
 (allow_empty)
 (name fractals2d)
 (synopsis "example of using Vg 2d graphics lib to generate fractal on web")
 (description "A longer description")
 (depends ocaml dune brr gg vg)
 (tags
  (topics "to describe" your project)))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/dune-files.html#dune-project
