<h1><a name="coldkernel" class="anchor" href="#coldkernel" rel="nofollow" aria-hidden="true"><span class="octicon octicon-link"></span></a>coldkernel</h1>

<p>coldkernel is an attempt at automating the build process of grsec-enabled kernels on Debian/Ubuntu.</p>
<h2><a name="dependencies" class="anchor" href="#dependencies" rel="nofollow" aria-hidden="true"><span class="octicon octicon-link"></span></a>
Dependencies</h2>

<pre><code>sudo apt-get install paxctl bc wget gnupg fakeroot build-essential devscripts libfile-fcntllock-perl curl git kernel-package
sudo apt-get build-dep linux
sudo apt-get install gcc-4.9-plugin-dev (replace with the version appropriate for your gcc version)
</code></pre>
<h2><a name="clone-build" class="anchor" href="#clone-build" rel="nofollow" aria-hidden="true"><span class="octicon octicon-link"></span></a>
Clone / Build</h2>

<pre><code>wget &#34;https://coldhak.ca/coldhak/keys/colin.asc&#34; -O colin.asc
gpg --import colin.asc
git clone https://github.com/coldhakca/coldkernel
cd coldkernel
git verify-tag coldkernel-0.6b-4.3.3
git checkout tags/coldkernel-0.6b-4.3.3
make
</code></pre>
<h2><a name="once-built" class="anchor" href="#once-built" rel="nofollow" aria-hidden="true"><span class="octicon octicon-link"></span></a>
Once built</h2>

<pre><code>wget https://grsecurity.net/paxctld/paxctld_1.0-4_amd64.{deb,deb.sig}
gpg --homedir=.gnupg --verify paxctld_1.0-4_amd64.{deb.sig,deb}
sudo dpkg -i paxctld_1.0-4_amd64.deb
sudo make install
sudo cp paxctld.conf /etc/paxctld.conf
sudo paxctld -d
sudo systemctl enable paxctld
sudo reboot
</code></pre>
<h2><a name="gids" class="anchor" href="#gids" rel="nofollow" aria-hidden="true"><span class="octicon octicon-link"></span></a>
GIDs</h2>
<h3><a name="9001-grkernsec-proc-usergroup" class="anchor" href="#9001-grkernsec-proc-usergroup" rel="nofollow" aria-hidden="true"><span class="octicon octicon-link"></span></a>
<code>9001</code>:GRKERNSEC_PROC_USERGROUP</h3>

<p>Users in this group are exempted from grsecurity&#39;s /proc restrictions.</p>
<h3><a name="9002-config-grkernsec-tpe-untrusted-gid" class="anchor" href="#9002-config-grkernsec-tpe-untrusted-gid" rel="nofollow" aria-hidden="true"><span class="octicon octicon-link"></span></a>
<code>9002</code>:CONFIG_GRKERNSEC_TPE_UNTRUSTED_GID</h3>

<p>Users in this group will not be able to execute any files that are not in root-owned directories writable only by root.</p>
<h3><a name="9003-config-grkernsec-socket-all" class="anchor" href="#9003-config-grkernsec-socket-all" rel="nofollow" aria-hidden="true"><span class="octicon octicon-link"></span></a>
<code>9003</code>:CONFIG_GRKERNSEC_SOCKET_ALL</h3>

<p>Users in this group will be unable to connect to other hosts from your machine or run server applications from your machine.</p>
<h2><a name="group-creation" class="anchor" href="#group-creation" rel="nofollow" aria-hidden="true"><span class="octicon octicon-link"></span></a>
Group Creation</h2>

<pre><code>sudo groupadd -g 9001 grsecproc
sudo groupadd -g 9002 tpeuntrusted
sudo groupadd -g 9003 denysockets
</code></pre>
<h2><a name="important-notice" class="anchor" href="#important-notice" rel="nofollow" aria-hidden="true"><span class="octicon octicon-link"></span></a>
Important Notice</h2>

<p>This is still extremely alpha. If it breaks, you get to keep the pieces. There is currently support for x86_64 only.</p>
