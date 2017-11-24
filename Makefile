VERSION ?= latest
REGISTRY ?= docker.io

default: build

clean:
	docker rmi $(REGISTRY)/bborbe/squid:$(VERSION)

build:
	docker build --no-cache --rm=true -t $(REGISTRY)/bborbe/squid:$(VERSION) .

run:
	docker run \
	-p 3128:3128 \
	$(REGISTRY)/bborbe/squid:$(VERSION)

shell:
	docker run -i -t $(REGISTRY)/bborbe/squid:$(VERSION) /bin/bash

upload:
	docker push $(REGISTRY)/bborbe/squid:$(VERSION)





