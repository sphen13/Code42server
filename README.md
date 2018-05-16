## Code42 ProServer (Docker)

What is this? Well... its a down and dirty docker container that provides Code42 CrashPlan PROe services.

### Tags

- `6.7.2, latest`
- `6.5.2`
- `6.0.5`
- `5.4.5`
- `5.3.2`

### Example Usage

```
docker run -d --name code42 \
  -p 4280:4280 \
  -p 4282:4282 \
  -p 4285:4285 \
  -p 4287:4287 \
  -e TIMEZONE='America/New_York' \
  -v /private/var/docker/code42/db:/opt/proserver/db \
  -v /private/var/docker/code42/proserver:/var/opt/proserver \
  -v /private/var/docker/code42/log:/var/log/proserver \
  sphen/code42server
```

### Environment Variables

Variable | Description
--- | ---
TIMEZONE | Local Timezone [Reference](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones)

### Mapped Volumes

Path | Description
--- | ---
/opt/proserver/db | H2 database
/var/log/proserver | Logs
/var/opt/proserver | Everything else including archives

### Ports

You will need to map the follwing ports at the very least for full functionality:

[4280, 4282, 4285, 4287][1]

[1]: https://support.code42.com/Administrator/6/Planning_and_installing/Code42_platform_hardware_and_software_requirements#Inbound_ports
