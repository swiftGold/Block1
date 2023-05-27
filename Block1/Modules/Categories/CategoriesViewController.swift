//
//  ViewController.swift
//  Block1
//
//  Created by Сергей Золотухин on 25.05.2023.
//

import UIKit

protocol CategoriesViewControllerProtocol: AnyObject {
  func setupCollectionView(with models: [CategoryModel])
}

final class CategoriesViewController: UIViewController {
  // MARK: - UI
  private lazy var collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    let collectionView = UICollectionView(frame: .zero,
                                          collectionViewLayout: layout
    )
    layout.itemSize = CGSize(width: (UIScreen.main.bounds.width - 27) / 2 ,
                             height: 160
    )
    layout.minimumLineSpacing = 9
    layout.minimumInteritemSpacing = 0
    layout.scrollDirection = .vertical
    layout.sectionInset = UIEdgeInsets(top: 9, left: 9, bottom: 9, right: 9)
    collectionView.contentInsetAdjustmentBehavior = .always
    collectionView.bounces = false
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.showsVerticalScrollIndicator = false
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.register(CategoriesCollectionViewCell.self,
                            forCellWithReuseIdentifier: "CategoriesCollectionViewCell"
    )
    return collectionView
  }()
  
  private let titleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont(name: Fonts.SFUIReg, size: 17)
    label.text = "Выберите категорию помощи"
    label.textAlignment = .center
    label.textColor = .specialTitleGreyColor
    return label
  }()
  
  // MARK: - Variables
  var presenter: CategoriesPresenterProtocol?
  private var categoriesModel: [CategoryModel] = []
  
  // MARK: - LifeCycles
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViewController()
    setupNavBar()
  }
}

// MARK: - UICollectionViewDelegate impl
extension CategoriesViewController: UICollectionViewDelegate {}

// MARK: - UICollectionViewDataSource impl
extension CategoriesViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return categoriesModel.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesCollectionViewCell", for: indexPath) as? CategoriesCollectionViewCell else { return UICollectionViewCell() }
    cell.configureCell(with: categoriesModel[indexPath.row])
    return cell
  }
}

// MARK: - CategoriesViewControllerProtocol impl
extension CategoriesViewController: CategoriesViewControllerProtocol {
  func setupCollectionView(with models: [CategoryModel]) {
    print(#function)
    categoriesModel = models
    collectionView.reloadData()
  }
}

// MARK: - Private Methods
private extension CategoriesViewController {
  func setupNavBar() {
    customNavBarTitle()
    
    let appearance = UINavigationBarAppearance()
    appearance.configureWithOpaqueBackground()
    appearance.backgroundColor = UIColor.specialNavBarBGColor
    navigationController?.navigationBar.barStyle = .black
    navigationController?.navigationBar.standardAppearance = appearance
    navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
    navigationController?.navigationBar.tintColor = .white
    navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
  }
  
  func customNavBarTitle() {
    let label = UILabel()
    label.text = "Помочь"
    label.font = UIFont(name: Fonts.OfficSanExtraBold, size: 21)
    label.textColor = .white
    navigationItem.titleView = label
  }
  
  func setupViewController() {
    view.backgroundColor = .white

    presenter?.viewDidLoad()
    addSubviews()
    addConstraints()
  }
  
  func addSubviews() {
    view.addSubview(collectionView)
    view.addSubview(titleLabel)
  }
  
  func addConstraints() {
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
      titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      
      collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 17),
      collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
    ])
  }
}
