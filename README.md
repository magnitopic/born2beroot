# **Born2beroot**

These are some commands that will be usefull during the evaluation of the born2beroot proyect.

## UFW _(Uncomplicated FireWall)_

Configure port rule

```
ufw allow 4242
```

Delete port rule

```
ufw status numbered
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

## _hostname_

Check current hostname

```
hostnamectl
```

### Change the hostname

Set the hostname

```
hostnamectl set-hostname <new_hostname>
```

Change /etc/hosts file

```
vim /etc/hosts
```

```
127.0.0.1       localhost
127.0.0.1       <new_hostname>
```

## Password policy

Open the configuration file

```
vim/etc/pam.d/common-password
```
