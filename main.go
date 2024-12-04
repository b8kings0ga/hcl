package main

import (
    "fmt"
    "os"

    "github.com/spf13/cobra"
)

func main() {
    var rootCmd = &cobra.Command{
        Use:   "hcltool",
        Short: "HCL Tool is a CLI tool to manipulate HCL files",
    }

    rootCmd.AddCommand(parseCmd)
    if err := rootCmd.Execute(); err != nil {
        fmt.Println(err)
        os.Exit(1)
    }
}