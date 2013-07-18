LDOC=../../LDoc
MOAI=moai-dev/cmake/moai/moai

test: travis-test-moai

localtest:
	busted -l moai spec/

doc:
	cd doc && lua $(LDOC)/ldoc.lua . && cd ..
	cp doc/index_template.html doc/out/index.html
	cp -R doc/img doc/out/

helloworld:
	moai examples/helloworld.lua

build-moai:
	sudo apt-get install freeglut3 libxmu-dev libxi-dev cmake build-essential zlib1g-dev
	git clone --depth=1 git://github.com/moai/moai-dev.git
	cd moai-dev/cmake && cmake . && make
.PHONY: build-moai

install-busted:
	sudo apt-get install luajit
	sudo apt-get install luarocks
	sudo luarocks install busted
.PHONY: install-busted

travis-test-moai: build-moai install-busted
	busted -l $(MOAI) spec

.PHONY: doc

