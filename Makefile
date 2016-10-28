build:
	time docker build -t ralphtheninja/zcash:v1.0.0 .

run:
	docker run -d --name zcash -v ~/.zcash:/root/.zcash ralphtheninja/zcash:v1.0.0
