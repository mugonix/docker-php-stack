build/version:  build/7.4-nginx
	date > build/version

loggedin:
ifneq ($(grep -q "\"auth\"" ~/.docker/config.json),)
	@echo Please Login to Docker
	@exit 1
endif
ifneq ($(docker-machine active),)
	docker-machine start
endif

build/7.4-nginx: 7.4/nginx
	@make loggedin
	docker image build -t dgoring/php-stack:7.4-nginx ./7.4/nginx
	docker push dgoring/php-stack:7.4-nginx
	@date > ./build/7.4-nginx

