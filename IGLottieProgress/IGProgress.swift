//
//  IGLottieProgress.swift
//  IGLottieProgress
//
//  Created by Isaac Gutiérrez on 05/01/21.
//

import Foundation
import UIKit
import Lottie


public class IGProgress {
  
    public  static var config: IGConfig = IGConfig()
    public  static var controller: UIViewController?
            static var alertLottie: AlertLottieViewController?
    public  static var control = false
    private static let idBundle: String = "org.cocoapods.IGLottieProgress"
    private static let nameStoryBoard: String = "AlertLottie"
    private static let controllerId: String = "alertLottie"
    
   public init(controller: UIViewController){
        IGProgress.controller = controller
    }
    
   public init(controller: UIViewController,config: IGConfig) {
        IGProgress.config = config;
        IGProgress.controller = controller
    }
    
    public static func startLoading() {
        
        if(!control){
            
            let storyboardBundle = Bundle(identifier: IGProgress.idBundle)
            
            let storyboard = UIStoryboard(name: IGProgress.nameStoryBoard, bundle: storyboardBundle)
            
            IGProgress.control = true
            IGProgress.alertLottie = (storyboard.instantiateViewController(withIdentifier: IGProgress.controllerId) as! AlertLottieViewController)
        
            IGProgress.alertLottie!.config = IGProgress.config
            IGProgress.alertLottie!.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
            IGProgress.alertLottie!.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
            IGProgress.controller?.present(IGProgress.alertLottie!, animated: true, completion: nil)
            
        }
    }
   
    
    public static  func finishLoading(){
        if( IGProgress.alertLottie != nil){
            IGProgress.alertLottie?.dismiss(animated: true, completion: nil)
            IGProgress.control = false
            IGProgress.config = IGConfig()
        }
    }
}

 public extension UIViewController {
    
       func IGPStartLoading(config: IGConfig) {
        
        IGProgress.controller = self
        IGProgress.config = config
        
        IGProgress.startLoading()
        
      }
    
      func IGPFinishLoading(){
        
        IGProgress.finishLoading()

      }
}

public extension UIColor {
    
    convenience init(hex: String) {
         let scanner = Scanner(string: hex)
         scanner.scanLocation = 0
         var rgbValue: UInt64 = 0
         scanner.scanHexInt64(&rgbValue)

         let r = (rgbValue & 0xff0000) >> 16
         let g = (rgbValue & 0xff00) >> 8
         let b = rgbValue & 0xff

         self.init(
             red: CGFloat(r) / 0xff,
             green: CGFloat(g) / 0xff,
             blue: CGFloat(b) / 0xff, alpha: 1
         )
     }
}


public struct IGConfig  {

    public var timer: Int = 0
    public var message: String = ""
    public var sizeTextMessage: CGFloat = 18.0
    public var fontColorMessage: UIColor = .white
    public var urlLottieJson: String = "58661-delivery-truck-loading-exporting"
    public var srcLottieJson: Bundle?
    public var width: Int = 150
    public var hight: Int = 125
    public var animationSpeed: CGFloat = 0.5;
    public var alpha: CGFloat = 0.5;
    public var backgroundColor: UIColor = UIColor.init(hex: "#D3D3D3")
    public var contentMode: UIView.ContentMode = .scaleAspectFit
    
//    var cancelButton: Bool = false
//    var cancelButtonWidth: Int = 50
//    var cancelButtonHight: Int = 55
//    var cancelButtonAlpha: Float = 0.5
//    var controller: UIViewController?
//

}








