# thomass/sftp

OpenSSH Server with SFTP configuration

## usage

Assuming you would serve the Docker named volume `yourvolume`, you could provide it...

With password authentication

```
docker run -d --name sftp -p 10022:22 \
  -v yourvolume:/mount/data \
  --env "USER_PASSWORD=notthatlush" thomass/sftp
```

With just public key authentication

```
docker run -d --name sftp -p 10022:22 \
  -v yourvolume:/mount/data \
  -v /host/path/to/authorized_keys:/mount/.ssh/authorized_keys thomass/sftp
```

## accessing the server

As with the configuration above you can use following URL in your file browser:

```
sftp://ftp@dockerserver:10022
```

Mention that _dockerserver_ is your (arbitrary) host running Docker, but `sshuser` is the login user provided by this image.

## Versioning

The Docker Images are versioned as follows:

`<OpenSSH-Version>-<Image Version>`
