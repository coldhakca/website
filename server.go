package main

import (
    "html/template"
    "net/http"
)

func renderTemplate(w http.ResponseWriter, r *http.Request) {
        title := r.URL.Path[len("/"):]
    if title == "" {
        title = "coldkernel"
    }
    t, err := template.ParseFiles("views/" + title + ".html")
    if err != nil {
        http.Error(w, err.Error(), http.StatusInternalServerError)
        return
    }
    err = t.Execute(w, t)
    if err != nil {
        http.Error(w, err.Error(), http.StatusInternalServerError)
    }
}

func main() {
    http.Handle("/css/", http.StripPrefix("/css/", http.FileServer(http.Dir("css"))))
    http.Handle("/js/", http.StripPrefix("/js/", http.FileServer(http.Dir("js"))))
    http.Handle("/img/", http.StripPrefix("/img/", http.FileServer(http.Dir("img"))))
    http.HandleFunc("/coldkernel", renderTemplate)
    http.HandleFunc("/", renderTemplate)
    http.ListenAndServe(":3000", nil)
}
