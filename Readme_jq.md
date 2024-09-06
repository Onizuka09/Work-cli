# Intro 
`jq` is a lightweight CLI tool in linux that let's you manipulates `json` files
## installation 
- deb 
```bash
sudo apt install jq
```

## Usage 
```bash 
jq <actions> <file> 
```

- Pertty print 
```bash
jq `.` test.json 
```
- get all keys with 'name'

```bash
jq `.[].name` test.json 
```
- filtering data 
```bash 
jq '.[] | select(.color == "green") 'test.json
```
