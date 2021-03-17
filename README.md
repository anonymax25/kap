# kap
Kill At Port is a linux bash script to kill a running process at a given port
## Recommended Installation 

Get the script
``` bash 
wget https://raw.githubusercontent.com/anonymax25/kap/master/kap
```

Set the script to your path to use it from anywhere
```bash
    sudo mv kap /usr/local/bin/kap
```
## Examples
Get the PID of the process using port 3000: ```kap 3000```
Kill the process using port 3000: ```kap -k 3000```  
