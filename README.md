# Sonerezh with Docker

This is a fork of the the Git repository of the official Docker image for [Sonerezh](https://www.sonerezh.bzh). See the Hub page for more informations.

**WARNING**: the Docker image for Sonerezh is still under development. Some functionnality are broken like email notifications for example.

# How to build this image

Simply clone this repository and use `docker build`:

```sh
$ git clone --master https://github.com/maiko/sonerezh-docker.git
$ cd docker/nginx
$ docker build --tag sonerezh .
```

# Contributing
You are invited to contribute new features, fixes, or update, large or small; we are always thrilled to receive pull requests, and do our best to process them as fast as we can.
Before you start to code, we recommend discussing your plans through a [GitHub issue](https://github.com/Sonerezh/sonerezh/issues), especially for more ambitious contributions.
