{{ template "includes/header" }}

<div class="col-md-5 ch-content">
    <ul class="menu">

        <!-- add one of these lines for each page you add -->
        <!-- set the active class only on the appropriate page -->
        <li role="presentation"><h2><a href="coldkernel">coldkernel</a></h2></li>
        <li role="presentation" class="active"><h2><a href="atlastools">atlas_tools</a></h2></li>
	<li role="presentation"><h2><a href="sync_family">sync_family</a></h2></li>
        <li role="presentation"><h2><a href="relays">relays</a></h2></li>
	<li role="presentation"><h2><a href="about">about</a></h2></li>

    </ul>
    <br>
    <div class="ch-project-description">
        <div class="row">
            <div class="col-md-12">
                <div class="col-md-offset-8 col-md-4">
                    <div class="github-section">
                        <p>
                            <a class="github-link" href="https://github.com/coldhakca/atlas_tools">atlas_tools on GitHub</a>
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <div class="readme">
                    {{ template "atlas_toolsreadme" }}
                </div>
            </div>
            <br><br>
        </div>
    </div>

{{ template "includes/footer" }}
