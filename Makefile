build:
	hugo server -D --watch -t hugo-bestwebsite -b http://0.0.0.0:1313 --bind 0.0.0.0

publish:
	#go get -v github.com/tdewolff/minify/cmd/minify
	git status -s
	hugo -t hugo-bestwebsite
	minify -a -r -o tmp/ tmp
	git checkout master 
	git pull origin master
	rsync -avrP tmp/ ./
	rm -rf tmp
	git add .
	git commit -am "Update site"
	git push origin master
	git checkout source

	

serve:
	hugo server --disableLiveReload --bind 0.0.0.0 -t hugo-bestwebsite -b http://blog.schollz.com --appendPort=false

