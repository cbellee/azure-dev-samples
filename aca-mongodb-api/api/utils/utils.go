package utils

import (
	"os"
)

func GetEnvVar(key string) string {
	value, exists := os.LookupEnv(key)
	if !exists || value == "" {
		panic("Env var " + key + " not found")
	}
	return value
}
