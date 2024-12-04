package main

import (
	"fmt"
	"log"
	"os"

	"github.com/hashicorp/hcl"
	"github.com/spf13/cobra"
)

var parseCmd = &cobra.Command{
    Use:   "parse [file]",
    Short: "Parse an HCL file",
    Args:  cobra.MinimumNArgs(1),
    Run: func(cmd *cobra.Command, args []string) {
        filePath := args[0]
        content, err := os.ReadFile(filePath)
        if (err != nil) {
            log.Fatalf("Failed to read file: %v", err)
        }

        var result map[string]interface{}
        err = hcl.Unmarshal(content, &result)
        if (err != nil) {
            log.Fatalf("Failed to parse HCL: %v", err)
        }

        fmt.Printf("Parsed HCL: %+v\n", result)
    },
}