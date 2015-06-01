package main

import (
    "html/template"
    "net/http"
)

func renderTemplate(w http.ResponseWriter, r *http.Request) {
	title := r.URL.Path[len("/"):]
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

func addDefaultHeaders(fn http.HandlerFunc) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        if origin := r.Header.Get("Origin"); origin != "" {
            w.Header().Set("Access-Control-Allow-Origin", origin)
        }
        //w.Header().Set("Strict-Transport-Security", "max-age=31536000; includeSubdomains")
        w.Header().Set("X-Frame-Options", "DENY")
        w.Header().Set("Content-Security-Policy", "'self'")
        fn(w, r)
    }
}

func redir(w http.ResponseWriter, req *http.Request) {
	http.Redirect(w, req, "https://coldhak.ca" + req.RequestURI, http.StatusMovedPermanently)
}

func main() {
    http.Handle("/css/", http.StripPrefix("/css/", http.FileServer(http.Dir("css"))))
    http.Handle("/img/", http.StripPrefix("/img/", http.FileServer(http.Dir("img"))))
    http.HandleFunc("/coldkernel", addDefaultHeaders(renderTemplate))
    http.ListenAndServe(":8080", http.HandlerFunc(redir))
    http.ListenAndServeTLS(":8443", "/etc/nginx/conf/ssl-unified.crt", "/etc/nginx/conf/ssl.key", nil)
}