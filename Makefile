
.PHONY: test
test : unit fuzz
.PHONY: unit
unit :
	go test -v -covermode=count -coverprofile=profile.cov ./...
.PHONY: fuzz
fuzz :
	go test -v -cover -fuzz=FuzzShouldIgnore ./utils -fuzztime=10s
	go test -v -cover -fuzz=FuzzPackageCanGetVerificationCode ./utils -fuzztime=10s
