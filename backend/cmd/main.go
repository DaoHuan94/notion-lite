package main

import (
	"fmt"
	envConfigs "notion-lite/infra/env"
)

func main() {
	envConfigs := envConfigs.LoadConfig()

	fmt.Println(envConfigs.DBUrl())
}
