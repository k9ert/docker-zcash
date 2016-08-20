# docker-zcash

Docker image for `zcash`. Currently for testnet only. Based on https://github.com/marsmensch/docker-zcash with the following changes:

* uses `debian:latest` as base image
* creates rpc password based on `/udev/random`

### Build and Run

* Clone this repo
* `make build`
* `make run`

### Run Interactively

Start the container:

```bash
$ docker run -it --entrypoint=/bin/bash docker-zcash
```

Run the zcashd daemon:

```bash
root@09b7b2c0cf0f:/# zcashd -daemon
```

Check the current state:

```bash
root@09b7b2c0cf0f:/# zcash-cli getinfo
{
    "version" : 110200,
    "protocolversion" : 170002,
    "walletversion" : 60000,
    "balance" : 0.00000000,
    "blocks" : 0,
    "timeoffset" : 0,
    "connections" : 0,
    "proxy" : "",
    "difficulty" : 1.00000000,
    "testnet" : true,
    "keypoololdest" : 1471726281,
    "keypoolsize" : 101,
    "paytxfee" : 0.00000000,
    "relayfee" : 0.00005000,
    "errors" : "This is a pre-release test build - use at your own risk - do not use for mining or merchant applications"
}
```

Generate an address:

```bash
root@09b7b2c0cf0f:/# zcash-cli zcrawkeygen
{
    "zcaddress" : "tnt6Ss7SLEXuggXxwJpygDMiGeJNY2WHGAPM1pUMig5xQ5vCXncrp8xeQuumeBWYJtWTamAx75LnEGrCUjQU3VnG9H9KwsB",
    "zcsecretkey" : "TKWVj9nQiRA3oLk7QS4L9Z2jh4TzhBFaenK11bafEF8tXRdggQBc",
    "zcviewingkey" : "58a74c9fcf3c884fdcb31e174447a70b3e54329a9cfacf6a3d9ca92e5129b564"
}
```

### Links

For more information check out the following links:

* [Public Alpha Guide](https://github.com/zcash/zcash/wiki/Public-Alpha-Guide)
* [Zcash Main Repository](https://github.com/zcash/zcash)
* [Zcash Forum](https://forum.z.cash/)
* [Zcash Slack Community](https://inviteme.z.cash/)
* [Mine Zcash](https://minezcash.com/)
