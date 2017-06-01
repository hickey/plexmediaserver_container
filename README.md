Plex Media Server Docker Container
==================================
I recently needed to rebuild my Plex media server and remembered that
a while back the Plex media server was released as a Docker container.
Well I was quite unimpressed when the Docker container would start up
but would not respond to port 32400. I searched Docker Hub for a 
container that may be usable. Most of what I found was not a full media
server or there were inadequetely documented containers. 

I knew I could build a much more solid container that is fully documented
and configurable. This is the first version of the media server running
on Debian and it is a bit static at the moment. The next version will
have quite a bit more configuration and will be better documented. It 
will also have a proper entrypoint script that will provide a fair amount
of automation.

To run the container, use the following command.

```
docker run -d -p 32400:32400 hickey/plexmediaserver:latest
```

One should also mount the media directory into the container. At the moment
the libraries need to be manually setup in the Plex settings. 
