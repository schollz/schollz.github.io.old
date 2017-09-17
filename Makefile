build:
	hugo server --watch -t hugo-bestwebsite -b http://localhost:1313

publish:
	git commit -am "Update"
	git push origin source
	hugo -t hugo-bestwebsite
	git checkout source 
	find . | grep -v ".git\|tmp" | xargs rm -rf
	

serve:
	hugo server --disableLiveReload --bind 0.0.0.0 -t hugo-bestwebsite -b http://blog.schollz.com --appendPort=false

