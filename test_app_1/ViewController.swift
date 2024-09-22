//
//  ViewController.swift
//  test_app_1
//
//  Created by Bthloo on 20/09/2024.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    let productsList = [
        Product(name: "Orange", price: 10),
        Product(name: "Apple", price: 10),
        Product(name: "Bananana", price: 10),
        Product(name: "Graip", price: 10),
        Product(name: "Watermelon", price: 10),
    ]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let productCell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as! ProductsTableViewCell
        
        let productsData = productsList[indexPath.row]
        
        productCell.setupCell(name: productsData.name, price: productsData.price)
        
        return productCell
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    
    
    @IBOutlet weak var tableView: UITableView!
}

struct Product{
    let name : String
    let price : Int
}
