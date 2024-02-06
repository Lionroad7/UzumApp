//
//  SvatCell.swift
//  Uzum Tezkor App
//
//  Created by islombek on 26/01/24.
//

import UIKit

final class savatCell: UITableViewCell {

    let cellView = UIView()
    let savatimage = UIImageView()
    
    let savatlabel = UILabel()
    let savatnarx = UILabel()
    
    
    
    
    let plusOneStepper = UIStepper()
    
    
    
    let plusOneLabel = UILabel()
   

    let totalLabel = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(cellView)
        contentView.addSubview(savatimage)
        contentView.addSubview(savatlabel)
        contentView.addSubview(savatnarx)
        
        
        savatnarx.translatesAutoresizingMaskIntoConstraints = false
        savatnarx.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 120).isActive = true
        savatnarx.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -130).isActive = true
        savatnarx.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 60).isActive = true
        savatnarx.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -35).isActive = true
        
        savatnarx.textColor = UIColor(red: 121/255, green: 15/255, blue: 243/255, alpha: 1)
        savatnarx.tintColor = UIColor(red: 121/255, green: 15/255, blue: 243/255, alpha: 1)

        
        
        savatlabel.translatesAutoresizingMaskIntoConstraints = false
        savatlabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 120).isActive = true
        savatlabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -130).isActive = true
        savatlabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 27).isActive = true
        savatlabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -67).isActive = true
        
        savatlabel.tintColor = .black
        savatlabel.textColor = .black
        savatlabel.numberOfLines = 2
        savatlabel.font = UIFont.boldSystemFont(ofSize: savatlabel.font.pointSize)
        savatnarx.font = UIFont.boldSystemFont(ofSize: savatnarx.font.pointSize)
        
        

        savatimage.translatesAutoresizingMaskIntoConstraints = false
        savatimage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        savatimage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -280).isActive = true
        savatimage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        savatimage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30).isActive = true

        cellView.translatesAutoresizingMaskIntoConstraints = false
        cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        cellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
        cellView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        // Adjust the height of the cellView by changing the constant
        cellView.heightAnchor.constraint(equalToConstant: 100).isActive = true // Adjust the height here
        
        
        
        contentView.addSubview(plusOneStepper)
              plusOneStepper.translatesAutoresizingMaskIntoConstraints = false
              plusOneStepper.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
              plusOneStepper.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
              plusOneStepper.addTarget(self, action: #selector(plusOneStepperValueChanged), for: .valueChanged)
 
              contentView.addSubview(plusOneLabel)
              plusOneLabel.translatesAutoresizingMaskIntoConstraints = false
              plusOneLabel.trailingAnchor.constraint(equalTo: plusOneStepper.leadingAnchor, constant: -10).isActive = true
              plusOneLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
 
              
              setupStepperLabels()
              updateTotalLabel()
        
        
   

        
        plusOneStepper.tintColor = UIColor(red: 121/255, green: 15/255, blue: 243/255, alpha: 1)
        plusOneStepper.backgroundColor = .clear
        plusOneStepper.layer.cornerRadius = 8
   
        plusOneStepper.layer.borderColor = UIColor.systemPink.cgColor

       
        plusOneLabel.textColor = UIColor(red: 121/255, green: 15/255, blue: 243/255, alpha: 1)
        plusOneLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)

        
    }
    
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func plusOneStepperValueChanged() {
            plusOneLabel.text = Int(plusOneStepper.value).description
            updateTotalLabel()
        }
        
        @objc func plusTwoStepperValueChanged() {
   
            updateTotalLabel()
        }
        
        private func setupStepperLabels() {
            plusOneLabel.text = "0"
            
            
            plusOneLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
            
        }
        
        private func updateTotalLabel() {
            let plusOneValue = Int(plusOneStepper.value)
        
            let total = plusOneValue
            totalLabel.text = "Total: \(total)"
        }
        
    }
