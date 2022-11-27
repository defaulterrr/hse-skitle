package main

import (
	"time"

	ginzap "github.com/gin-contrib/zap"
	"github.com/gin-gonic/gin"
	"go.uber.org/zap"
)



func main() {
	gin.SetMode(gin.ReleaseMode)

	r := gin.New()

	logger, _ := zap.NewProduction()

	r.Use(ginzap.Ginzap(logger, time.RFC3339, true))
	r.Use(ginzap.RecoveryWithZap(logger, true))

	// Get all jobs
	r.GET("/jobs", func(ctx *gin.Context) {
	    query := "SELECT id, tag, description, price, image, address, status FROM task"

	    ctxWithTimeout, cancel := context.WithTimeout(context.Background(), time.Second*5)
	    defer cancel()

	    rows, err := rs.pool.Query(ctxWithTimeout, query)
	    if err != nil {
		return nil, fmt.Errorf("pool.Query: %w", err)
	    }
	    defer rows.Close()

	    var result []task
	    for rows.Next() {
		var row task
		err = rows.Scan(&row.ID, &row.Tag, &row.Description, &row.Price, &row.Image, &row.Address, &row.Status)
		if err != nil {
		    return nil, fmt.Errorf("rows.Scan: %w", err)
		}

		result = append(result, row)
	    }

	    if err := rows.Err(); err != nil {
		return nil, fmt.Errorf("error in result query: %w", err)
	    }
	})
	
	// post job
	r.GET("/jobs", func(ctx *gin.Context) {
	    var query string
	    if in.ID == 0 {
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

	    ctxWithTimeout, cancel := context.WithTimeout(context.Background(), time.Second*5)
	    defer cancel()

	    _, err := rs.pool.Exec(ctxWithTimeout, query)
	    if err != nil {
		return fmt.Errorf("pool.Exec: %w", err)
	    }
	})

	r.Run()
}
