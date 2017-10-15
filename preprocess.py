import glob
import os
import hashlib
import subprocess

os.chdir("content")
for f in glob.glob("**/post/*.md", recursive=True):
    print(f)
    d = open(f, 'r').read()
    content = d.split('---')[-1].strip() + "\n"
    print(content)
    with open("content", "w") as g:
        g.write(content)
    print(hashlib.md5(content.encode('utf-8')).hexdigest())
    header = ""
    for line in d.split('---')[1].split('\n'):
        print(line)
        if "slug:" in line:
            header += "slug: " + \
                hashlib.md5(content.encode('utf-8')).hexdigest() + "\n"
        else:
            header += line + "\n"
    print(header)
    with open(f, 'w') as g:
        g.write("---\n")
        g.write(header)
        g.write("---\n\n")
        g.write(content)
    break
