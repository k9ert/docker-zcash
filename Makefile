build:
	time docker build -t ralphtheninja/zcash .

run:
	docker run -d --name zcash -v ~/.zcash:/root/.zcash ralphtheninja/zcash

start:
	docker start zcash

stop:
	docker stop zcash

rm:
	docker rm -f zcash

push:
	docker push ralphtheninja/zcash
