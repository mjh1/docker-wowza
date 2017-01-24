1. Build and run the container:

	```
	mounts_dir="$HOME/srv/docker" wowza_license_key="XXXX" ./alive/build-alive-docker.sh
	```
2. Run `docker ps` to check for successful startup, if the status column says 'Exited...' then there was a problem with startup. You can also run `docker logs alive-wowza` to check progress.
3. When the container has started up completely the last line from `docker logs alive-wowza` should be something like:
	```
	2017-01-24 11:48:18,158 INFO success: wowzamgr entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
	```
4. You should now be able to access the web interface at `http://localhost:8088/` with admin/admin credentials.
5. And you should be able to stream to `rtmp://localhost:1935/live`.
