---
layout: post
title:  "Coldkernel on Qubes pt.1 "
date:   2016-12-10 22:02:17 -0600
categories: blog
---
We are currently working on supporting both Debian and Fedora TemplateVMs, however the below instructions assume a Debian 8 TemplateVM. 

It is suggested that you create a dedicated Debian TemplateVM for experimenting with coldkernel. This support is very experimental, and may result in broken Templates. 

## Configuring Debian TemplateVM
First, change your max storage size to be 10GB (you can likely get away with anything over 4GB, however running out of disk space at the end of a build can be frustrating).
![Qubes VM Manager]({{ site.url }}/assets/img/blog/coldkernel_pt1/size.png)
### Fix sources.list
Open ```/etc/apt/sources.list``` and uncomment the lines starting with ```deb-src```. It should look something like this:

{% highlight bash %}
deb http://httpredir.debian.org/debian jessie main contrib non-free
deb-src http://httpredir.debian.org/debian jessie main contrib non-free

deb http://security.debian.org jessie/updates main contrib non-free
deb-src http://security.debian.org jessie/updates main contrib non-free
{% endhighlight %}

### Installing dependencies
Run in dom0:
{% highlight bash %}
sudo qubes-dom0-update grub2-xen
{% endhighlight %}

Run in your Debian TemplateVM:
{% highlight bash %}
sudo apt install qubes-kernel-vm-support grub2-common
sudo apt install paxctl bc wget gnupg fakeroot build-essential devscripts libfile-fcntllock-perl git gcc-4.9-plugin-dev
sudo apt-get build-dep linux
{% endhighlight %}

## Building coldkernel
### Cloning and verification
Once dependencies are installed, clone and verify the coldkernel build scripts on your TemplateVM:

{% highlight bash %}
wget "https://coldhak.ca/coldhak/keys/coldhak.asc" -O coldhak.asc
gpg --import coldhak.asc
git clone https://github.com/coldhakca/coldkernel
cd coldkernel
git verify-tag coldkernel-0.9a-4.8.13
git checkout tags/coldkernel-0.9a-4.8.13
{% endhighlight bash %}
![coldkernel verify]({{ site.url }}/assets/img/blog/coldkernel_pt1/verify.png)

### Building
Next, begin the coldkernel build. This step may take multiple hours depending on your hardware.
{% highlight bash %}
make qubes-guest
{% endhighlight %}
![coldkernel build]({{ site.url }}/assets/img/blog/coldkernel_pt1/build.png)

## Installing coldkernel
Run in your Debian TemplateVM post-build:

{% highlight bash %}
wget https://grsecurity.net/paxctld/paxctld_1.2.1-1_amd64.{deb,deb.sig}
gpg --homedir=.gnupg --verify paxctld_1.2.1-1_amd64.{deb.sig,deb}
sudo dpkg -i paxctld_1.2.1-1_amd64.deb
sudo make install-deb
sudo cp paxctld.conf /etc/paxctld.conf
sudo paxctld -d
sudo systemctl enable paxctld
sudo mkdir /boot/grub
sudo update-grub2
sudo shutdown -h now
{% endhighlight %}

## Post-install TemplateVM configuration
Once the TemplateVM has been shutdown, you can change the kernel in the Qubes VM manager to pvgrub and start the VM.

![Qubes VM Manager]({{ site.url }}/assets/img/blog/coldkernel_pt1/pvgrub.png)
