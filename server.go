package main

import (
	"net/http"
	"os"
	"os/signal"
	"syscall"
	"context"
	"log"
)

func ping(w http.ResponseWriter, r *http.Request) {
	w.Write([]byte("pong"))
}
func main() {
	http.Handle("/", http.FileServer(http.Dir("./site")))
	http.HandleFunc("/ping", ping)

	server := http.Server{Addr: ":80"}
	go func() {
		log.Fatal(server.ListenAndServe())
	}()

	signalChan := make(chan os.Signal, 1)
	signal.Notify(signalChan, syscall.SIGINT, syscall.SIGTERM)
	<-signalChan

	log.Println("Shutdown signal received, exiting...")

	server.Shutdown(context.Background())
}
