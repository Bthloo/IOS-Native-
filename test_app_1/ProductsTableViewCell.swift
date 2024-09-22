//
//  ProductsTableViewCell.swift
//  test_app_1
//
//  Created by Bthloo on 22/09/2024.
//

import UIKit

class ProductsTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var productName: UILabel!
    
    @IBOutlet weak var productPrice: UILabel!
    
    
    func setupCell(name: String, price: Int){
        productName.text = name
        productPrice.text = String(price)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
