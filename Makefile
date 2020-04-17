MSG = debug

all: html

html:
	hugo

push:
	git add -u
	git commit -m ${MSG}
	git push -u origin master

clean:
	rm -f content/*~

