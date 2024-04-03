# Quick start
```bash
git clone https://github.com/hkjang/crossplane-api.git
pip install -r requirements.txt
./start.sh
```

# Run 
`curl http://127.0.0.1:3020/nginx-config`

# Example Response
```json

{
"config": [
{
"errors": [],
"file": "/home/server/nginxstack-1.16.0-0/nginx/conf/nginx.conf",
"parsed": [
...

{
"args": [],
"block": [
{
"args": [
"1448"
],
"directive": "listen",
"line": 97
},
{
"args": [
"ml.cakeplabs.com"
],
"directive": "server_name",
"line": 98
},
{
"args": [
"/"
],
"block": [
{
"args": [
"^/(/.*)$",
"$1",
"break"
],
"directive": "rewrite",
"line": 100
},
{
"args": [
"http://127.0.0.1:1447"
],
"directive": "proxy_pass",
"line": 101
},
{
"args": [
"X-Real-IP",
"$remote_addr"
],
"directive": "proxy_set_header",
"line": 102
}
],
"directive": "location",
"line": 99
}
],
"directive": "server",
"line": 96
},
...

```


