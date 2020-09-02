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
    
}
