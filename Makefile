run:
	docker ps | grep "pandas_excercise" | awk '{print $1}' | xargs -r docker rm -f ; \
	docker run -v ./:/src -p 8888:8888 -d -t pandas_excercise
build:
	docker build -t pandas_excercise .
stop:
	docker ps | grep "pandas_excercise" | awk '{print $1}' | xargs -r docker stop
