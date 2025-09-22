#!/bin/bash

set -e

export GO111MODULE="on"
go test -tags 's3 metadata' -v -race -coverprofile=coverage.txt -covermode=atomic -coverpkg github.com/adtech-qa-tools/selenoid,github.com/adtech-qa-tools/selenoid/session,github.com/adtech-qa-tools/selenoid/config,github.com/adtech-qa-tools/selenoid/protect,github.com/adtech-qa-tools/selenoid/service,github.com/adtech-qa-tools/selenoid/upload,github.com/adtech-qa-tools/selenoid/info,github.com/adtech-qa-tools/selenoid/jsonerror

go install golang.org/x/vuln/cmd/govulncheck@latest
"$(go env GOPATH)"/bin/govulncheck -tags production ./...
