FROM alpine:3.8

ARG KUBECTL_VERSION="v1.13.2"
ENV KUBECTL_VERSION=$KUBECTL_VERSION

RUN apk add --update ca-certificates && apk add --update -t deps curl \
    && curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl \
    && apk del --purge deps \
    && rm /var/cache/apk/*

ENTRYPOINT ["/usr/local/bin/kubectl"]
CMD ["help"]