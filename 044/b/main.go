package main

import (
	"bufio"
	"fmt"
	"io"
	"os"
)

var reader io.Reader
var writer io.Writer

func init() {
	reader = os.Stdin
	writer = os.Stdout
}

func main() {
	sc := bufio.NewScanner(reader)
	sc.Split(bufio.ScanRunes)

	m := make(map[string]int)
	for sc.Scan() {
		char := sc.Text()
		if char == "\n" {
			break
		}
		m[char]++
	}

	for _, val := range m {
		if val % 2 != 0 {
			fmt.Fprint(writer, "No")
			return
		}
	}
	fmt.Fprint(writer, "Yes")
}