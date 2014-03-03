.PHONY: build install

install:
	bower install
	npm install
	cd bower_components/zeptojs/ && npm install

update:
	bower update
	npm update

lock:
	npm shrinkwrap

build:
	cd bower_components/zeptojs/ && npm run-script dist
	grunt build

package:
	grunt package

release:
	grunt release
