# thomass/sftp

OpenSSH Server with SFTP configuration

## usage

Assuming you would serve the Docker named volume `yourvolume`, you could provide it...

With password authentication

```
docker run -d --name sftp -v yourvolume:/mount/data -p 10022:22 \
  --env "USER_PASSWORD=notthatlush" thomass/sftp
```

With just public key authentication

```
docker run -d --name sftp -v yourvolume:/mount/data -p 10022:22 \
  -v /host/path/to/authorized_keys:/mount/.ssh/authorized_keys thomass/sftp
```

## Versioning

The Docker Images are versioned as follows:

`<OpenSSH-Version>-<Image Version>`
