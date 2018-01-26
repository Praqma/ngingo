package main
import (
  "net/http"
)
func ping(w http.ResponseWriter, r *http.Request) {
  w.Write([]byte("pong"))
}
func main() {
  http.Handle("/", http.FileServer(http.Dir("./site")))
  http.HandleFunc("/ping", ping)
  if err := http.ListenAndServe(":80", nil); err != nil {
    panic(err)
  }
}
