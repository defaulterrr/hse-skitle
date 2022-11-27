package config

import "os"

type c struct {
	PostgresDSN string
}

func FromEnv() c {
	return c{
		PostgresDSN: os.Getenv("JOBS_POSTGRES_DSN"),
	}
}
