build:
	hugo server --watch -t hugo-bestwebsite -b http://localhost:1313

publish:
	git commit -am "Update"
	git push origin source
	hugo -t hugo-bestwebsite
	git checkout master 
	find . | grep -v ".git\|tmp" | xargs rm -rf
	rsync -avrP tmp/ ./
	rm -rf tmp
	git add .
	git commit -am "Update site"
	git push origin master
	git checkout source

	

serve:
	hugo server --disableLiveReload --bind 0.0.0.0 -t hugo-bestwebsite -b http://blog.schollz.com --appendPort=false

