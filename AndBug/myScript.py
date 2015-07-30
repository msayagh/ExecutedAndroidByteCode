#!/usr/bin/env python
# This connects to the openbsd ftp site and
# downloads the recursive directory listing.
#import pexpect
#import sys

#child = pexpect.spawn('./andbug shell -p 1464')

#file = open('breakCommands.txt', 'r')

#for line in file:
#    print line
#   child.sendline(line)

#child.interact()

#child.sendline('classes')
#child.sendline('classes')
#child.interact()

import subprocess



#break com.example.test.MainActivity onCreateOptionsMenu 21
#break com.example.test.MainActivity onCreateOptionsMenu 22

p = subprocess.Popen("./andbug shell -p 1703",stdin=subprocess.PIPE,stdout=subprocess.PIPE,stderr=subprocess.PIPE, shell= True)

p.stdin.write("abc\n")
print "Reading result:"
print p.stdout.readline()

#stdoutdata,stderrdata=p.communicate('break com.example.test.MainActivity onCreateOptionsMenu 21')

#print stdoutdata


