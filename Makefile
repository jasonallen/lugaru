LDOC=../LDoc

test:
	busted -l moai spec/

doc:
	lua $(LDOC)/ldoc.lua -p Lugaru -f markdown src

helloworld:
	moai examples/helloworld.lua

.PHONY: doc

