# 🐳 Docker Server-Client Project

A simple Docker project where we mount 2 seperate volumes to containers and move the data using HTTP request in a docker network.  

- [How it Works](#%EF%B8%8F-how-it-works)
- [Requirements]([#-requirements)
- [Scripts](#-scripts)
- [How to check Volumes](#-checking-volumes)

---

## ⚙️ How it Works
- We make seperate volumes (`servervol` & `clientvol`)
- Set up a docker network called `mynet`
- `Server` container generates a file in `servervol`.  
- `Client` container connects via Docker network using `server` as hostname.  
- `Client` fetches the file, verifies checksum, and stores it in `clientvol`.  

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
bash ./run_server.sh 5000   
```
### Run client - param1: port , param2: address  default= server
The address value can be changed in the run_server.sh script
```bash
bash ./run_client.sh server 5000   
```
### Clean your docker to remove / try again
```bash
bash ./cleanup.sh   
```
---

## 💽 Checking volumes
We can use busybox to mount the volumes to a temporary image
### Server
```bash
bash docker run --rm -it -v servervol:/data busybox sh
```

### Client
```bash
bash docker run --rm -it -v clientvol:/data busybox sh
```

### The temperary image is mounted to /data so you can find the random.txt file we created and copied from there 
```bash
bash cat /data/random.txt
```


