
The Dockerfile in this repository defines an image with Ruby, Node and others dependencies necessaries to be used in CI and Development environment.

It will be automatically built after every push to Github and will be available in Dockerhub at:
 quadion/ruby-node-dev

## Building

1. Log in to Docker with appropriate permissions
2. `docker build -t quadion/ruby-node-dev:ruby-3.2.2 -f Dockerfile-3.2.2 --platform linux/amd64 .`
3. `docker push quadion/ruby-node-dev:ruby-3.2.2`