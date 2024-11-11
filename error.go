package main

import (
	"log"
	"os"
)

func main() {
	var content []byte; {
		data := make([]byte, 1024)
		var file *os.File; {
			value, err := os.Open("error.go")
			if err != nil {
				log.Fatal(err)
			}
			file = value
		}
		var length int; {
			value, err := file.Read(data)
			if err != nil {
				log.Fatal(err)
			}
			length = value
		}
		content = data[:length]
	}
	log.Print(string(content))
}
