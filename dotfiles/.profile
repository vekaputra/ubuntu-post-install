export GOROOT=/usr/local/go
export GOPATH=$HOME/go/
export GO111MODULE=on
export GOPRIVATE=github.com/payfazz
export PATH=$GOROOT/bin:$GOPATH/bin:/usr/bin/protobuf/bin:$HOME/.composer/vendor/bin:$HOME/.flutter/flutter/bin:/opt/android-studio/bin:$PATH

export DB_HOST=localhost
export DB_PORT=5432
export DB_USER=postgres
export DB_PASS=root

export DB_MIGRATE_USER=postgres
export DB_MIGRATE_PASS=root

export TEST_DB_HOST=localhost
export TEST_DB_PORT=5432
export TEST_DB_USER=postgres
export TEST_DB_PASS=root

export TEST_DB_MIGRATE_USER=postgres
export TEST_DB_MIGRATE_PASS=root

export REDIS_PASS=root

export TEST_REDIS_PASS=root