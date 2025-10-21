# 🐳 Docker Server-Client Project

A simple Docker project where we mount 2 seperate volumes to containers and move the data using HTTP request in a docker network.  

- [How it Works](#%EF%B8%8F-how-it-works)
- [Requirements](#-requirements)
- [Scripts](#-scripts)
- [How to check Volumes](#-checking-volumes)
- [Clean the environment](#clean-the-environmeant-to-remove--try-again)

---

## ⚙️ How it Works
- We make seperate volumes (`servervol` & `clientvol`)
- Set up a docker network called `mynet` that we can connect our containers
- `Server` container generates a file in `servervol` & checksum using python.  
- `Client` container connects via Docker network using `server`.  
- `Client` fetches the file using HTTP request and verifies the checksum. If checksums match  save to `clientvol`.  

---

## 🛠 Requirements
- Linux or WSL/Ubuntu  
- Docker installed  
- Basic terminal knowledge  

---

## 🚀 Scripts
Make sure you are in the Docker-Server-Client folder to execute the scripts

### Run server - param1: port  default=5000
```bash
./run_server.sh 5000   
```
### Run client - param1: port , param2: address  default= server
The address value can be changed in the run_server.sh script
```bash
./run_client.sh server 5000   
```

---

## 💽 Checking volumes
We can use busybox to mount the volumes to a temporary image
### Server
```bash
docker run --rm -it -v servervol:/data busybox sh
```

### Client
```bash
docker run --rm -it -v clientvol:/data busybox sh
```

---
### Check the file contents
The temperary image is mounted to `/data` so you can find the random.txt file we created and copied from there
```bash
cat /data/random.txt
```
Type exit to get out of the busybox temporary image

```bash
exit
```
---

## 🧹Clean the environmeant to remove / try again 
```bash
./cleanup.sh   
```


