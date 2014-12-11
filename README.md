#BikeBinder

**BikeBike Docker Container Image for BikeBinder**

BikeBinder is [Free Rides](http://freeridepgh.org/) Inventory System [application](https://github.com/FreeRidePGH/BikeBinder).

##Pull the repository

```
docker pull bikebike/bikebinder
```


##Run the docker container

Publish the container's port to the host:

>format: ip:hostPort:containerPort | ip::containerPort | hostPort:containerPort


```
docker run -d -p 3000:3000 --name="freehub" bikebike/bikebinder
```

##Password

Password is *password* for **staff@freeridepgh.org** and **volunteer@freeridepgh.org**.


##How to test/develop inside the running container process 

This method uses [nsenter](http://jpetazzo.github.io/2014/06/23/docker-ssh-considered-evil/).  Check out [jpetazzo/nsenter](https://github.com/jpetazzo/nsenter) on GitHub. 

```
sudo PID=$(docker inspect --format {{.State.Pid}} <container_name_or_ID>)
sudo nsenter --target $PID --mount --uts --ipc --net --pid
