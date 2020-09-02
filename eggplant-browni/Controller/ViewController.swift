//
//  ViewController.swift
//  eggplant-browni
//
//  Created by Julio Sandroni on 29/08/20.
//  Copyright © 2020 Sandroni. All rights reserved.
//

import UIKit

protocol addMealsDelegate {
    func add(_ meal:Meal)
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddItemDelegate {
    
    // MARK: - Atributes
    var delegate:addMealsDelegate?
    
    
    var itens:Array<Item> = [Item(name:"Molho de tomate",cal: 40.0),
    Item(name:"Queijo",cal: 40.0),
    Item(name:"Manjericão",cal: 40.0),
    Item(name:"Pimenta do Reino",cal: 40.0),
    Item(name:"Molho Inglês",cal: 40.0)]
    
    var itensSelecionados:[Item]=[]
    
    
    // MARK:  - IBOutlets
    @IBOutlet var nameTextField:UITextField?
    @IBOutlet var levelHappyTextField:UITextField?
    @IBOutlet var itensTableView: UITableView?
    
    // MARK: - Life cycle view controller
    override func viewDidLoad(){
        let addButtonItem = UIBarButtonItem(title: "Add Item", style:.plain
            , target: self, action: #selector(addItemView))
        
        navigationItem.rightBarButtonItem = addButtonItem
    }
    
    // MARK: - Methods
    @objc func addItemView(){
        let addItensViewController = AddItensViewController(self)
        navigationController?.pushViewController(addItensViewController, animated: true)
    }
    
    func addItem(_ item:Item) {
        itens.append(item)
        
        if(itensTableView == nil){
            Message.info(self,title:"Erro",message:"Ocorreu um erro")
        }
        
        itensTableView?.reloadData()
    }
    
    // MARK: -  UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        let label = itens[indexPath.row]
        cell.textLabel?.text=label.name
        return cell
     }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        guard let cell = tableView.cellForRow(at: indexPath) else{ return }
        
        if(cell.accessoryType == .none){
            cell.accessoryType = .checkmark
            itensSelecionados.append(itens[indexPath.row])
            return
        }
        
        if(cell.accessoryType == .checkmark){
            cell.accessoryType = .none
            let item = itens[indexPath.row]
            
            if let position = itensSelecionados.lastIndex(of: item){
                itensSelecionados.remove(at: position)
            }
            
            
            for sel in itensSelecionados{
                print(sel.name)
            }
            
            return
        }
    }
    
    // MARK: - Methods
    func getFormMeals()->Meal?{
        
        guard
            let name = nameTextField?.text,
            let happyMeal = levelHappyTextField?.text,
            let happy = Int(happyMeal)
            else {
                return nil
            }
        
        return Meal(name:name,happy:happy,itens: itensSelecionados)
    }
   
    // MARK:  - IBActions
    @IBAction func add(_ sender: Any) {
        
        guard let myMeal = self.getFormMeals() else {
            Message.info(self,message:"Ocorreu um erro ao pegar informaçoes do formulário")
            return
        }
        
        delegate?.add(myMeal)
        navigationController?.popViewController(animated: true)

    }
}

