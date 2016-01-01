//  Description = coldhak website
//  Authors = coldhak (C. // J. // R. // T.)
//  Version = 1.0

package main

import (
    "io/ioutil"
    "net/http"
	"github.com/pilu/traffic"
    "github.com/shurcooL/github_flavored_markdown"
)

func build(page string, location string) {
    resp, err := http.Get(page)
    if err != nil {}

    defer resp.Body.Close()
    body, err := ioutil.ReadAll(resp.Body)
    if err != nil {}

    output := github_flavored_markdown.Markdown(body)

    err = ioutil.WriteFile(location, output, 0644)
    if err != nil {}
}

func buildColdkernel(w traffic.ResponseWriter, r *traffic.Request) {
    build("https://raw.githubusercontent.com/coldhakca/coldkernel/master/README.md", "views/coldkernelreadme.tpl")
}

func buildSyncFamily(w traffic.ResponseWriter, r *traffic.Request) {
    build("https://raw.githubusercontent.com/coldhakca/sync_family/master/README.md", "views/sync_familyreadme.tpl")
}

func indexHandler(w traffic.ResponseWriter, r *traffic.Request) {
	w.Render("index")
}

func relaysHandler(w traffic.ResponseWriter, r *traffic.Request) {
	w.Render("relays")
}

func sync_familyHandler(w traffic.ResponseWriter, r *traffic.Request) {
	w.Render("sync_family")
}

func aboutHandler(w traffic.ResponseWriter, r *traffic.Request) {
    w.Render("about")
}

func main() {
	router := traffic.New()

	// add a route for each page you add to the site
	// make sure you create a route handler for it
	router.Get("/", indexHandler)
	router.Get("/coldkernel", indexHandler)
	router.Get("/relays", relaysHandler)
	router.Get("/sync_family", sync_familyHandler)
	router.Get("/about", aboutHandler)
    router.Get("/build/coldkernel", buildColdkernel)
    router.Get("/build/sync_family", buildSyncFamily)
	router.Run()
}
