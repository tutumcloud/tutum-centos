tutum-centos
============

[![Deploy to Tutum](https://s.tutum.co/deploy-to-tutum.svg)](https://dashboard.tutum.co/stack/deploy/)

Simple CentOS docker image with SSH access

Usage
-----

To create the image `tutum/centos` with one tag per CentOS release, execute the following commands on the tutum-ubuntu repository folder:

	docker build -t tutum/centos:latest .
	docker build -t tutum/centos:centos5 centos5
	docker build -t tutum/centos:centos6 centos6
	docker build -t tutum/centos:centos7 centos7


Running tutum/centos
--------------------

Run a container from the image you created earlier binding it to port 2222 in all interfaces:

	sudo docker run -d -p 0.0.0.0:2222:22 tutum/centos

The first time that you run your container, a random password will be generated
for user `root`. To get the password, check the logs of the container by running:

	docker logs <CONTAINER_ID>

You will see an output like the following:

	========================================================================
	You can now connect to this CentOS container via SSH using:

	    ssh -p <port> root@<host>
	and enter the root password 'U0iSGVUCr7W3' when prompted

	Please remember to change the above password as soon as possible!
	========================================================================

In this case, `U0iSGVUCr7W3` is the password allocated to the `root` user.

Done!


Setting a specific password for the root account
------------------------------------------------

If you want to use a preset password instead of a random generated one, you can
set the environment variable `ROOT_PASS` to your specific password when running the container:

	docker run -d -p 0.0.0.0:2222:22 -e ROOT_PASS="mypass" tutum/centos


Adding SSH authorized keys
--------------------------

If you want to use your SSH key to login, you can use the `AUTHORIZED_KEYS` environment variable. You can add more than one public key separating them by `,`:

    docker run -d -p 2222:22 -e AUTHORIZED_KEYS="`cat ~/.ssh/id_rsa.pub`" tutum/centos
