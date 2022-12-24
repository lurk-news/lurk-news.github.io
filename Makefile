markdowns := $(shell find *.md blog/*.md)
htmls := $(patsubst %.md, %.html, $(markdowns))

all: blog
clean:
	rm blog/*.html
	rm *.html

generate_html: $(htmls)

blog/%.html: blog/%.md
	cat templates/template-blog.html | CONTENT="$(shell markdown $<)" envsubst > $@

%.html: %.md
	cat templates/template.html | CONTENT="$(shell markdown $<)" envsubst > $@

blog: generate_html
	cat templates/template.html | CONTENT="$(shell cat blog/*.html)" envsubst > blog.html
