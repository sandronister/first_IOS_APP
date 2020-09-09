//
//  popAlert.swift
//  eggplant-browni
//
//  Created by Julio Sandroni on 01/09/20.
//  Copyright © 2020 Sandroni. All rights reserved.
//

import UIKit

class Message{

    static func info(_ controller:UIViewController, title:String="Erro",message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title:"OK", style: .cancel, handler: nil)
        alert.addAction(alertAction)

        controller.present(alert,animated: true,completion: nil)
    }
    
    static func remove(_ controller:UIViewController, title:String="Aviso",message:String,handler:@escaping(UIAlertAction)->Void){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let actionCancel = UIAlertAction(title:"Cancel", style:.cancel)
        alert.addAction(actionCancel)
        
        let actionRemove = UIAlertAction(title:"Remove", style: .destructive, handler: handler)
        alert.addAction(actionRemove)
        
        controller.present(alert,animated: true,completion:nil)
    }
    
}
