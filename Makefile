VERSION = 1.0.7
LDFLAGS = -ldflags '-s -w' -gcflags=-trimpath=${PWD} -asmflags=-trimpath=${PWD}
GOARCH = amd64
linux: export GOOS=linux
linux_arm: export GOOS=linux
linux_arm: export GOARCH=arm
linux_arm: export GOARM=6
linux_arm64: export GOOS=linux
linux_arm64: export GOARCH=arm64
darwin: export GOOS=darwin
windows: export GOOS=windows

.PHONY: all linux linux_arm linux_arm64 darwin windows clean

all: linux linux_arm linux_arm64 darwin windows

linux:
	go build $(LDFLAGS)
	mkdir -p release
	rm -f release/aws-rotate-key-${VERSION}-${GOOS}_${GOARCH}.zip
	zip release/aws-rotate-key-${VERSION}-${GOOS}_${GOARCH}.zip aws-rotate-key

linux_arm:
	go build $(LDFLAGS)
	mkdir -p release
	rm -f release/aws-rotate-key-${VERSION}-${GOOS}_${GOARCH}.zip
	zip release/aws-rotate-key-${VERSION}-${GOOS}_${GOARCH}.zip aws-rotate-key

linux_arm64:
	go build $(LDFLAGS)
	mkdir -p release
	rm -f release/aws-rotate-key-${VERSION}-${GOOS}_${GOARCH}.zip
	zip release/aws-rotate-key-${VERSION}-${GOOS}_${GOARCH}.zip aws-rotate-key

darwin:
	go build $(LDFLAGS)
	mkdir -p release
	rm -f release/aws-rotate-key-${VERSION}-${GOOS}_${GOARCH}.zip
	zip release/aws-rotate-key-${VERSION}-${GOOS}_${GOARCH}.zip aws-rotate-key

windows:
	go build $(LDFLAGS)
	mkdir -p release
	rm -f release/aws-rotate-key-${VERSION}-${GOOS}_${GOARCH}.zip
	zip release/aws-rotate-key-${VERSION}-${GOOS}_${GOARCH}.zip aws-rotate-key.exe

clean:
	rm -rf release
	rm -f aws-rotate-key aws-rotate-key.exe
