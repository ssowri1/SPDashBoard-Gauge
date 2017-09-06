//
//  ViewController.swift
//  GaugeView
//
//  Created by Sowrirajan Sugumaran on 8/21/17.
//  Copyright © 2017 Sowrirajan Sugumaran. All rights reserved.
//

import UIKit

// Screen Height
public let screenH = UIScreen.main.bounds.size.height

class ViewController: UIViewController {
    let vwGauge = Gauge.instanceFromNib()

    override func viewDidLoad() {
        super.viewDidLoad()

        // To initialise and allocate the
        self.view.addSubview(vwGauge)
    }
    
    override func viewWillLayoutSubviews() {
        if screenH == 568 {
            vwGauge.frame = CGRect(x:0, y:150, width:self.view.frame.size.width, height:200)
        }else{
            vwGauge.frame = CGRect(x:0, y:200, width:self.view.frame.size.width, height:300)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // Update your Vehile SPEED, FUAL LEVEL, RPM values
    @IBAction func actOscillator(_ sender: UISlider) {
        let value = Float(sender.value)
        if sender.tag == 11 {
            NotificationCenter.default.post(name: ViewController.updateSpeedNotifier, object: value)
        }else if sender.tag == 12{
            NotificationCenter.default.post(name: ViewController.updateRPMNotifier, object: value)
        }else if sender.tag == 13{
            NotificationCenter.default.post(name: ViewController.updateFualNotifier, object: value)
        }
    }
}

// MARK: Define Notifiers
extension ViewController {
    static let updateSpeedNotifier = Notification.Name("updateSpeedNotifier")
    static let updateFualNotifier = Notification.Name("updateFualNotifier")
    static let updateRPMNotifier = Notification.Name("updateRPMNotifier")
}

