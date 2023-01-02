# Born2beroot

These are some commands that will be usefull during the evaluation of the born2beroot proyect.

## Machine signature

Get the machine signature in *sha1* format

```
shasum born2beroot.vdi
```

## Interfaz gráfica

Comprovar que una interfaz gráfica está instalada

```
ls /usr/bin/*session
```

Respuesta esperada: `/usr/bin/dbus-run-session`

## System details

Show system details

```
uname -a
```

## Sudo

Check that sudo is installed

```
apt-cache policy sudo
```

Check the strong configuration for sudo

```
cat /etc/sudoers.d/sudo_config
```

## Partitions

See partitions

```
lsblk
```

## SSH

Service is runing

```
service ssh status
```

Configuration file

```
/etc/ssh/sshd_config
```

Connect via SSH

```
ssh alaparic@localhost -p 4242
```

## UFW _(Uncomplicated FireWall)_

Configure port rule

```
ufw allow <number>
```

Delete port rule

```
ufw delete <number>
```

See opened ports

```
ufw status numbered
```

## Users and groups

Create a new user

```
adduser <username>
```

Create a new group

```
addgroup <groupname>
```

Add user to group

```
adduser <username> <groupname>
```

Check which groups a user belongs to

```
groups <username>
```

Check password rules in users

```
chage -l <username>
```

## Password policy

See password policy

```
vim /etc/pam.d/common-password
```

See password expiration

```
vim /etc/login.defs
```

## _hostname_

Check current hostname

```
hostname
```

### Change the hostname

Chnage the current value for the new login in these two files

```
vim /etc/hostname
```

```
vim /etc/hosts
```

## Password policy

Open the configuration file

```
vim /etc/pam.d/common-password
```

## Crontab

Open the crontab config file

```
crontab -u root -e
```

Start / Stop

```
/etc/init.d/cron start

/etc/init.d/cron stop
```
