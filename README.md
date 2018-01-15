# Docker XMRig
This Dockerfile build an image for [xmrig](https://github.com/xmrig/xmrig), based on Alpine Linux.

Current version: v2.4.4

This is a donate-free version of xmrig, you can consider making a one off donation to xmrig author's wallet:

```
XMR: 48edfHu7V9Z84YzzMa6fUueoELZ9ZRXq9VetWzYGzKt52XU5xvqgzYnDK9URnRoJMk1j8nLwEVsaSWJ4fhdUyZijBGUicoD
BTC: 1P7ujsXeX7GxQwHNnJsRMgAdNkFZmNVqJT
```


## Usage

### Basic example
```
docker run acrisliu/xmrig -o POOL:PORT -u USER -p x -k
```

### Options
```
  -a, --algo=ALGO       cryptonight (default) or cryptonight-lite
  -o, --url=URL         URL of mining server
  -O, --userpass=U:P    username:password pair for mining server
  -u, --user=USERNAME   username for mining server
  -p, --pass=PASSWORD   password for mining server
  -t, --threads=N       number of miner threads
  -v, --av=N            algorithm variation, 0 auto select
  -k, --keepalive       send keepalived for prevent timeout (need pool support)
  -r, --retries=N       number of times to retry before switch to backup server (default: 5)
  -R, --retry-pause=N   time to pause between retries (default: 5)
      --cpu-affinity    set process affinity to CPU core(s), mask 0x3 for cores 0 and 1
      --cpu-priority    set process priority (0 idle, 2 normal to 5 highest)
      --no-huge-pages   disable huge pages support
      --no-color        disable colored output
      --donate-level=N  donate level, default 0% (0 minutes in 100 minutes)
      --user-agent      set custom user-agent string for pool
  -B, --background      run the miner in the background
  -c, --config=FILE     load a JSON-format configuration file
  -l, --log-file=FILE   log all output to a file
      --max-cpu-usage=N maximum CPU usage for automatic threads mode (default 75)
      --safe            safe adjust threads and av settings for current CPU
      --nicehash        enable nicehash support
      --print-time=N    print hashrate report every N seconds
  -h, --help            display this help and exit
  -V, --version         output version information and exit
```
