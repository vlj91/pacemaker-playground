```bash
pcs cluster auth -u hacluster controller1.${domain} controller2.${domain}
controller3.${domain} --force

pcs cluster setup --name ${domain} controller1.${domain} controller2.${domain}
controller3.${domain} --force

pcs cluster enable --all
pcs cluster start --all
```
