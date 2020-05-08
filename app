#!/usr/bin/python3
# -*- coding: utf-8 -*-

import os, sys
import pstr
from click import get_terminal_size as gts

y, x = gts()
info = pstr.info
pss = pstr.pcolor().Pss
cmd = os.system
arg = sys.argv

def InstallApDn():
    if y < 90 and x < 15:
        print('Please Beg the terminal size for cuntune')
        sys.exit(1)

    # print(len(arg[0:-1]))
    app = {
        'a' : 'apt',
        'g' : 'apt-get',
        't' : 'aptitude',
        'd' : 'dnf',
        'y' : 'yum',
        'z' : 'zypper',
        's' : 'snap',
        'n' : 'npm',
	'p' : 'pip3'}
    Dic = {
        "i" : "install",
        "r" : "remove",
        "s" : "search",
        "l" : "list",
        'f' : "info",
        'h' : "help",
        'ic': "install --classic",
        'im': "install --fix-massing",
        'g' : "upgrade",
        'u' : "update",
	'iu': "install --user"
        }
    if len(arg[0:-1]) < 1:
        pstr.bad('please insert argumant or option ... !')

    elif arg[1] in ('help', 'h', 'H', '-help', '--help'):
        print(info("Usage: app [application] [command] [argumant]\n"))
        print(info("Commands:", massing='', color='g'))
        for i, s in Dic.items():print(pss(f"<!bu>\t{i},   <!y>{s}"))
        print("\n", info("Applications:", massing='', color='g'))
        for a, b in app.items():print(pss(f"\t<!bu>{a},   <!y>{b}"))
    else:
        try:
            opt = Dic[arg[2]]
            App = app[arg[1]]
            TEXT = pss(f"""
        <!r>[*] <!y>Script name: <!c>{arg[0]}
        <!r>[*] <!y>App Name : <!c>{App}
        <!r>[*] <!y>Command Name : <!c>{opt}<!e>
        <!r>[*] <!y>Write the Passowrd \n<!g>
            """)
            print(TEXT)
            print(pss("<!bu>-<!e>"*50))
            for i in arg[3:]:
                print(pss(f"<!r> [+] <!y>Package name: <!c>{i} <!e>\n"))
                cmd(f"sudo {App} {opt} {i}")
                print(pss("<!bu>-<!e>"*50))
        except:
            print(pstr.err('This Command not found ...!'))
if __name__ == "__main__":
    InstallApDn()
