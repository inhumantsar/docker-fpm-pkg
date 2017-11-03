# inhumantsar/fpm-pkg

Simple image with [jordansissel/fpm](https://github.com/jordansissel/fpm) pre-installed. Meant mainly as a base for package-building images. Ubuntu (Xenial+), CentOS 7 and Alpine-based versions available.

## Docker Usage (Recommended)

### `Dockerfile`
```dockerfile
FROM inhumantsar/fpm-pkg:centos
MAINTAINER John Doe <moo@moo.moo>

ENV NAME=someapp
ENV VERSION=master
ENV WORKDIR=/workspace
ENV TARGET=rpm
ENV ARCH=noarch
ENV VENDOR="Doe Inc."
ENV MAINTAINER="John Doe"
ENV DESCRIPTION="Does the thing, does it well."
ENV URL="https://moo.moo/someapp"
ENV LICENSE=GPLv3
ENV DEPENDS="pkg1 pkg2 pkg3"

ADD pkg.sh /pkg.sh

CMD [ "/pkg.sh" ]
```

### `pkg.sh`
```bash
# ... pre-packaging steps...

fpm -s dir \
  --force \
  --chdir $WORKDIR \
  --output-type $TARGET \
  --name $NAME \
  --version $VERSION \
  --prefix /usr \
  --package "${WORKDIR}/$NAME-${VERSION}.$ARCH.$TARGET" \
  --license GPLv3 \
  $(for i in ${DEPENDS}; do echo "--depends $i "; done) \
  --vendor "$VENDOR" \
  --maintainer "$MAINTAINER" \
  --url $URL \
  --description "$DESCRIPTION" \
  . || exit 1

# ... post packaging steps...
```

## Command-line Usage

    docker run --rm -it -v $(pwd):/workspace inhumantsar/fpm-pkg fpm --help
