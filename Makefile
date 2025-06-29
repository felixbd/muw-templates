TOML := typst.toml
NAME := $(shell grep -E '^\s*name\s*=' $(TOML) | sed 's/.*=\s*"\(.*\)"/\1/')
VERSION := $(shell grep -E '^\s*version\s*=' $(TOML) | sed 's/.*=\s*"\(.*\)"/\1/')
RELEASE_DIR := $(VERSION)

# Extract user-defined exclusions from typst.toml
EXCLUDE_TOML := $(shell awk '/^\s*exclude\s*=/,/^\s*\]/' $(TOML) \
	| grep -oE '"[^"]+"' \
	| sed 's/"//g' \
	| sed 's/^/--exclude=/' \
	| tr '\n' ' ')

# Additional exclusions: all dotfiles and dotdirs
EXCLUDE_DOTFILES := --exclude='.*' --exclude='.*/'

# Combine all exclusions
EXCLUDES := $(EXCLUDE_TOML) $(EXCLUDE_DOTFILES) --exclude=$(TOML) --exclude=$(RELEASE_DIR)

.PHONY: all release clean

all: release

r: release

release: t
	@echo -e "Packaging version $(VERSION)...\n\nTOML: $(TOML)\nNAME: $(NAME)\nVERSION: $(VERSION)\n"
	rm -rf $(RELEASE_DIR)
	mkdir -p $(RELEASE_DIR)
	rsync -av --progress ./ $(RELEASE_DIR)/ $(EXCLUDES)
	@echo -e "\nRelease ready in $(RELEASE_DIR)!"


t: thumbnail

thumbnail:
	typst compile --root=. -f png --pages 1 --ppi 250 ./src/template/main.typ ./thumbnail.png


clean:
	rm -rf ?.?.?/
	@echo "Cleaned all release directories."


w: watch

watch:
	typst watch --root=. ./src/template/main.typ ./main.pdf

c: compile

compile:
	typst compile --root=. ./src/template/main.typ ./main.pdf

o: open

open:
	# xdg-open ./main.pdf
	firefox ./main.pdf
