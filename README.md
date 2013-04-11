# Jenkins jobs on Panic StatusBoard
This simple script will grab jenkins jobs and put them in HTML table, one that you can use as data source for your StatusBoard.
By generating static html you will be able to use it even if your jenkins CI is only accesible from LAN network.
Just use Dropbox or any other service(Apache) to expose output html file.

It uses images from my server(http://merowing.info) for all status types, they will be skinned today to match StatusBoard graphics style.

# Installation
Install jenkins_api_client gem on your jenkins machine:
	
	gem install jenkins_api_client

make sure your script is executable by setting proper permission:

	chmod +x /path/to/script

Add a cron/launchd scheduled job on your machine to run this script periodically (here it will run every minute):

	* * * * * /path/to/script jenkins_ip_adress username password path_to_html


Make sure your **path_to_html** is pointing to space which will be accessible from your iPad Storyboard. After that just reference that file from your iPad StatusBoard and enjoy seeing your projects status.

References:

https://wiki.jenkins-ci.org/display/JENKINS/Standard+Security+Setup

http://www.cyberciti.biz/faq/how-do-i-add-jobs-to-cron-under-linux-or-unix-oses/

