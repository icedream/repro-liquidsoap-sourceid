FROM savonet/liquidsoap-ci-build:rolling-release-v2.2.x@sha256:4cee43e436f6dff60e77273a5608686991f0703d2763fae1c6131e7fdb0886ad

WORKDIR /liq/
COPY . .

EXPOSE 8080
STOPSIGNAL SIGTERM
ENTRYPOINT [ "liquidsoap" ]
CMD ["./stream.liq"]
