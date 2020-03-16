all: html

html:
	hugo

push:
	git push -u origin master

clean:
	rm -f content/*~

