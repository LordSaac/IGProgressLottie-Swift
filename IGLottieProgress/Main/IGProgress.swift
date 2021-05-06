//
//  IGLottieProgress.swift
//  IGLottieProgress
//
//  Created by Isaac Gutiérrez on 05/01/21.
//

import Foundation
import UIKit
import Lottie

final public class IGProgress {
    
     static var setConfig = Config()
     static var controller: UIViewController?
     static var alertLottie: AlertLottieViewController?
     static var control = false
    
     init(controller: UIViewController){
        IGProgress.controller = controller
    }
    
    init(controller: UIViewController,config: Config) {
        IGProgress.setConfig = config;
        IGProgress.controller = controller
    }
    
    public static func startLoading() {
        
        if(!control){
            
            let storyboard = UIStoryboard(name: "AlertLottie", bundle: nil)
            IGProgress.control = true
            IGProgress.alertLottie = (storyboard.instantiateViewController(withIdentifier: "alertLottie") as! AlertLottieViewController)
        
            IGProgress.alertLottie!.config = IGProgress.setConfig
            IGProgress.alertLottie!.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
            IGProgress.alertLottie!.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
            IGProgress.controller?.present(IGProgress.alertLottie!, animated: true, completion: nil)
        }

        
   }
   
    
    public static  func finishLoading(){
        if( IGProgress.alertLottie != nil){
            IGProgress.alertLottie?.dismiss(animated: true, completion: nil)
            IGProgress.control = false
        }
    }
}

 extension UIViewController {
    
      func IGPstartLoading(config: Config) {
        
        IGProgress.controller = self
        IGProgress.setConfig = config
        
        IGProgress.startLoading()
        
      }
    
      func IGPfinishLoading(){
        
        IGProgress.finishLoading()

      }
}



