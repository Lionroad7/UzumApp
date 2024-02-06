//
//  StoresViewController.swift
//  Korzinka-APP task
//
//  Created by islombek on 16/01/24.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        return tableView
    }()
    
    private var user: User = User(username: "Axmadjonov Islombvek", email: "nexir280jp@gmail.om", phoneNumber: "+998(975450428)")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.backgroundColor = .white
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UserDetailsCell.self, forCellReuseIdentifier: "userDetailsCell")
        tableView.register(SettingsCell.self, forCellReuseIdentifier: "settingsCell")
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return SectionType2.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sectionType = SectionType2(rawValue: section) else {
            return 0
        }
        
        switch sectionType {
        case .user:
            return 1
        case .setting:
            return 9
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let sectionType = SectionType2(rawValue: indexPath.section) else {
            return UITableViewCell()
        }
        
        switch sectionType {
        case .user:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "userDetailsCell", for: indexPath) as? UserDetailsCell else {
            

                return UITableViewCell()
            }
            return cell
            
        case .setting:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "settingsCell", for: indexPath) as? SettingsCell else {
                return UITableViewCell()
            }
            cell.backgroundColor = .white
            cell.textLabel?.textColor = .black
            cell.cellImageView.tintColor = UIColor(red: 121/255, green: 15/255, blue: 243/255, alpha: 1)
           
            switch indexPath.row {
            case 0:
                cell.cellImageView.image = UIImage(systemName: "pencil.and.list.clipboard.rtl")
                cell.textLabel?.text = "       Buyurtmalar tarixi"
            case 1:
                cell.cellImageView.image = UIImage(systemName: "ticket.fill")
                cell.textLabel?.text = "       Promokodlar"
            case 2:
                cell.cellImageView.image = UIImage(systemName: "gift.fill")
                cell.textLabel?.text = "       Do'stingni taklif qil"
            case 3:
                cell.cellImageView.image = UIImage(systemName: "ellipsis.message")
             
                cell.textLabel?.text = "       Yordam"
            case 4:
                cell.cellImageView.image = UIImage(systemName: "character.book.closed.fill.zh")
                cell.textLabel?.text = "       Til"
            case 5:
                cell.cellImageView.image = UIImage(systemName: "exclamationmark.lock.fill")
                cell.textLabel?.text = "       Maxviylik"
            case 6:
                cell.cellImageView.image = UIImage(systemName: "highlighter")
                cell.textLabel?.text = "       Kelishuv"
            case 7:
                cell.cellImageView.image = UIImage(systemName: "figure.walk.circle")
                cell.textLabel?.text = "       Profildan chiqish"
            default:
                break
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}

enum SectionType2: Int, CaseIterable {
    case user
    case setting
}
