# AtCoder practice repository

This is my personal practice repository of [AtCoder](https://atcoder.jp/).

You can clone or copy this repository and use `init.sh` to generate blueprint code.

## Usage of init.sh

`init.sh` creates a directory which includes code set to solve a problem.

```bash
./init.sh {go module name} {directory name}
```

e.g.

```bash
./init.sh github.com/mookjp/atcoder 160
```

This command creates files like below: 

```
160
├── a
│   ├── go.mod
│   ├── main.go
│   ├── main_test.go
│   └── testfiles
│       └── 001
│           ├── stdin.txt
│           └── stdout.txt
├── b
│   ├── go.mod
│   ├── main.go
│   ├── main_test.go
│   └── testfiles
│       └── 001
│           ├── stdin.txt
│           └── stdout.txt

...
```

## Write code on main.go

Use `reader` and `writer` as STDIN and STDOUT.

```go
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
    // Solve problem...
	fmt.Fprint(writer, "Answer")
}
```

## tests in this repository

Generated directories contain `main_test.go`.


Test function `Test_main()` reads files under `testfiles/{testcase}` directory.
`stdin.txt` content will be loaded as STDIN on AtCoder and
`stdout.txt` content will be handled as expected STDOUT on AtCoder in tests.

You can copy STDIN and expected STDOUT from question page e.g. [C \- Traveling Salesman around Lake](https://atcoder.jp/contests/abc160/tasks/abc160_c)

After you updated your `stdin.txt` and `stdout.txt`, run `go test` under the question directory.