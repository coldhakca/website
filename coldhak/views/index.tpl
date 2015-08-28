{{ template "includes/header" }}

<div class="col-md-5 ch-content">
    <ul class="menu">

        <!-- add one of these lines for each page you add -->
        <!-- set the active class only on the appropriate page -->
        <li role="presentation" class="active"><h2><a href="coldkernel">coldkernel</a></h2></li>
        <li role="presentation"><h2><a href="sync_family">sync_family</a></h2></li>
        <li role="presentation"><h2><a href="relays">relays</a></h2></li>

    </ul>
    <br>
    <div class="ch-project-description">
        <div class="row">
            <div class="col-md-8">
                <p>
                    coldkernel is an attempt at automating the build process of grsec-enabled kernels on Debian/Ubuntu.
                </p>
            </div>
            <div class="col-md-4">
                <div class="github-section">
                    <p>
                        <a class="github-link" href="https://github.com/coldhakca/coldkernel">coldkernel on GitHub</a>
                    </p>
                </div>
            </div>
        </div>
        <p>
            Place all files into the same directory, and run <strong><em>make</em></strong>. This directory will become messy, so it is encouraged to create a directory specifically for building coldkernel.
        </p>
        <h2>Dependencies</h2>
        <div class="console">
            $ sudo apt-get install paxctl bc wget gnupg fakeroot build-essential devscripts libfile-fcntllock-perl curl <br>
            $ sudo apt-get build-dep linux <br>
            $ sudo apt-get install gcc-4.9-plugin-dev (replace with the version appropriate for your gcc version)
        </div>
        <p>Once built</p>
        <div class="console">
            $ sudo dpkg -i linux-*.deb
	    $ sudo paxctl -Cm /usr/sbin/grub-probe
	    $ sudo paxctl -Cm /usr/sbin/grub-mkdevicemap
	    $ sudo paxctl -Cm /usr/sbin/grub-setup
	    $ sudo paxctl -Cm /usr/bin/grub-script-check
	    $ sudo paxctl -Cm /usr/bin/grub-mount

        </div>
        <h2>GIDs</h2>
        <div class="console">
            TPE-trusted(CONFIG_GRKERNSEC_TPE_TRUSTED_GID) = 1005<br>
            Deny sockets(CONFIG_GRKERNSEC_SOCKET_ALL) = 1004<br>
            PROC usergroup(GRKERNSEC_PROC_USERGROUP) = 1001
        </div>
        <h2>Important Notice</h2>
        <p>
            <div class="warning">
                This is still extremely alpha. If it breaks, you get to keep the pieces. There is currently support for x86_64 only.
            </div>
        </p>
    </div>

{{ template "includes/footer" }}
