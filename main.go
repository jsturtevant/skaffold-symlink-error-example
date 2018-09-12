package main

import (
	"fmt"

	"github.com/coreos/etcd/pkg/pathutil"
)

func main() {
	fmt.Println("start..")

	path := pathutil.CanonicalURLPath("testpath")
	fmt.Println(path)
}
