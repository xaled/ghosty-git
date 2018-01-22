#!/usr/bin/python
import subprocess
import time


def _execute_command(cmd_vector):
    p = subprocess.Popen(cmd_vector, stdout=subprocess.PIPE)
    return p.communicate()[0]


def start_depots():
   _execute_command(["/usr/bin/depot-start"])


def stop_depots():
   _execute_command(["/usr/bin/depot-stop"])


def is_finished():
   ret = _execute_command(["/usr/bin/depot-status"])
   print ret
   count = 0
   for s in ret.split('\n'):
      if 'Up to date' in s or 'Could not get Sync status' in s:
         count+=1
   return count == 2


start_depots()
time.sleep(10)

while not is_finished():
   time.sleep(30)
stop_depots()

