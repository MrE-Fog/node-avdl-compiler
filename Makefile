
ICED=./node_modules/.bin/iced

default: build-stamp

lib/%.js: src/%.iced
	$(ICED) -I node -c -o `dirname $@` $<

build-stamp: \
	lib/main.js \
	lib/emit.js
	date > $@

install:
	npm install
	go get -v ./...

test: build-stamp
	cd test && ../$(ICED) ./run.iced && cd files/ && go test

.PHONY: test
