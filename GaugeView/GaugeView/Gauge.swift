//
//  Gauge.swift
//  GaugeView
//
//  Created by Sowrirajan Sugumaran on 8/21/17.
//  Copyright © 2017 Sowrirajan Sugumaran. All rights reserved.
//

import UIKit

class Gauge: UIView {
    var bannerView: UIImageView!
    var value:Float!
    
    @IBOutlet weak var imgNeedleFual: UIImageView!
    @IBOutlet weak var imgNeedleSpeed: UIImageView!
    @IBOutlet weak var imgNeedleRPM: UIImageView!

    override func awakeFromNib() {

        // Initiate the appearance angle
        self.rotateSpeedoMeterNeedle(speed: Float(127))
        self.rotateFualMeterNeedle(fual: Float(25))
        self.rotateRPMMeterNeedle(rpm: Float(135))

        // Initiate the appearance angle animation
        UIView.animate(withDuration: 0.7, animations: {
            self.rotateSpeedoMeterNeedle(speed: Float(0))
        }, completion:{(finished: Bool) in
            UIView.animate(withDuration: 0.8, animations: {
                self.rotateSpeedoMeterNeedle(speed: Float(-127))
                self.rotateFualMeterNeedle(fual: Float(150))
                self.rotateRPMMeterNeedle(rpm: Float(-145))
            })
        })

        // add observer for meters notifications
        NotificationCenter.default.addObserver(self, selector: #selector(Gauge.updatedSpeedNotifier), name: ViewController.updateSpeedNotifier, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(Gauge.updateRPMNotifier), name: ViewController.updateRPMNotifier, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(Gauge.updateFualNotifier), name: ViewController.updateFualNotifier, object: nil)
    }
    
    
    // MARK: SPEED
    func updatedSpeedNotifier(notification:NSNotification){
        value = (notification.object)! as! Float
        //        let convertedSpeed = Float(String(format: "%.1f", value))!
        // Set the angle limit for needle -130 to 130
        rotateSpeedoMeterNeedle(speed: Float(value))
    }
    
    // Rotate the SPEED needle angle with animation appropriately
    func rotateSpeedoMeterNeedle(speed: Float) {
        UIView.animate(withDuration: 0.5, animations: {
            self.imgNeedleSpeed.transform = CGAffineTransform(rotationAngle: CGFloat(((.pi)/180) * speed))
        })
    }

    
    // MARK: RPM
    func updateRPMNotifier(notification:NSNotification){
        value = (notification.object)! as! Float
        // Set the angle limit for needle -130 to 130
        rotateRPMMeterNeedle(rpm: Float(value))
    }
    
    // Rotate the RPM needle angle with animation appropriately
    func rotateRPMMeterNeedle(rpm: Float) {
        UIView.animate(withDuration: 0.5, animations: {
            self.imgNeedleRPM.transform = CGAffineTransform(rotationAngle: CGFloat(((.pi)/180) * rpm))
        })
    }
    
    
    // MARK: FUAL
    func updateFualNotifier(notification:NSNotification){
        value = (notification.object)! as! Float
        let convertedSpeed = Float(String(format: "%.1f", value))!
        var FualLevel:CGFloat

        // Set the angle limit for needle 25 to 150
        switch convertedSpeed {
        case 0.0: FualLevel = 150
        case 0.1: FualLevel = 135
        case 0.2: FualLevel = 100
        case 0.3: FualLevel = 95
        case 0.4: FualLevel = 85
        case 0.5: FualLevel = 75
        case 0.6: FualLevel = 65
        case 0.7: FualLevel = 55
        case 0.8: FualLevel = 45
        case 0.9: FualLevel = 35
        case 1.0: FualLevel = 25
        default : FualLevel = 25
        }
        rotateFualMeterNeedle(fual: Float(FualLevel))
    }
    
    
    // Rotate the FUAL needle angle with animation appropriately
    func rotateFualMeterNeedle(fual: Float) {
        UIView.animate(withDuration: 0.5, animations: {
            self.imgNeedleFual.transform = CGAffineTransform(rotationAngle: CGFloat(((.pi)/180) * fual))
        })
    }

    // To make the link between xib of the view and Swift class
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "Gauge", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
}

