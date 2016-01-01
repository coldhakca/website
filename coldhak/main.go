//  Description = coldhak website
//  Authors = coldhak (C. // J. // R. // T.)
//  Version = 1.0

package main

import (
    "io/ioutil"
    "net/http"
	"github.com/pilu/traffic"
    "github.com/russross/blackfriday"
)

func buildReadme(w traffic.ResponseWriter, r *traffic.Request) {
    resp, err := http.Get("https://raw.githubusercontent.com/coldhakca/coldkernel/master/README.md")
    if err != nil {}
    defer resp.Body.Close()
    body, err := ioutil.ReadAll(resp.Body)
    if err != nil {}
    output := blackfriday.MarkdownBasic(body)
    //pp := string(output[:])

    err = ioutil.WriteFile("views/coldkernelreadme.tpl", output, 0644)
    if err != nil {
        panic(err)
    }
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
    router.Get("/buildcoldkernelreadme", buildReadme)
	router.Run()
}
