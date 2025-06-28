# TODO:
# - add font

watch:
	typst watch --root=. ./src/template/main.typ ./main.pdf

c: compile

compile:
	typst compile --root=. ./src/template/main.typ ./main.pdf

o: open

open:
	# xdg-open ./main.pdf
	firefox ./main.pdf


t: thumbnail
thumbnail:
	typst compile --root=. -f png --pages 1 --ppi 250 ./src/template/main.typ ./thumbnail.png
