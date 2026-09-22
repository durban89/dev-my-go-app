package main

import (
	"fmt"
	"net/http"
)

func helloHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprint(w, "Hello, Enterprise Terraform! verison: v1.0.0!\n")
}

func main() {
	http.HandleFunc("/", helloHandler)

	fmt.Println("Server is running on http://localhost:8080 ...")

	if err := http.ListenAndServe(":8080", nil); err != nil {
		fmt.Printf("Server failed to start: %v\n", err)
	}
}
