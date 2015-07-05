{{ template "includes/header" }}

<div class="col-md-5 ch-content">
    <ul class="menu">

        <!-- add one of these lines for each page you add -->
        <!-- set the active class only on the appropriate page -->
        <li role="presentation"><h2><a href="coldkernel">coldkernel</a></h2></li>
        <li role="presentation"><h2><a href="sync_family">sync_family</a></h2></li>
        <li role="presentation" class="active"><h2><a href="relays">relays</a></h2></li>

    </ul>
    <br>
    <div class="ch-project-description">

        <h3>Version: {{ .Version }}</h3>
        <h3>Relays Published: {{ .RelaysPublished }}</h3>
        <h3>Bridges Published: {{ .BridgesPublished }}</h3>

        <p>
            {{ .Families }}
        </p>

        <!-- <p>coming soon</p> -->

    </div>

{{ template "includes/footer" }}
