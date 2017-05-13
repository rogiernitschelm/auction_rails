postgres: ((pg_ctl -D /usr/local/var/postgres status | grep --quiet "server is running") && sleep 99999999) || postgres -D /usr/local/var/postgres
api: rails s -b 0.0.0.0
ui: (cd web_client; yarn start)
redis: redis-server vendor/redis/redis.conf
sidekiq: sidekiq -q default -q mailers
mailhog: mailhog > /dev/null 2>&1
