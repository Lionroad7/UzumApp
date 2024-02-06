//
//  MainPageViewController.swift
//  Korzinka-APP task
//
//  Created by islombek on 16/01/24.
//

import UIKit

final class RestoranViewController: UIViewController {
    
    private let mainvc = RestoView()
    private let presenter: RestoranPresenterable
    
    init(presenter: RestoranPresenterable) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    private lazy var refreshControl: UIRefreshControl = {
           let control = UIRefreshControl()
           control.addTarget(self, action: #selector(handleRefresh(_:)), for: .valueChanged)
           return control
       }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionViiew = UICollectionView(
            frame: CGRect(
                x:0,
                y: 93,
                width: UIScreen.main.bounds.width,
                height: view.frame.size.height
            ),
            collectionViewLayout: createLayout()
        )
        
        collectionViiew.showsHorizontalScrollIndicator = false
        collectionViiew.showsVerticalScrollIndicator = false
        collectionViiew.delegate = self
        collectionViiew.dataSource = self
        collectionViiew.register(CategoryCell.self, forCellWithReuseIdentifier: "cell")
        collectionViiew.register(RecomendationCell.self, forCellWithReuseIdentifier: "cell2")
        collectionViiew.register(CategoryCell3.self, forCellWithReuseIdentifier: "cell3")
        collectionViiew.register(
            HeaderView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: "headerView")
        
        collectionViiew.register(
            HeaderView2.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: "headerView2")
        
        collectionViiew.register(
            HeaderView3.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: "headerView3")
        
        collectionViiew.dataSource = self
        collectionViiew.delegate = self
        collectionViiew.backgroundColor = .white
        
        return collectionViiew
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        collectionView.backgroundColor = .white
        collectionView.register(
            HeaderView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: "headerView"
        )
        view.addSubview(collectionView)
        collectionView.refreshControl = refreshControl
        refreshControl.tintColor = UIColor(red: 121/255, green: 15/255, blue: 243/255, alpha: 1)
    }
    
    @objc private func handleRefresh(_ sender: UIRefreshControl) {

        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            sender.endRefreshing()
        }
    }
}
    
        
extension RestoranViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return SectionType.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.numberOfItems(in: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        presenter.cellForItem(collectionView: collectionView, at: indexPath)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind
        kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader {
            guard let sectionTipe = SectionType(rawValue: indexPath.section) else { return UICollectionViewCell() }
            
            switch sectionTipe {
            case .category:
                guard let hiderView = collectionView.dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: "headerView",
                    for: indexPath
                ) as? HeaderView else { return UICollectionReusableView()
                }

                hiderView.textField.attributedPlaceholder = NSAttributedString(
                    string: "Manzil: ",
                    attributes: [NSAttributedString.Key.foregroundColor:
                                    UIColor.systemGray6]
                )
                
                hiderView.textField.font = UIFont.systemFont(ofSize: 16)
                return hiderView
                
            case .recomendation:
                guard let hiderView2 = collectionView.dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: "headerView2",
                    for: indexPath)
                        as? HeaderView2
                        
                else {
                    
                    return UICollectionReusableView()
                     }
                
                hiderView2.searchBar.placeholder = "Search"
                return hiderView2
                
            case .restourants:
                guard let hiderView3 = collectionView.dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: "headerView3",
                    for: indexPath
                ) as? HeaderView3 else { return UICollectionReusableView()
                }
                return hiderView3
            }
        }
        return UICollectionReusableView()
    }
}

extension RestoranViewController: CategoryDelegate {
    func didChangeTimer(itemIndex: Int) {
        let indexPath = IndexPath(item: itemIndex, section: SectionType.category.rawValue)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    
}

enum SectionType: Int, CaseIterable {
    case category
    case recomendation
    case restourants
}


