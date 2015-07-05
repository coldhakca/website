package main

import (
	"fmt"
	"net/http"
	"github.com/pilu/traffic"
	"io/ioutil"
	"os"
	"encoding/json"
)

type Relays struct {
	Version string `json:"version"`
	RelaysPublished string `json:"relays_published"`
	Families `json:"relays"`
	BridgesPublished string `json:"bridges_published"`
}

type Families struct {
	Family []interface{} `json:"family"`
}

func fetchFamilyData() []byte {
	url := "https://onionoo.torproject.org/details?limit=4&search=32564421E5DC4A08981B707C00A6E96D8A0450C2&fields=family"

	response, err := http.Get(url)
	if err != nil {
		fmt.Printf("%s", err)
		os.Exit(1)
	} else {
		defer response.Body.Close()
		contents, err := ioutil.ReadAll(response.Body)
		if err != nil {
		    fmt.Printf("%s", err)
		    os.Exit(1)
		}
			fmt.Printf("%s\n", string(contents))

			return contents
		}
		return nil
	}

func indexHandler(w traffic.ResponseWriter, r *traffic.Request) {
	w.Render("index")
}

func relaysHandler(w traffic.ResponseWriter, r *traffic.Request) {
	contents := fetchFamilyData()

	var rs Relays
	json.Unmarshal(contents, &rs)

	w.Render("relays", rs)
}

func sync_familyHandler(w traffic.ResponseWriter, r *traffic.Request) {
        w.Render("sync_family")
}


func main() {
	router := traffic.New()

	// add a route for each page you add to the site
	// make sure you create a route handler for it
	router.Get("/", indexHandler)
	router.Get("/coldkernel", indexHandler)
	router.Get("/relays", relaysHandler)
	router.Get("/sync_family", sync_familyHandler)
	router.Run()
}
