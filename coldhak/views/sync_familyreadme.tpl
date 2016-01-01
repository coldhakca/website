<h1><a name="sync-family" class="anchor" href="#sync-family" rel="nofollow" aria-hidden="true"><span class="octicon octicon-link"></span></a>sync_family</h1>

<p>Scripts for syncing tor family information across multiple relays</p>
<h2><a name="dependencies" class="anchor" href="#dependencies" rel="nofollow" aria-hidden="true"><span class="octicon octicon-link"></span></a>
Dependencies</h2>

<pre><code>apt-get install wget inotify-tools 
</code></pre>
<h2><a name="running" class="anchor" href="#running" rel="nofollow" aria-hidden="true"><span class="octicon octicon-link"></span></a>
Running</h2>

<ul>
<li>git clone <a href="https://github.com/coldhakca/sync_family.git" rel="nofollow">https://github.com/coldhakca/sync_family.git</a></li>
<li>Install crontab</li>
<li>Replace path in crontab with the path to the sync_family directory</li>
<li>Replace URL in crontab with the URL containing your clearsigned MyFamily line</li>
<li>Replace dummy GnuPG fingerprint in sync_family with the fingerprint(s) of the key used to sign the MyFamily file</li>
<li>Run check_family in screen/tmux</li>
</ul>
<h2><a name="important-notice" class="anchor" href="#important-notice" rel="nofollow" aria-hidden="true"><span class="octicon octicon-link"></span></a>
Important Notice</h2>

<p>This has had limited testing. If it breaks, you get to keep the pieces.</p>
