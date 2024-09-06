IMAGE_NAME = therubyracer-on-debian-test

test:
	docker build -t $(IMAGE_NAME) . && docker run --rm $(IMAGE_NAME)
