update:
	mkdir /tmp/vim.\$$; \
	cd /tmp/vim.\$$; \
	wget -O - http://botje.rootspirit.com/vim.tar.bz2 | tar xjf -; \
	rsync --delete -avz .vim/ ~/.vim; \
	cd ..; \
	rm -rf vim.\$$

put: 
	cd ~; \
		tar cjf /tmp/vim.tar.bz2 .vim; \
		scp /tmp/vim.tar.bz2 zero:web; \
		rm /tmp/vim.tar.bz2

all: update

.PHONY: update put
