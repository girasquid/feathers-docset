all: docset
	tar --exclude '.DS_Store' -czvf docset.tgz feathers.docset/
	open feathers.docset/

docset: feathersui.com
	./dashing build -f dashing.json -s feathersui.com/api-reference feathers | tee output.log

feathersui.com:
	wget --accept-regex api-reference -r http://feathersui.com/api-reference/
	# Clean up the files we don't want dashing parsing
	rm feathersui.com/api-reference/all-*
	rm feathersui.com/api-reference/index.html?*

clean:
	rm -rf feathers.docset feathersui.com output.log
