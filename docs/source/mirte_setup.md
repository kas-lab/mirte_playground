# Setting up Mirte
 
## Connecting to the robot with ethernet
If you connect it to your laptop, you'll need to change one setting to have your laptop give your robot an IP address. Go to settings, Network, Wired settings, IPv4, click on "Shared to other computers". See the attachment for the button. You might need to unplug and plug it back in after changing the settings.
  
![Ethernet Settings Screenshot](images/ethernet_settings.png)


The robot will probably get an IP in the 10.42.0.xx range. This should be visible on the screen or you can use AngryIpScanner to find it. The laptop with the ethernet cable can use that IP for SSH and ROS.
 
Don't forget to change the setting back to Automatic when you want to connect to a normal network.
 
## Logging in
When trying to ssh into the robot, use ssh mirte@your_mirtes_ip_address. This requires the 'standard' password mirte_mirte the first time you do this, or your own password the next time. Run ssh-copy-id mirte@ip to never again having to enter the password again.
 
You can use the VSCode remote ssh plugin to edit the files and open multiple terminals.