//
//  SavatBackController.swift
//  Uzum Tezkor App
//
//  Created by islombek on 29/01/24.
//

import UIKit


class BasketView: UIViewController {

    let backButton = UIButton()
    let cellView = UIView()
    let tableView = UITableView()
    
    let totalLabel: UILabel = {
           let label = UILabel()
           label.translatesAutoresizingMaskIntoConstraints = false
           label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
           label.textColor = .black
           return label
       }()
    var onDismiss: (() -> Void)?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let onDismiss = onDismiss {
            onDismiss()
        }
        
        tablle()
        view.backgroundColor = .white
        title = "Savat"
        let leftButton = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"), style: .plain, target: self, action:  #selector(letButtonTupped))

        leftButton.tintColor = .black
        navigationItem.leftBarButtonItem = leftButton
        
        view.addSubview(backButton)
        backButton.setTitle("Asosiy sahifaga qaytish", for: .normal)
        backButton.setTitleColor(.white, for: .normal)
        backButton.layer.borderWidth = 0.5
        backButton.layer.cornerRadius = 10
        backButton.backgroundColor = UIColor(red: 121/255, green: 15/255, blue: 243/255, alpha: 1)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        backButton.translatesAutoresizingMaskIntoConstraints = false
       
        NSLayoutConstraint.activate([
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            backButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 750),
            backButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50)
        ])
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tabBarController?.tabBar.isHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        navigationController?.popViewController(animated: true)
        tabBarController?.tabBar.isHidden = false
        
        if let navigationController = navigationController {
            let transition = CATransition()
            transition.duration = 0.3
            transition.type = CATransitionType.push
            transition.subtype = CATransitionSubtype.fromLeft
            navigationController.view.layer.add(transition, forKey: kCATransition)
            navigationController.popViewController(animated: false)
        }
       
        if let tabBarController = tabBarController {
            tabBarController.selectedIndex = 0
        }
        
    }
    @objc private func letButtonTupped() {
        navigationController?.popViewController(animated: true)
    }
    @objc func backButtonTapped() {
        
        navigationController?.popViewController(animated: true)
    }
    
    func tablle() {
        
        view.addSubview(tableView)
            view.addSubview(backButton)

            NSLayoutConstraint.activate([
                tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -500),

                backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
                backButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
                backButton.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 20),
                backButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50)
            ])
        
        tableView.frame = view.frame
        tableView.register(savatCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .singleLine
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        tableView.separatorColor = .clear
        tableView.backgroundColor = .clear
        tableView.layer.cornerRadius = 5
       
    }
}

extension BasketView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? savatCell else {
            return UITableViewCell()
        }
        cell.backgroundColor = .white
        cell.selectionStyle = .none
        cell.cellView.layer.cornerRadius = 10
        cell.savatimage.image = UIImage(named: "savatimage")
        cell.savatlabel.text = "Cet Uzum Tezkor Chizburger"
        cell.savatnarx.text = "80 000 sum"
        cell.plusOneLabel.text = "0"

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    private func updateTotalLabel() {
            var total = 0
        
            for cell in tableView.visibleCells as! [savatCell] {
                let plusOneValue = Int(cell.plusOneStepper.value)
                total += plusOneValue
            }
            totalLabel.text = "\(total)"
        }
}
