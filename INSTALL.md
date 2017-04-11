# Install ghosty-git

## 0. dependencies
sudo apt-get install docker.io encfs
## 1. Create dropbox account
create a dropbox account in www.dropbox.com

## 2. Build docker image
run 
$ ./dropbox-build-docker.sh

## 3. Install and activate instance
run install command
$ ./dropbox-install.sh reponame

open activation link

kill dropbox ^C after activation

enter encfs password (or follow encfs installation)

in order to run instance:
$ ./dropbox-start.sh reponame

and enter encfs password

### 3.1  for home and work depots
$ ./depot-dropbox-setup.sh
activate, kill and encfs password for both repositories

## 4. Boot at startup

### 4.1 graphical ubuntu start up applications (need password)

### 4.2 automatic (password in a file)

### 4.3 automatic for depots (password in a file)

* run: $ sudo ./install-depot.sh (and enter encfs passwords)

* create password files in /etc/homedepot.pass and /etc/workdepot.pass
* # chmod 600 /etc/*depot.pass 
* # cp depot-start.sh  /usr/bin/depot-start
* # cp ghosty-start.sh /usr/bin/ghosty-start
* add in /etc/rc.local this ligne: usr/bin/depot-start;

## 5. Crontab

* $ sudo crontab -e
add this line
*/15 * * * * /usr/bin/depot-start
