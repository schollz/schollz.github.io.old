build:
	hugo server -D --watch -t portcullis -b http://localhost:1313 --bind 0.0.0.0 --enableGitInfo 

publish:
	#go get -v github.com/tdewolff/minify/cmd/minify
	git status -s
	hugo -t portcullis
	minify -a -r -o tmp/ tmp
	git checkout master 
	git pull origin master
	rsync -avrP tmp/ ./
	rm -rf tmp
	git add .
	git commit -am "Update site"
	git push origin master
	git checkout source

update:
	git add content/post/
	git commit -am "Update posts"
	git push origin source
	

serve:
	hugo server --disableLiveReload --bind 0.0.0.0 -t portcullis -b http://blog.schollz.com --appendPort=false

