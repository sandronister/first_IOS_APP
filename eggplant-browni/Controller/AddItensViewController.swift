//
//  AddItensViewController.swift
//  eggplant-browni
//
//  Created by Julio Sandroni on 31/08/20.
//  Copyright © 2020 Sandroni. All rights reserved.
//

protocol AddItemDelegate {
    func addItem(_ item:Item)
}

import UIKit

class AddItensViewController: UIViewController {
    
    // MARK: - Properties
    var delegate:AddItemDelegate?
    
    init(_ delegate:AddItemDelegate){
        super.init(nibName:"AddItensViewController", bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    // MARK: - IBOutlet
    @IBOutlet var nameTextField: UITextField?
    @IBOutlet var calTextField: UITextField?
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Methods
    @IBAction func addItem(_ sender: Any)
    {
        guard
            let name = nameTextField?.text,
            let cal  = calTextField?.text,
            let dCal = Double(cal)
            else{ return }
        
        let item = Item(name: name, cal: dCal)
        
        delegate?.addItem(item)
        navigationController?.popViewController(animated: true)
    }
    

}
