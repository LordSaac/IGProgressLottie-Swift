//
//  IGLottieProgress.swift
//  IGLottieProgress
//
//  Created by Isaac Gutiérrez on 05/01/21.
//

import Foundation
import UIKit
import Lottie

final public class IGLottieProgress {
    
     static var setConfig = Config()
     static var controller: UIViewController?
     static var alertLottie: AlertLottieViewController?
     static var control = false
    
     init(controller: UIViewController){
        IGLottieProgress.controller = controller
    }
    
    init(controller: UIViewController,config: Config) {
        IGLottieProgress.setConfig = config;
        IGLottieProgress.controller = controller
    }
    
    public static func startLoading() {
        
        if(!control){
            
            let storyboard = UIStoryboard(name: "AlertLottie", bundle: nil)
            IGLottieProgress.control = true
            IGLottieProgress.alertLottie = (storyboard.instantiateViewController(withIdentifier: "alertLottie") as! AlertLottieViewController)
        
            IGLottieProgress.alertLottie!.config = IGLottieProgress.setConfig
            IGLottieProgress.alertLottie!.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
            IGLottieProgress.alertLottie!.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
            IGLottieProgress.controller?.present(IGLottieProgress.alertLottie!, animated: true, completion: nil)
        }

        
   }
   
    
    public static  func finishLoading(){
        if( IGLottieProgress.alertLottie != nil){
            IGLottieProgress.alertLottie?.dismiss(animated: true, completion: nil)
            IGLottieProgress.control = false
        }
    }
}

 extension UIViewController {
    
      func IGPstartLoading(config: Config) {
        
        IGLottieProgress.controller = self
        IGLottieProgress.setConfig = config
        
        IGLottieProgress.startLoading()
        
      }
    
      func IGPfinishLoading(){
        
        IGLottieProgress.finishLoading()

      }
}



