<h1>coldkernel</h1>

<p>coldkernel is an attempt at automating the build process of grsec-enabled kernels on Debian/Ubuntu.</p>

<h2>Dependencies</h2>

<p><code>
sudo apt-get install paxctl bc wget gnupg fakeroot build-essential devscripts libfile-fcntllock-perl curl git kernel-package
sudo apt-get build-dep linux
sudo apt-get install gcc-4.9-plugin-dev (replace with the version appropriate for your gcc version)
</code></p>

<h2>Clone / Build</h2>

<p><code>
wget &quot;https://coldhak.ca/coldhak/keys/colin.asc&quot; -O colin.asc
gpg --import colin.asc
git clone https://github.com/coldhakca/coldkernel
cd coldkernel
git verify-tag coldkernel-0.6b-4.3.3
git checkout tags/coldkernel-0.6b-4.3.3
make
</code></p>

<h2>Once built</h2>

<p><code>
wget https://grsecurity.net/paxctld/paxctld_1.0-4_amd64.{deb,deb.sig}
gpg --homedir=.gnupg --verify paxctld_1.0-4_amd64.{deb.sig,deb}
sudo dpkg -i paxctld_1.0-4_amd64.deb
sudo make install
sudo cp paxctld.conf /etc/paxctld.conf
sudo paxctld -d
sudo systemctl enable paxctld
sudo reboot
</code></p>

<h2>GIDs</h2>

<h3><code>9001</code>:GRKERNSEC<em>PROC</em>USERGROUP</h3>

<p>Users in this group are exempted from grsecurity's /proc restrictions.</p>

<h3><code>9002</code>:CONFIG<em>GRKERNSEC</em>TPE<em>UNTRUSTED</em>GID</h3>

<p>Users in this group will not be able to execute any files that are not in root-owned directories writable only by root.</p>

<h3><code>9003</code>:CONFIG<em>GRKERNSEC</em>SOCKET_ALL</h3>

<p>Users in this group will be unable to connect to other hosts from your machine or run server applications from your machine.</p>

<h2>Group Creation</h2>

<p><code>
sudo groupadd -g 9001 grsecproc
sudo groupadd -g 9002 tpeuntrusted
sudo groupadd -g 9003 denysockets
</code></p>

<h2>Important Notice</h2>

<p>This is still extremely alpha. If it breaks, you get to keep the pieces. There is currently support for x86_64 only.</p>
