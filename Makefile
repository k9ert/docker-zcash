build:
	time docker build -t docker-zcash .

run:
	docker run -d --name zcash docker-zcash

start:
	docker start zcash

stop:
	docker stop zcash

rm:
	docker rm -f zcash

push:
	docker push ralphtheninja/docker-zcash
