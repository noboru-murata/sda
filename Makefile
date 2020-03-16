all: html

html:
	hugo

sync:
	rsync --delete -auv public/ ~/Sites/sda/

clean:
	rm -f content/*~

