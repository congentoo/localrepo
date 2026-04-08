"""Dirty and hacky, I don't plan on distributiong this"""
import re
url=input()
rex='^https://upwork-usw2-desktopapp.upwork.com/binaries/(v(?:[0-9]+|_)+)_(?P<hash>[0-9a-z]+)/(?P<pn>upwork)-(?P<pv>(?:[0-9]|\.)+)-(?P<b>[0-9a-z]+).x86_64.rpm$'
d = re.match(rex, url).groupdict()
print(f"{d['pn']}-{d['pv']}_p{int(d['b'], base=16)}-r{int(d['hash'], base=16)}.ebuild")

