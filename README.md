1. Build and run the container:

	```
	mounts_dir="$HOME/srv/docker" wowza_license_key="XXXX" ./alive/build-alive-docker.sh
	```
2. Run `docker ps` to check for successful startup, if the status column says 'Exited...' then there was a problem with startup. You can also run `docker logs alive-wowza` to check progress.
3. When the container has started up completely the last line from `docker logs alive-wowza` should be something like:
	```
	2017-01-24 11:48:18,158 INFO success: wowzamgr entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
	```

After following these steps you should be able to:
- Access the web interface at `http://localhost:8088/` with admin/admin credentials.
- Stream to `rtmp://localhost:1935/live`.
- Attach a remote Java debugger from an IDE to localhost:1044.

Next steps:
- You'll probably want to create/modify the following files to set up the wowza job (get another member of the team to send you them, this will be automated later)
	```
	~/srv/docker/alive-wowza/data/conf/wowza/live/PushPublishMap.txt
	~/srv/docker/alive-wowza/data/conf/wowza/live/Application.xml
	~/srv/docker/alive-wowza/data/conf/wowza/PushPublishProfilesCustom.xml
	```
- Max H has made an ant script which builds the alive-wowza-modules project, copies the jar to the docker location and restarts the container (making development relatively seamless), this hasn't been committed to git because we should be moving to maven soon.
