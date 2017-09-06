### DashBoard_Gaugh

DashBoard_Gaugh is a lightweight and easy-to-use source for showing Vechiles or anything else running status in Real time.

**USAGE** 

- Drag and drop the Gaugh folder to your project and initialize it.
- then set the frame size for your appropriate devices. and let's give the Notification name for every notifier using extention.

**Assign the value for Speedometer**

     NotificationCenter.default.post(name: ViewController.updateSpeedNotifier, object: value)   // -135 to 145
            
**Assign the value for RPM**

     NotificationCenter.default.post(name: ViewController.updateRPMNotifier, object: value)
            
**Assign the value for Fual**

     NotificationCenter.default.post(name: ViewController.updateFualNotifier, object: value)

![Screenshot](https://github.com/ssowri1/DashBoard_Gaugh/blob/master/ScreenShot.gif?raw=true)


## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

### Support or Contact

Having trouble with Pages? Kindly [contact support](https://github.com/contact) and we’ll help you sort it out.
