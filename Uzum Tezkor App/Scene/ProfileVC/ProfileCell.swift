//
//  ProfileCell.swift
//  Uzum Tezkor App
//
//  Created by islombek on 29/01/24.
//



import UIKit

class UserDetailsCell: UITableViewCell {

    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 24
        return imageView
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()

    private let emailLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()

    private let phoneLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }

    private func setupViews() {
        [nameLabel, emailLabel, phoneLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }

        profileImageView.image = UIImage(named: "Islombek")
        addSubview(profileImageView)
        nameLabel.textColor = .white
        emailLabel.textColor = .white
        phoneLabel.textColor = .white

        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            profileImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 150),
            profileImageView.widthAnchor.constraint(equalToConstant: 90),
            profileImageView.heightAnchor.constraint(equalToConstant: 90),

            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 16),

            emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            emailLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 16),

            phoneLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 4),
            phoneLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 16),
        ])
    }

    func configure(with user: User) {
        nameLabel.text = user.username
        emailLabel.text = "Email: \(user.email)"
        phoneLabel.text = "Phone: \(user.phoneNumber)"
        
        // Add animation to profileImageView
        addProfileImageAnimation()
    }

    private func addProfileImageAnimation() {
        UIView.animate(withDuration: 2.0, delay: 0.0, options: [.repeat, .autoreverse], animations: {
            self.profileImageView.alpha = 0.2
        })
    }
    
}

// The rest of your code...

class SettingsCell: UITableViewCell {

    let cellImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 24
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }

    private func setupViews() {
        addSubview(cellImageView)

        NSLayoutConstraint.activate([
            cellImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            cellImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            cellImageView.widthAnchor.constraint(equalToConstant: 30),
            cellImageView.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
}
struct User {
    var username: String
    var email: String
    var phoneNumber: String
}
