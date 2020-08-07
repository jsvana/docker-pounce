# Dockerfile for the pounce IRC bouncer

`pounce` can be found [here](https://git.causal.agency/pounce/about/).

## Requirements

This image expects pre-generated Let's Encrypt certificates and will not function without them.

I recommend using `certbot`, as does `pounce` itself.

## Volumes

`/etc/letsencrypt`

The directory containing your pre-generated Let's Encrypt certificates.

`/config`

Your `pounce` config file.

Example config:

```
host = freenode.net
join = ##linux
nick = my_cool_nick
```
