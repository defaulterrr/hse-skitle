install-tex-mac:
	brew install basictex
	brew install pandoc

render-design:
	cd docs/design && \
		pandoc --from=markdown --output=design.pdf design.md
