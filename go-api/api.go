package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
)

func handler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hello, %s!\n", r.URL.Path[1:])
	fmt.Fprintf(w, "%s REST Api created by %s, running on %s", os.Getenv("APP_NAME"), os.Getenv("AUTHOR"), os.Getenv("DEPLOY_ENV"))
	fmt.Println("RESTfulServ. on:8093, Controller:", r.URL.Path[1:])
}
func main() {
	http.HandleFunc("/", handler)
	fmt.Println("Starting Restful services...")
	fmt.Println("Using port:8093")
	err := http.ListenAndServe(":8093", nil)
	log.Print(err)
	errorHandler(err)
}
func errorHandler(err error) {
	if err != nil {
		fmt.Println(err)
		os.Exit(1)
	}
}
