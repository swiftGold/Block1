//
//  SplashViewController.swift
//  Block1
//
//  Created by Сергей Золотухин on 19.05.2023.
//

import UIKit

class SplashViewController: UIViewController {
  
  private let logoImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.image = UIImage(named: "logo")
    imageView.contentMode = .scaleAspectFit
    return imageView
  }()
  
  private let loadLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont(name: "SFUIText-Regular", size: 13)
    label.textAlignment = .center
    label.text = "Загрузка..."
    return label
  }()
  
  private let simbirSoftLogoImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.image = UIImage(named: "simbirSoft")
    return imageView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViewController()
    routeAfterLoad()
    LoadingOverlay.shared.showOverlay(view: self.view)
    
    // TODO: - delete after
    for family in UIFont.familyNames.sorted() {
      let names = UIFont.fontNames(forFamilyName: family)
      print("family : \(family) Font names : \(names)")
    }
  }
}

private extension SplashViewController {
  func routeAfterLoad() {
    DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
      guard let strongSelf = self else { return }
      let viewController = ViewController()
      viewController.modalPresentationStyle = .fullScreen
      strongSelf.present(viewController, animated: true)
    }
  }
  
  func setupViewController() {
    view.backgroundColor = .splashScreenBackgroundColor
    
    addSubviews()
    addConstraints()
  }
  
  func addSubviews() {
    view.addSubview(logoImageView)
    view.addSubview(loadLabel)
    view.addSubview(simbirSoftLogoImageView)
  }
  
  func addConstraints() {
    NSLayoutConstraint.activate([
      logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 197),
      logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      logoImageView.heightAnchor.constraint(equalToConstant: 74),
      logoImageView.widthAnchor.constraint(equalToConstant: 247),
      
      loadLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -(view.frame.height / 2 - 50)),
      loadLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      loadLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
      
      simbirSoftLogoImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -48),
      simbirSoftLogoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      simbirSoftLogoImageView.heightAnchor.constraint(equalToConstant: 16),
      simbirSoftLogoImageView.widthAnchor.constraint(equalToConstant: 116)
    ])
  }
}

