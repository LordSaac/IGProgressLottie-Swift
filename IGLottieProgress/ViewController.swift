//
//  ViewController.swift
//  IGLottieProgress
//
//  Created by Isaac Gutiérrez on 05/01/21.
//

import UIKit
import IGLottieProgress

class ViewController: UIViewController {


    let colorArray = [UIColor.red, UIColor.green, UIColor.blue]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func touch(_ sender: Any) {
       
        //Insert your json resource into project.
        IGProgress.config.urlLottieJson = "ball-spinner"
        
        //Begin your progress loading
        self.IGPStartLoading(config: IGProgress.config)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
        //End your progress loading in any func
        self.IGPFinishLoading()
           
        }
       
    }
    
    @IBAction func timerButton(_ sender: Any) {
        
        //Insert your json resource into project.
        IGProgress.config.urlLottieJson = "planter"
        // Set a time out for finish process.
        IGProgress.config.timer = 8
        //End your progress loading in any func
        self.IGPStartLoading(config: IGProgress.config) // <--- Start the progress
        
    }
    
    @IBAction func msmButton(_ sender: Any) {
        
        //Insert your json resource into project.
        IGProgress.config.urlLottieJson = "meditation"
        //Do your need add any message use this option
        IGProgress.config.message = "Please wait"
        
        //Begin your progress loading
        self.IGPStartLoading(config: IGProgress.config) 
      
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            //End your progress loading in any func
            self.IGPFinishLoading()
        }
       
        
    }

    @IBAction func backgroundColor(_ sender: Any) {
        
        let randomInt = Int.random(in: 0..<2)
        let alpharandom = CGFloat.random(in: 0.0..<1.0)
        
        //Insert your json resource into project.
        IGProgress.config.urlLottieJson = "cerebro"
        //Set color background for your windows.
        IGProgress.config.backgroundColor = self.colorArray[randomInt]
        //Set apha color for windows, this normal is 0.5
        IGProgress.config.alpha = alpharandom
        //If do you need scale the animation use content mode
        IGProgress.config.contentMode = .scaleToFill
        //Set new size width
        IGProgress.config.width = 350
        //Set new size hight
        IGProgress.config.hight = 350
        
        //Begin your progress loading
        self.IGPStartLoading(config: IGProgress.config)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            //End your progress loading in any func
            self.IGPFinishLoading()
        }
        
    }
    
    @IBAction func startButton(_ sender: Any) {
        self.openUrl(urlStr: "https://github.com/LordSaac/IGProgressLottie-Swift")
    }
    
    @IBAction func payPalButton(_ sender: Any) {
        self.openUrl(urlStr: "https://paypal.me/LordSaac?locale.x=es_XC")
    }
    
    private func openUrl(urlStr:String){
        
        let url = URL(string: urlStr)!
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
            //If you want handle the completion block than
            UIApplication.shared.open(url, options: [:], completionHandler: { (success) in
                 print("Open url : \(success)")
            })
        }
    }
    
}

