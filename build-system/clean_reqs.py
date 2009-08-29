#!/usr/bin/python

"""
Input: some buildRequires
Output: difference of these buildRequires again those in gnomepackage

Some packages have duplicate buildRequires with gnomepackage. Removing them
would be cleaner.

Example:
    python clean-reqs.py gtk:devel
    python clean-reqs.py "gtk:devel"
    python clean-reqs.py ["gtk:devel"]
    python clean-reqs.py [ "gtk:devel", "glib:devel" ]
    python clean-reqs.py '["gtk:devel",
        "glib:devel"]'
It is very permissive as to the format.
"""

import re
import sys

def main():
    base_buildreqs = set([
        'automake:runtime', 'dbus-glib:devel', 'dbus-glib:devellib',
        'dbus:devel', 'docbook-dtds:data', 'expat:devel', 'file:runtime',
        'gcc-c++:runtime', 'gettext:devel', 'gettext:runtime', 'git:runtime',
        'glib:devel', 'glib:runtime', 'gnome-common:devel',
        'gnome-common:runtime', 'gnome-doc-utils:devel',
        'gnome-doc-utils:runtime', 'gtk-doc:devel', 'gtk-doc:runtime',
        'gtk:devel', 'intltool:runtime', 'libICE:devel', 'libSM:devel',
        'libX11:devel', 'libXau:devel', 'libXdmcp:devel', 'libXext:devel',
        'libXi:devel', 'libXinerama:devellib', 'libXrender:devel',
        'libXt:devel', 'libdmx:devel', 'libtool:devel', 'libtool:runtime',
        'libxslt:runtime', 'pkgconfig:devel', 'subversion:runtime',
        'which:runtime', 'zlib:devel'])

    # merge the list into a single string
    input = " ".join(sys.argv[1:])
    # delete all the punctuations
    input = re.sub('''[\[\],'"\n]''', " ", input)
    # strip leading/trailing spaces
    # merge sequential spaces into one
    input = " ".join(input.strip().split())
    # make it into a set
    input_buildreqs = set(input.split(" "))

    res = list(input_buildreqs.difference(base_buildreqs))
    res.sort()
    print
    print res

if __name__ == "__main__":
    main()
