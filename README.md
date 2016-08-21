# docker-zcash

Docker image for `zcash`. Currently for testnet only. Based on [marsmensch/docker-zcash](https://github.com/marsmensch/docker-zcash) with the following changes:

* uses `debian:latest` as base image
* exposes `/root/.zcash` as a volume
* only creates `/root/.zcash/zcash.conf` if it doesn't exist

#### Build

```bash
$ git clone https://github.com/ralphtheninja/docker-zcash && cd docker-zcash
$ docker build -t zcash .
```

#### Run the daemon

```bash
$ docker run -d --name zcash -v ~/.zcash:/root/.zcash zcash
```

#### Run commands

```bash
$ docker exec -it zcash zcash-cli getinfo
$ docker exec -it zcash zcash-cli zcrawkeygen
```

#### Stop/restart the daemon

```bash
$ docker stop zcash
$ docker start zcash
```

### Links

For more information check out the following links:

* [Public Alpha Guide](https://github.com/zcash/zcash/wiki/Public-Alpha-Guide)
* [Zcash Main Repository](https://github.com/zcash/zcash)
* [Zcash Forum](https://forum.z.cash/)
* [Zcash Slack Community](https://inviteme.z.cash/)
* [Mine Zcash](https://minezcash.com/)
