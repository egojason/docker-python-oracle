# docker-python-oracle
Inspired by [valudio/docker-python-flask-oracle](https://github.com/valudio/docker-python-flask-oracle)  
This docker image serves as an environment to execute python scripts with oracle database connection.

## build
```bash
docker build -t web .
```

## run
```bash
docker run -d -p 80:5000 --name web -v <host-absolute-path>:/opt/data/api web
```
## Notes for users using **Docker Machine**
`host-absolute-path`: directory on **Docker Engine**'s host

### [Mount a host directory as a data volume](https://docs.docker.com/engine/tutorials/dockervolumes/#mount-a-host-directory-as-a-data-volume)
>If you are using Docker Machine on Mac or Windows, your Docker Engine daemon has only limited access to your macOS or Windows filesystem. Docker Machine tries to auto-share your **/Users** (macOS) or **C:\Users** (Windows) directory.

On macOS:
```bash
docker run -v /Users/<path>:/<container path> ...
```
On Windows:
```bash
docker run -v c:\<path>:c:\<container path>
```
>In the case of VirtualBox you need to make the host folder available as a **shared folder** in VirtualBox. Then, you can mount it using the Docker -v flag.

### [Forward host port to Docker Machine](https://stackoverflow.com/questions/36286305/how-do-i-forward-a-docker-machine-port-to-my-host-port-on-osx)
>At this time Docker Machine is a virtual machine running under VirtualBox in your machine, so to expose your application port you need to map your virtual machine port to your host port.

```bash
docker-machine stop default
```

>Option 1 - Use the VirtualBox interface
- Open VirtualBox Manager
- Select your Docker Machine VirtualBox image (e.g.: default)
- Open Settings -> Network -> Advanced -> Port Forward
- Add your app name, the desired host port (e.g.: 80) and your Guest port (e.g.: 80)

>Option 2 - Use the VirtualBox command line
```
VBoxManage modifyvm "default" --natpf1 "web,tcp,,80,,80"
```

```bash
docker-machine start default
```