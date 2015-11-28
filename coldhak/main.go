// Coldhak website

package main

import (
	"github.com/pilu/traffic"
)

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
	router.Run()
}
