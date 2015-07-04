{{ template "includes/header" }}

<div class="col-md-5 ch-content">
    <ul class="menu">

        <!-- add one of these lines for each page you add -->
        <!-- set the active class only on the appropriate page -->
        <li role="presentation"><h2><a href="coldkernel">coldkernel</a></h2></li>
        <li role="presentation"><h2><a href="relays">relays</a></h2></li>
	<li role="presentation" class="active"><h2><a href="sync_family">sync_family</a></h2></li>
    </ul>
    <br>
 <div class="ch-project-description">
        <div class="row">
            <div class="col-md-8">
                <p>
                	Scripts for syncing Tor family information across multiple relays
		</p>
            </div>
            <div class="col-md-4">
                <div class="github-section">
                    <p>
                        <a class="github-link" href="https://github.com/coldhakca/sync_family">sync_family on GitHub</a>
                    </p>
                </div>
            </div>
        </div>
	
        <h2>Dependencies</h2>
        <div class="console">
        apt-get install wget inotify-tools 
	</div>

	<h2>Running</h2>
	<div class="console">
	<ul>
	<li>git clone https://github.com/coldhakca/sync_family.git</li>
	<li>Install crontab 
		<ul>
			<li>Replace path in crontab with path to the sync_family directory</li>
			<li>Replace URL in crontab with the URL containing your clearsigned MyFamily line</li>
		</ul>
	</li>
	<li>Replace dummy GnuPG fingerprint in sync_family with the fingerprint(s) of the key used to sign the MyFamily file</li>
	<li>Run check_family in screen/tmux</li>
	</div>

	<h2>Important Notice</h2>
        <p>
            <div class="warning">
                This is still extremely alpha. If it breaks, you get to keep the pieces. There is currently support for x86_64 only.
            </div>
        </p>
    </div>

{{ template "includes/footer" }}
