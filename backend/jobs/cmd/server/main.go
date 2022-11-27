package main

import (
	"context"
	"fmt"
	"net/http"
	"time"

	"github.com/defaulterrr/hse-skitle/backend/jobs/internal/config"
	ginzap "github.com/gin-contrib/zap"
	"github.com/gin-gonic/gin"
	"github.com/jackc/pgx/v4"
	"go.uber.org/zap"
)

type task struct {
	ID          int64  `json:"id"`
	Tag         string `json:"tag"`
	Description string `json:"description"`
	Price       int64  `json:"price"`
	Image       string `json:"image"`
	Address     string `json:"address"`
	Status      string `json:"status"`
}

func main() {
	rootContext, cancel := context.WithCancel(context.Background())
	defer cancel()

	gin.SetMode(gin.ReleaseMode)

	r := gin.New()

	config := config.FromEnv()

	logger, _ := zap.NewProduction()

	logger.Warn("db connect info", zap.String("postgres_dsn", config.PostgresDSN))

	r.Use(ginzap.Ginzap(logger, time.RFC3339, true))
	r.Use(ginzap.RecoveryWithZap(logger, true))

	pool, err := pgx.Connect(rootContext, config.PostgresDSN)
	if err != nil {
		logger.Fatal("failed to connect to database", zap.NamedError("error", err))
	}

	// Get all jobs
	r.GET("/jobs", func(ctx *gin.Context) {
		query := "SELECT id, tag, description, price, image, address, status FROM task"

		ctxWithTimeout, cancel := context.WithTimeout(context.Background(), time.Second*5)
		defer cancel()

		rows, err := pool.Query(ctxWithTimeout, query)
		if err != nil {
			ctx.AbortWithError(http.StatusInternalServerError, fmt.Errorf("pool.Query: %w", err))
		}
		defer rows.Close()

		var result []task
		for rows.Next() {
			var row task
			err = rows.Scan(&row.ID, &row.Tag, &row.Description, &row.Price, &row.Image, &row.Address, &row.Status)
			if err != nil {
				ctx.AbortWithError(http.StatusInternalServerError, fmt.Errorf("rows.Scan: %w", err))
			}

			result = append(result, row)
		}

		if err := rows.Err(); err != nil {
			ctx.AbortWithError(http.StatusInternalServerError, fmt.Errorf("error in result query: %w", err))
		}

		ctx.JSON(http.StatusOK, rows)

		return
	})

	// post job
	r.GET("/jobs/:id", func(ctx *gin.Context) {
		ID := ctx.Param("id")

		var query string
		if ID == "0" {
			query = `INSERT INTO task (tag, description, price, image, address, status) VALUES($1, $2, $3, $4, $5, $6)`
		} else {
			query = `INSERT INTO task (id, tag, description, price, image, address, status) 
		    VALUES($1, $2, $3, $4, $5, $6, $7)
		    ON CONFLICT (id) DO UPDATE 
			SET tag = EXCLUDED.tag,
			description = EXCLUDED.description,
			price = EXCLUDED.price,
			image = EXCLUDED.image,
			address = EXCLUDED.address,
			status = EXCLUDED.status`
		}

		ctxWithTimeout, cancel := context.WithTimeout(ctx, time.Second*5)
		defer cancel()

		_, err := pool.Exec(ctxWithTimeout, query)
		if err != nil {
			ctx.AbortWithError(http.StatusInternalServerError, fmt.Errorf("pool.Exec: %w", err))
		}
	})

	r.Run()
}
