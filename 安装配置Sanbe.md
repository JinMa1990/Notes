参考资料：https://ubuntu.com/tutorials/install-and-configure-samba#1-overview

## 1. Overview

A Samba file server enables file sharing across different operating systems over a network. It lets you access your desktop files from a laptop and share files with Windows and macOS users.

This guide covers the installation and configuration of Samba on Ubuntu.
What you’ll learn

    How to set up a Samba file server
    How to share files across a local network

What you’ll need

    Ubuntu 16.04 LTS
    A Local Area Network (LAN) to share files over

If you have everything ready, let’s dive straight into the installation process on the next step!

Originally authored by Aden Padilla.
## 2. Installing Samba

To install Samba, we run:
```
sudo apt update
sudo apt install samba
```
We can check if the installation was successful by running:

whereis samba

The following should be its output:
```
samba: /usr/sbin/samba /usr/lib/samba /etc/samba /usr/share/samba /usr/share/man/man7/samba.7
```

##3. Setting up Samba

Now that Samba is installed, we need to create a directory for it to share:

mkdir /home/<username>/sambashare/

The command above creates a new folder sambashare in our home directory which we will share later.

The configuration file for Samba is located at /etc/samba/smb.conf. To add the new directory as a share, we edit the file by running:

sudo nano /etc/samba/smb.conf

At the bottom of the file, add the following lines:

[sambashare]
    comment = Samba on Ubuntu
    path = /home/username/sambashare
    read only = no
    browsable = yes

Then press Ctrl-O to save and Ctrl-X to exit from the nano text editor.
What we’ve just added

        comment: A brief description of the share.
    
    path: The directory of our share.
    
    read only: Permission to modify the contents of the share folder is only granted when the value of this directive is no.
    
    browsable: When set to yes, file managers such as Ubuntu’s default file manager will list this share under “Network” (it could also appear as browseable).

Now that we have our new share configured, save it and restart Samba for it to take effect:

sudo service smbd restart

Update the firewall rules to allow Samba traffic:

sudo ufw allow samba

## ## 4\. Setting up User Accounts and Connecting to Share

<article class="l-tutorial-section__content">

Since Samba doesn’t use the system account password, we need to set up a Samba password for our user account:

```
sudo smbpasswd -a username

```

**Note**
Username used must belong to a system account, else it won’t save.

### Connecting to Share

On Ubuntu: Open up the default file manager and click *Connect to Server* then enter: ![ubuntuctn](https://upload-images.jianshu.io/upload_images/5806964-2dce4287c89f1df6.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

On macOS: In the Finder menu, click *Go > Connect to Server* then enter: ![macosctn](https://upload-images.jianshu.io/upload_images/5806964-7eda40193a2b2b7a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

On Windows, open up File Manager and edit the file path to:

```
\\ip-address\sambashare

```

Note: `ip-address` is the Samba server IP address and `sambashare` is the name of the share.

You’ll be prompted for your credentials. Enter them to connect! ![Samba](https://upload-images.jianshu.io/upload_images/5806964-a2fa35f6f3e8ed84.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

### If you’d like to take your configuration further…

[Samba Server Guide](https://help.ubuntu.com/community/Samba/SambaServerGuide)