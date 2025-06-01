run:
	docker run -v ./:/src -p 8888:8888 -d -t pandas_excercise

build:
	docker build -t pandas_excercise .
