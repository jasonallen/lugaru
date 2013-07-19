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
	sudo apt-get install aptitude
	sudo aptitude install freeglut3-dev libglew-dev libglu1-mesa-dev libxmu-dev libxi-dev chipmunk-dev libjpeg8-dev libpng-dev libfreetype6-dev liblua5.1-0-dev libjansson-dev libtinyxml-dev libcurl4-openssl-dev zlib1g-dev libexpat1-dev cmake build-essential libasound2-dev libvorbis-dev libpulse-dev libasound2-dev
	git clone --depth=1 https://github.com/spacepluk/moai-dev.git
	cd moai-dev/cmake && cmake . && make
.PHONY: build-moai

build-moai-backup:
	sudo apt-get install freeglut3 libxmu-dev libxi-dev cmake build-essential zlib1g-dev

install-busted:
	sudo apt-get install luajit
	sudo apt-get install luarocks
	sudo luarocks install busted
.PHONY: install-busted

travis-test-moai: build-moai install-busted
	busted -l $(MOAI) spec

.PHONY: doc

