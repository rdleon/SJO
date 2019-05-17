package redis

import (
	"fmt"
	"time"

	"sso/settings"

	"github.com/go-redis/redis"
)

type RedisClient redis.Client

var Client *RedisClient
var Nil = redis.Nil

func Init() *RedisClient {
	var config = settings.Get()

	tmp := redis.NewClient(&redis.Options{
		Addr:     fmt.Sprintf("%s:%d", config.RedisHost, config.RedisPort),
		Password: config.RedisPassword,
		DB:       config.RedisDatabase, // Default DB
	})

	client := RedisClient(*tmp)

	return &client
}

func (c *RedisClient) Save(key string, value string) error {
	if c == nil {
		c = Init()
	}

	return c.Set(key, value, 0).Err()
}

func (c *RedisClient) SaveExp(key string, value string, expiration time.Duration) error {
	if c == nil {
		c = Init()
	}

	return c.Set(key, value, expiration).Err()
}

func (c *RedisClient) Load(key string) (string, error) {
	if c == nil {
		c = Init()
	}

	return c.Get(key).Result()
}
