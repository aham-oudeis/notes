## Tutorial
1. create a droplet from do: this is just about settting up a new computer that you are comfortable with
2. DO (Digital Ocean) configures the machine and generates an ip address for the vps: use this ip address to connect with some domain name.
3. To secure the vps, we need to take some steps:
		a. use a firewall to disable all traffic to the server except ssh: that ssh is the only way to securely access the server
		b. create an unprivileged account to use instead of superuser account: __principle of least privilege__

4. Set up nginx to route traffic looking for specific ports

#### Securing the VPS
1. connect to the vps using ssh: `ssh root@<ip address of the machine>`
2. Enter the passphrase to access the ssh file
3. Then you can configure the the vps.
4. `adduser <username>`
5. add new user to the sudo user group: `usermod -aG sudo <username>`

__in order to be able to login to the device only using the new username
6. move the ssh keys from the root folder to the folder inside the username, with all the associated permissions: `rsync --archive --chown=<username>:<username> ~/.ssh /home/<username>`

__lock down firewall__
(order is important; otherwise the firewall is gonna stop even the ssh connection)
7. first allow the connection from ssh: `sudo ufw allow OpenSSH`
8. enable firewall: `sudo ufw enable`
9. disable the root account: `sudo vim /etc/ssh/sshd_config` and then change `Permit rootlogin yes` to `Permit rootlogin no`
10. restart the ssh service `sudo service ssh restart`

__enable incoming traffic to port 3000__
`sudo ufw allow 3000 `

to delete the rule: `sudo ufw delete allow 3000`

__Routing traffic from a domain name to an ip address__
- through custom records
- map the domain name to the ip address

__Setting up Nginx__
- so as to reroute the traffic to appropriate place
`sudo apt install nginx`

What does nginx do? It is a reverse proxy server, which has to be configured to redirect traffic to the server we set up.

To configure the nginx settings:
`sudo vim /etc/nginx/sites-available/default`

Then go to the line with `server_name` and add the list of domain names to pick up.

To test the changes `sudo nginx -t`

## Adding PM2 for running the app
`npm install pm2 -g` => installs pm2 globally
`pm2 startup systemd` => start pm2 when the system is running

you will have to copy paste the command that is generated by the second command, bc it requires root privileges from the system

#### https through certabot
1. get snapd for ubuntu: 
```
sudo apt update
sudo apt install snapd
```
2. install certbot through snapd
```
# ensure that you have the latest version of snapd
$ sudo snap install core; sudo snap refresh core

# install cerbot
$ sudo snap install --classic certbot

#ensure that certbot command can be run
$ sudo ln -s /snap/bin/certbot /usr/bin/certbot

#following command gets a certificate and configures certbot to edit your nginx automatically to serve it
$ sudo certbot --nginx
```

### allow firewall to get https traffic
```
$ sudo ufw allow 'Nginx Full'

//since http is redundant with nginx full, let's remove the http from firewall
$ sudo ufw delete allow 'Nginx HTTP'
```