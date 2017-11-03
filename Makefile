build:
	git submodule update --init --recursive
	hugo server -D --watch -t onetwothree -b http://localhost:1313 --bind 0.0.0.0 --enableGitInfo 

publish:
	#go get -v github.com/tdewolff/minify/cmd/minify
	git submodule update --init --recursive
	git status -s
	hugo -t onetwothree
	minify -a -r -o tmp/ tmp
	git checkout master 
	git pull origin master
	rsync -avrP tmp/ ./
	rm -rf tmp
	rm -rf themes
	rm -rf content
	rm -rf static
	rm -rf archetypes
	git add .
	git commit -am "Update site"
	git push origin master
	git checkout source

update:
	git add content/post/
	git commit -am "Update posts"
	git push origin source
	

serve:
	hugo server --disableLiveReload --bind 0.0.0.0 -t onetwothree -b http://blog.schollz.com --appendPort=false

