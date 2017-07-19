# openstack-ansible-wordpress
Project for automating the installation of WordPress on Ubuntu-16.04 using Compute Canada cloud resources

## Quick Start

1. First of all you will need the link to the Raw source file for the heat template used to construct your virtual machine. This is located on this github repository under the heat_templates directory as os-wordpress-template.yml (Alternatively, use: https://raw.githubusercontent.com/ubcarc/openstack-ansible-wordpress/master/heat_templates/os-wordpress-template.yml)
![Where to start on this GitHub](/docs/images/1.png)
*Where to start on this GitHub*
2. Click the Raw button as is show below:
![Raw Button Location](/docs/images/2.png)
*Raw Button Location*
3. This URL will be required shortly, so keep the page open or the previously given link handy.
![Raw Heat Template](/docs/images/3.png)
*Raw Heat Template*
4. Navigate to West/(East) Cloud at https://west.cloud.computecanada.ca (https://east.cloud.computecanada.ca) and enter your credentials to log in.
![West Cloud Login Screen](/docs/images/4.png)
*West Cloud Login Screen*
5. You will see your project overview page and must navigate through the dropdowns on the left side of the screen to **project>Orchestration>Stacks**
![Stacks](/docs/images/5.png)
*Stacks*
6. Click the **Launch Stack** button near the top of the page.
![Launch Stack](/docs/images/6.png)
*Launch Stack*
7. On the Select Template Window that appears, enter **URL** for **Template Source** and insert the URL for the raw Heat Template in the **URL** field. Leave **Environment Source** to be **File** and **Environment File** as unselected.
![Stack --> Select Template](/docs/images/7.png)
*Stack --> Select Template*
8. On the following Launch Stack Window, set:
  * Stack Name to whatever you'd like
  * Creation Timeout to default
  * Rollback on Failure checkbox to checked. This will remove your stack if an error occurs during creation.
  * Your West/East Cloud password in the password field
  * SSH/HTTP/HTTPS port fields to default
  * Your project's private network in the private network field
  * VLAN3337 for the public network on West Cloud or IDONTKNOWWHAT on East Cloud
  * A key pair of your choice for the key pair. If you are unclear on this step then refer to [Compute Canada's Documentation](https://docs.computecanada.ca/wiki/Cloud_Quick_Start) for SSH keys.
  * Any name you want for the root volume
  * Whatever size you need your storage to be (in GB) for size of the root volume.
  * Ubuntu-16.04-Xenial for image used to create the root volume
  * Whatever name you want for the name of the instance
  * The flavor to fit your needs for the hardware type. Refer to [Compute Canada's Documentation](https://docs.computecanada.ca/wiki/Virtual_machine_flavors) for details on what these values mean.
  * True for both Software Package Index Updates and Upgrades to apply software updates on first boot.
  * The default repository for Deployment Repository
![Stack --> Launch Stack](/docs/images/8.png)
*Stack --> Launch Stack*
9. Now you must wait for the stack to launch and you can watch the **project>Orchestration>Stacks** page tell you that the stack is creating, then the **project>Compute>Volumes** page for the volume to download, and then the **project>Compute>Instances** page for the Instance to spawn.
![Stack --> Create in Progress](/docs/images/9.png)
*Stack --> Create in Progress*
![Volumes --> Downloading](/docs/images/9_2.png)
*Volumes --> Downloading*
![Instances --> Spawning](/docs/images/9_3.png)
*Instances --> Spawning*
10. On the instances page click the name of your newly created instance and navigate to the Log tab. You will need to give your VM several minutes at this point to perform initial setup tasks and so now is a good time to go grab a coffee, attend the restroom or run a half-marathon. You'll know it's done when you can refresh the Log, by either refreshing the page or clicking the **go** button above the log, and see: **"[  OK  ] Reached target Cloud-init target."**
![Log page indicating completion](/docs/images/10.png)
*Log page indicating completion*
11. Now you're ready to login to the machine to carry out the final configuration program. To do this you will need to use an SSH connection corresponding to the key you selected earlier on the Launch Stack page.
12. Open your terminal of choice. This is likely called "Terminal" if you are on either a Linux or Macintosh PC or "MobaXTerm" (which may need to be downloaded) if you are on a Windows PC.
13. Return to the **project>Compute>Instances** location on your West/East Cloud page and use the "Floating IP" value associated with your fresh instance to issue the command: **"ssh ubuntu@[YOUR_FLOATING_IP]"**
![Successfully logged into ssh](/docs/images/13.png)
*Successfully logged into ssh*
14. You should now be logged in to your instance. From here issue the commands (IN ORDER):
  * **"cd deploy"**
  * **"./setup_everything.sh"**
![Successfully completed script](/docs/images/14.png)
*Successfully completed script*
15. Wait for the script to finish. If your setup went properly then you should not see any messages resembling errors and when the script finishes you should be able to access your WordPress site by entering **"[YOUR_FLOATING_IP]/wordpress"** into your browser to begin the web-based setup WordPress thinks it's famous for.
![Successful Web-page redirect to WordPress login page](/docs/images/15.png)
*Successful Web-page redirect to WordPress login page*

**\* Note that THE FIRST PERSON to access the site will be able to carry out the web-based setup so it is highly recommended that you do not leave this step for later** 
