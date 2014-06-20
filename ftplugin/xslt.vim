" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif

" On to loading xml.vim
runtime ftplugin/xml.vim
