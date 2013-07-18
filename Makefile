LDOC=../../LDoc

test:
	busted -l moai spec/

doc:
	cd doc && lua $(LDOC)/ldoc.lua . && cd ..
	cp doc/index_template.html doc/out/index.html
	cp -R doc/img doc/out/

helloworld:
	moai examples/helloworld.lua

.PHONY: doc

