//
//  AlertLottieViewController.swift
//  IGLottieProgress
//
//  Created by Isaac Gutiérrez on 05/02/21.
//

import UIKit
import Lottie

class AlertLottieViewController: UIViewController {

    private var animationView: AnimationView?
    public var config: IGParams?
    
    @IBOutlet weak var content: UIView!
    @IBOutlet weak var sms: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initAlert()
        self.setTimer()
    }
    
    
    private func initAlert(){
        
        // Do any additional setup after loading the view.
        guard let myFile = Bundle.self.main.path(forResource: self.config?.urlLottieJson, ofType: "json") else {
        print("lottie json not found!")
        return
    }

      self.sms.text = config?.message
      self.sms.font = self.sms.font.withSize(self.config!.sizeTextMessage)
      self.sms.textColor = self.config?.fontColorMessage
      
      self.content.bounds.size.height =  CGFloat(self.config!.hight)
      self.content.bounds.size.width =  CGFloat(self.config!.width)
        
      animationView = AnimationView()
      // 2. Start AnimationView with animation name (without extension)
      animationView?.animation = Animation.filepath(myFile)
      animationView!.frame = self.content.bounds
      animationView?.backgroundColor = .clear
      // 3. Set animation content mode
        animationView!.contentMode = .scaleAspectFit
      // 4. Set animation loop mode
      animationView!.loopMode = .loop
      // 5. Adjust animation speed
      animationView!.animationSpeed = 0.5
      self.content.addSubview(animationView!)
      // 6. Play animation
      animationView!.play()
    }
    
    private func setTimer(){
        
        if( self.config!.timer  > 0){
            DispatchQueue.main.asyncAfter(deadline: .now() + DispatchTimeInterval.seconds(self.config!.timer)) {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }

}
