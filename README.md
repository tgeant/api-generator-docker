# api-generator-docker

This dockerfile can generate a docker image which provides a stable environment to generate an api with [npm-generator](https://github.com/diegohaz/rest).

## Build your template:

Build your image:
`docker build -t api_template .`

## Create a new API:

To create a new api, run your image with the following commands:
`docker run --name api_builder -it -v $(pwd)/app:/app --rm api_template /bin/bash -c "sudo chown -R docker /app && yo rest"`

It will generate your API in "app" folder in your current directory.

Refer to the [npm-generator doc](https://github.com/diegohaz/rest) to more information about the command yo rest.

You may have some errors at the end like :
`/app/node_modules/mongodb-memory-server-core/node_modules/camelcase/index.js:17`
But it is fine, do not worry.


## Update an existing API:
To update an existing api, run your image with the following commands:
`docker run --name api_builder -it -v $(pwd)/app:/app --rm api_template /bin/bash -c "sudo chown -R docker /app && yo rest:api"`

## Run the API:

You have to start a mongodb instance before.
Then, update the mongodb url in the file ./app/src/config.js.

After that, you will have to restart the container to run the api:
`docker run -p 9000:9000 --name container_name -it -v $(pwd)/app:/app api_template`
