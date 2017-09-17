build:
	hugo server -D --watch -t hugo-bestwebsite -b http://localhost:1313

publish:
	git status -s
	hugo -t hugo-bestwebsite
	git checkout master 
	rsync -avrP tmp/ ./
	rm -rf tmp
	git add .
	git commit -am "Update site"
	git push origin master
	git checkout source

	

serve:
	hugo server --disableLiveReload --bind 0.0.0.0 -t hugo-bestwebsite -b http://blog.schollz.com --appendPort=false

