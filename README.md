### DashBoard-Gaugh

DashBoard-Gaugh is a lightweight and easy-to-use source for showing Vechiles or anything else running status in Real time.

![Screenshot](https://github.com/ssowri1/DashBoard-Gaugh/blob/master/ScreenShot.gif?raw=true)

**INSTALLATION** 

- Drag and drop the Gaugh folder to your project and initialize it.
- then set the frame size for your appropriate devices. 
- let's give the Notification name for every notifier using extention.
- You're done. Go Ahead :-)

**Assign the value for Speedometer**

     NotificationCenter.default.post(name: ViewController.updateSpeedNotifier, object: value)   
     // ex: The value between -127 to 127
            
**Assign the value for RPM**

     NotificationCenter.default.post(name: ViewController.updateRPMNotifier, object: value)
     // ex: The value between -145 to 135
            
**Assign the value for Fual**

     NotificationCenter.default.post(name: ViewController.updateFualNotifier, object: value)
     // ex: The value between 0 to 1

## Authors

***Ssowri1** - *Initial work* - [PurpleBooth](https://github.com/ssowri1)

## License

This project is licensed under the Apache License 2.0 - see the [LICENSE](LICENSE) file for details

### Support or Contact

Having trouble with Pages? Kindly [contact support](https://github.com/contact) and we’ll help you sort it out.
