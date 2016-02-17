# pydash-docker
build pydash-docker image

    $ docker build -t pydash-docker .

run pydash-docker

    $ docker run -it --privileged=true --net=host --pid=host --ipc=host -p 8000:80 pydash-docker
