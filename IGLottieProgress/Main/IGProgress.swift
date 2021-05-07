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
    
    public struct Config {

        var timer: Int = 0
        var message: String = "Please wait"
        var sizeTextMessage: CGFloat = 18.0
        var fontColorMessage: UIColor = .white
        var urlLottieJson: String = "58661-delivery-truck-loading-exporting"
        var srcLottieJson: Bundle?
        var width: Int = 150
        var hight: Int = 125
        
    //    var cancelButton: Bool = false
    //    var cancelButtonWidth: Int = 50
    //    var cancelButtonHight: Int = 55
    //    var cancelButtonAlpha: Float = 0.5
    //    var controller: UIViewController?
        
    }
    
    public static var setConfig: Config?
    public static var controller: UIViewController?
           static var alertLottie: AlertLottieViewController?
    public static var control = false
    
    public  init(controller: UIViewController){
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

 public extension UIViewController {
    
    func IGPstartLoading(config: IGProgress.Config) {
        
        IGProgress.controller = self
        IGProgress.setConfig = config
        
        IGProgress.startLoading()
        
      }
    
      func IGPfinishLoading(){
        
        IGProgress.finishLoading()

      }
}



