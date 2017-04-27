# nextjs-hello-world

This is the simplest seed code for next.js applications with Docker workflow, CI/CD system.


## Getting started

- Follow: https://github.com/acme101/dev-setup/blob/master/README.md

- Check out this repo into the `acme-dev/workspace` directory

## Dev Mode

To run dev mode on the current source code.

```
$ vagrant ssh
$ ws
$ cd nextjs-hello-world
$ docker-compose up -d dev && docker-compose logs -f dev
```

Open dev.nextjs.acme.dev (http + https modes) to check it out.

## Prod Mode

To run prod mode on the current source code.

```
$ docker-compose run --rm dev yarn run build && \
  docker-compose -f docker-compose.yml -f docker-compose.prod.yml build prod && \
  docker-compose -f docker-compose.yml -f docker-compose.prod.yml up -d prod
```

We usually scale at least 2 or more containers, so please scale it on local dev too to make sure scaling should work:

```
$ docker-compose -f docker-compose.yml -f docker-compose.prod.yml scale prod=2
```

Open nextjs.acme.dev (http + https modes) to check it out.


Don't forget to remove the container after checking out for cleaning up:

```
$ docker-compose -f docker-compose.yml -f docker-compose.prod.yml stop prod && \
  docker-compose -f docker-compose.yml -f docker-compose.prod.yml rm -f prod
```

## Prod Review Mode

To review prod mode from different built Docker image.

For example, I need to review the `registry.gitlab.com/hoatle/nextjs-hello-world:features-1-something` Docker image
from @hoatle.

```
$ export DOCKER_IMAGE_REVIEW=registry.gitlab.com/hoatle/nextjs-hello-world:features-1-something && \
docker-compose -f docker-compose.yml -f docker-compose.review.yml pull review && \
docker-compose -f docker-compose.yml -f docker-compose.review.yml up -d review
```

We usually scale at least 2 or more containers, so please scale it on local dev too to make sure scaling should work:

```
$ docker-compose -f docker-compose.yml -f docker-compose.review.yml scale review=2
```


Open review.nextjs.acme.dev (http + https modes) to check it out.


Don't forget to remove the containers after checking out for cleaning up:

```
$ docker-compose -f docker-compose.yml -f docker-compose.review.yml stop review && \
  docker-compose -f docker-compose.yml -f docker-compose.review.yml rm -f review
```

## Learn more

- https://github.com/zeit/next.js
