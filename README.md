# api-generator-docker

This dockerfile can generate a docker image which provides a stable environment to generate an api with [npm-generator](https://github.com/diegohaz/rest).

## Docker commands:

Build your image:
`docker build -t api_template .`

I recommend to use this image as a template. To create a new api, run your image:
`docker run -p 9000:9000 --name container_name -it -v $(pwd)/app:/app api_template`

Then, use the [npm-generator doc](https://github.com/diegohaz/rest) to create your api.

You may restart the container to launch the node server.

Commit your changes to a new docker image:
`docker commit container_name api_name`
