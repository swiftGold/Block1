//
//  FullEventDescriptionVC.swift
//  Block1
//
//  Created by Сергей Золотухин on 29.05.2023.
//

import UIKit

class FullEventDescriptionVC: UIViewController {
  //MARK: - UI
  private lazy var barButtonItem = UIBarButtonItem(image: UIImage(named: Images.share), style: .plain, target: self, action: #selector(didTapBarButton))
  
  private let scrollView: UIScrollView = {
    let scrollView = UIScrollView()
    scrollView.backgroundColor = .clear
    return scrollView
  }()
  
  private let backgroundView: UIView = {
    let backgroundView = UIView()
    backgroundView.backgroundColor = .clear
    return backgroundView
  }()
  
  private let titleLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont(name: Fonts.OfficSanExtraBold, size: 21)
    label.text = "Спонсоры отремонтируют школу-интернат"
    label.textAlignment = .left
    label.textColor = .specialTitleColor
    label.numberOfLines = 0
    return label
  }()
  
  private let diaryImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: Images.greyDiary)
    return imageView
  }()
  
  private let diaryLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont(name: Fonts.SFUIMed, size: 11)
    label.text = "Текст рассписания"
    label.textAlignment = .left
    label.textColor = .specialDiaryLightGreyColor
    return label
  }()
  
  private let diaryStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.spacing = 10
    stackView.distribution = .fill
    stackView.alignment = .leading
    return stackView
  }()
  
  private let organizationNameLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont(name: Fonts.SFUIReg, size: 11)
    label.text = "Благотворительный фонд «Счастливый Мир»"
    label.textAlignment = .left
    label.textColor = .specialTitleGreyColor
    label.numberOfLines = 0
    return label
  }()
  
  private let adressLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont(name: Fonts.SFUIReg, size: 15)
    label.text = "Санкт-Петербург, Кирочная улица, д. 50А, каб. 208"
    label.textAlignment = .left
    label.textColor = .specialTitleGreyColor
    label.numberOfLines = 0
    return label
  }()
  
  private let adressImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: Images.nav)
    return imageView
  }()
  
  private let adressStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.spacing = 10
    stackView.distribution = .fill
    stackView.alignment = .leading
    return stackView
  }()
  
  private let firstPhoneLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont(name: Fonts.SFUIReg, size: 15)
    label.text = "+7 (937) 037 37-73"
    label.textAlignment = .left
    label.textColor = .specialTitleGreyColor
    return label
  }()
  
  private let secondPhoneLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont(name: Fonts.SFUIReg, size: 15)
    label.text = "+7 (937) 016 16-16"
    label.textAlignment = .left
    label.textColor = .specialTitleGreyColor
    return label
  }()
  
  private let phoneNumbersStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.spacing = 3
    stackView.distribution = .fill
    stackView.alignment = .leading
    return stackView
  }()
  
  private let phoneImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: Images.phone)
    return imageView
  }()
  
  private let phoneStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.spacing = 10
    stackView.distribution = .fill
    stackView.alignment = .leading
    return stackView
  }()
  
  private let mailImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: Images.mail)
    return imageView
  }()
  
  private let mailLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont(name: Fonts.SFUIReg, size: 15)
    label.text = "У вас есть вопросы?"
    label.textAlignment = .left
    label.textColor = .specialTitleGreyColor
    return label
  }()
  
  private lazy var writeUsButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("Напишите нам", for: .normal)
    button.titleLabel?.font = UIFont(name: Fonts.SFUIReg, size: 15)
    button.addTarget(self, action: #selector(writeUsButtonTapped), for: .touchUpInside)
    button.tintColor = .specialNavBarBGColor
    return button
  }()
  
  private let mailStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.spacing = 10
    stackView.distribution = .fill
    stackView.alignment = .leading
    return stackView
  }()
  
  private let bigPhotoImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "image1")
    imageView.contentMode = .scaleToFill
    return imageView
  }()
  
  private let firstSmallPhotoImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "image2")
    imageView.contentMode = .scaleToFill
    return imageView
  }()
  
  private let secondSmallPhotoImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "image3")
    imageView.contentMode = .scaleToFill
    return imageView
  }()
  
  private let smallPhotosStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.spacing = 10
    stackView.distribution = .fillEqually
    return stackView
  }()
  
  private let photosStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.spacing = 10
    stackView.distribution = .fill
    return stackView
  }()
  
  private let descriptionLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont(name: Fonts.SFUIReg, size: 15)
    label.text = "Участники и болельщики смогли весело и активно провести время на «Петербургском благотворительном марафоне» и при этом финансово поучаствовать в помощи детям. Участники и болельщики смогли весело и активно провести время на «Петербургском благотворительном марафоне» и при этом финансово поучаствовать в помощи детям."
    label.textAlignment = .left
    label.textColor = .specialTitleGreyColor
    label.numberOfLines = 0
    return label
  }()
  
  private lazy var routeToSiteButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("Перейти на сайт организаии", for: .normal)
    button.titleLabel?.font = UIFont(name: Fonts.SFUIReg, size: 15)
    button.addTarget(self, action: #selector(routeToSiteButtonTapped), for: .touchUpInside)
    button.tintColor = .specialNavBarBGColor
    return button
  }()
  
  private let mainStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.spacing = 10
    stackView.axis = .vertical
    stackView.alignment = .top
    stackView.distribution = .fillProportionally
    return stackView
  }()
  
  private let bottomParticipantsView: UIView = {
    let view = UIView()
    view.backgroundColor = .specialCollectionViewBGColor
    return view
  }()
  
  private let photo1ImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: Images.photo1)
    return imageView
  }()
  
  private let photo2ImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: Images.photo2)
    return imageView
  }()
  
  private let photo3ImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: Images.photo3)
    return imageView
  }()
  
  private let photo4ImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: Images.photo4)
    return imageView
  }()
  
  private let photo5ImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: Images.photo5)
    return imageView
  }()
  
  private let bottomPhotosStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.spacing = -5
    stackView.distribution = .fillEqually
    return stackView
  }()
  
  private let participantCountLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont(name: Fonts.SFUIMed, size: 13)
    label.text = "+102"
    label.textAlignment = .left
    label.textColor = .specialDiaryLightGreyColor
    return label
  }()
  
//  private let bottomButtonsView: UIView = {
//    let view = UIView()
//    view.backgroundColor = .specialBottomViewColor
//    return view
//  }()
//
//  private let shirtImageView: UIImageView = {
//    let imageView = UIImageView()
//    imageView.image = UIImage(named: Images.shirt)?.withRenderingMode(.alwaysTemplate)
//    imageView.tintColor = .specialNavBarBGColor
//    return imageView
//  }()
//
//  private let shirtLabel: UILabel = {
//    let label = UILabel()
//    label.font = UIFont(name: Fonts.SFUIMed, size: 10)
//    label.text = "Помочь \n вещами"
//    label.textAlignment = .center
//    label.textColor = .specialSublabelColor
//    label.numberOfLines = 0
//    return label
//  }()
//
//  private let shirtStackView: UIStackView = {
//    let stackView = UIStackView()
//    stackView.spacing = 5
//    stackView.axis = .vertical
//    stackView.distribution = .fill
//    stackView.alignment = .center
//    return stackView
//  }()
//
//  private let handsImageView: UIImageView = {
//    let imageView = UIImageView()
//    imageView.image = UIImage(named: Images.hands)?.withRenderingMode(.alwaysTemplate)
//    imageView.tintColor = .specialNavBarBGColor
//    return imageView
//  }()
//
//  private let handsLabel: UILabel = {
//    let label = UILabel()
//    label.font = UIFont(name: Fonts.SFUIMed, size: 10)
//    label.text = "Стать \n волонтером"
//    label.textAlignment = .center
//    label.textColor = .specialSublabelColor
//    label.numberOfLines = 0
//    return label
//  }()
//
//  private let handsStackView: UIStackView = {
//    let stackView = UIStackView()
//    stackView.spacing = 5
//    stackView.axis = .vertical
//    stackView.distribution = .fill
//    stackView.alignment = .center
//    return stackView
//  }()
//
//  private let toolsImageView: UIImageView = {
//    let imageView = UIImageView()
//    imageView.image = UIImage(named: Images.tools)?.withRenderingMode(.alwaysTemplate)
//    imageView.tintColor = .specialNavBarBGColor
//    return imageView
//  }()
//
//  private let toolsLabel: UILabel = {
//    let label = UILabel()
//    label.font = UIFont(name: Fonts.SFUIMed, size: 10)
//    label.text = "Проф.\n помощь"
//    label.textAlignment = .center
//    label.textColor = .specialSublabelColor
//    label.numberOfLines = 0
//    return label
//  }()
//
//  private let toolsStackView: UIStackView = {
//    let stackView = UIStackView()
//    stackView.spacing = 5
//    stackView.axis = .vertical
//    stackView.distribution = .fill
//    stackView.alignment = .center
//    return stackView
//  }()
//
//  private let cashImageView: UIImageView = {
//    let imageView = UIImageView()
//    imageView.image = UIImage(named: Images.coins)?.withRenderingMode(.alwaysTemplate)
//    imageView.tintColor = .specialNavBarBGColor
//    return imageView
//  }()
//
//  private let cashLabel: UILabel = {
//    let label = UILabel()
//    label.font = UIFont(name: Fonts.SFUIMed, size: 10)
//    label.text = "Помочь \n деньгами"
//    label.textAlignment = .center
//    label.textColor = .specialSublabelColor
//    label.numberOfLines = 0
//    return label
//  }()
//
//  private let cashStackView: UIStackView = {
//    let stackView = UIStackView()
//    stackView.spacing = 5
//    stackView.axis = .vertical
//    stackView.distribution = .fill
//    stackView.alignment = .center
//    return stackView
//  }()
//
//  private let bottomIconsStackView: UIStackView = {
//    let stackView = UIStackView()
//    stackView.spacing = 0
//    stackView.distribution = .fillEqually
//    return stackView
//  }()
//
//  private lazy var shirtButton: UIButton = {
//    let button = UIButton(type: .system)
//    button.addTarget(self, action: #selector(shirtButtonTapped), for: .touchUpInside)
//    button.backgroundColor = .clear
//    return button
//  }()
//
//  private lazy var handsButton: UIButton = {
//    let button = UIButton(type: .system)
//    button.addTarget(self, action: #selector(handsButtonTapped), for: .touchUpInside)
//    button.backgroundColor = .clear
//    return button
//  }()
//
//  private lazy var toolsButton: UIButton = {
//    let button = UIButton(type: .system)
//    button.addTarget(self, action: #selector(toolsButtonTapped), for: .touchUpInside)
//    button.backgroundColor = .clear
//    return button
//  }()
//
//  private lazy var cashButton: UIButton = {
//    let button = UIButton(type: .system)
//    button.addTarget(self, action: #selector(cashButtonTapped), for: .touchUpInside)
//    button.backgroundColor = .clear
//    return button
//  }()
//
//  private let bottomButtonsStackView: UIStackView = {
//    let stackView = UIStackView()
//    stackView.spacing = 3
//    stackView.distribution = .fillEqually
//    return stackView
//  }()
//
//  private let separatorImageView1: UIImageView = {
//    let imageView = UIImageView()
//    imageView.image = UIImage(named: Images.verticalSeparator)
//    return imageView
//  }()
//
//  private let separatorImageView2: UIImageView = {
//    let imageView = UIImageView()
//    imageView.image = UIImage(named: Images.verticalSeparator)
//    return imageView
//  }()
//
//  private let separatorImageView3: UIImageView = {
//    let imageView = UIImageView()
//    imageView.image = UIImage(named: Images.verticalSeparator)
//    return imageView
//  }()
  
  private let bottomButtonsView = BottomButtonsView()
  
  // MARK: - Lifecycles
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViewController()
    setupNavBar()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    tabBarController?.tabBar.isHidden = true
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    tabBarController?.tabBar.isHidden = false
  }
  
  // MARK: - Objc methods
  @objc
  private func didTapBarButton() {
    print(#function)
  }
  
  @objc
  private func writeUsButtonTapped() {
    print(#function)
  }
  
  @objc
  private func routeToSiteButtonTapped() {
    print(#function)
  }
  
  @objc
  private func shirtButtonTapped() {
    print(#function)
  }
  
  @objc
  private func handsButtonTapped() {
    print(#function)
  }
  
  @objc
  private func toolsButtonTapped() {
    print(#function)
  }
  
  @objc
  private func cashButtonTapped() {
    print(#function)
  }
}

// MARK: - Private Methods
private extension FullEventDescriptionVC {
  func setupViewController() {
    view.backgroundColor = .white
    addSubviews()
    addConstraints()
  }
  
  func addSubviews() {
    diaryStackView.addArrangedSubview(diaryImageView)
    diaryStackView.addArrangedSubview(diaryLabel)
    
    adressStackView.addArrangedSubview(adressImageView)
    adressStackView.addArrangedSubview(adressLabel)
    
    phoneNumbersStackView.addArrangedSubview(firstPhoneLabel)
    phoneNumbersStackView.addArrangedSubview(secondPhoneLabel)
    
    phoneStackView.addArrangedSubview(phoneImageView)
    phoneStackView.addArrangedSubview(phoneNumbersStackView)
    
    mailStackView.addArrangedSubview(mailImageView)
    mailStackView.addArrangedSubview(mailLabel)
    mailStackView.addArrangedSubview(writeUsButton)
    
    smallPhotosStackView.addArrangedSubview(firstSmallPhotoImageView)
    smallPhotosStackView.addArrangedSubview(secondSmallPhotoImageView)
    
    photosStackView.addArrangedSubview(bigPhotoImageView)
    photosStackView.addArrangedSubview(smallPhotosStackView)
    
    bottomPhotosStackView.addArrangedSubview(photo1ImageView)
    bottomPhotosStackView.addArrangedSubview(photo2ImageView)
    bottomPhotosStackView.addArrangedSubview(photo3ImageView)
    bottomPhotosStackView.addArrangedSubview(photo4ImageView)
    bottomPhotosStackView.addArrangedSubview(photo5ImageView)
    
//    shirtStackView.addArrangedSubview(shirtImageView)
//    shirtStackView.addArrangedSubview(shirtLabel)
//
//    handsStackView.addArrangedSubview(handsImageView)
//    handsStackView.addArrangedSubview(handsLabel)
//
//    toolsStackView.addArrangedSubview(toolsImageView)
//    toolsStackView.addArrangedSubview(toolsLabel)
//
//    cashStackView.addArrangedSubview(cashImageView)
//    cashStackView.addArrangedSubview(cashLabel)
//
//    bottomIconsStackView.addArrangedSubview(shirtStackView)
//    bottomIconsStackView.addArrangedSubview(handsStackView)
//    bottomIconsStackView.addArrangedSubview(toolsStackView)
//    bottomIconsStackView.addArrangedSubview(cashStackView)
//
//    bottomButtonsStackView.addArrangedSubview(shirtButton)
//    bottomButtonsStackView.addArrangedSubview(handsButton)
//    bottomButtonsStackView.addArrangedSubview(toolsButton)
//    bottomButtonsStackView.addArrangedSubview(cashButton)
    
    mainStackView.addArrangedSubview(titleLabel)
    mainStackView.addArrangedSubview(diaryStackView)
    mainStackView.addArrangedSubview(organizationNameLabel)
    mainStackView.addArrangedSubview(adressStackView)
    mainStackView.addArrangedSubview(phoneStackView)
    mainStackView.addArrangedSubview(mailStackView)
    mainStackView.addArrangedSubview(photosStackView)
    mainStackView.addArrangedSubview(descriptionLabel)
    mainStackView.addArrangedSubview(routeToSiteButton)
    
    view.myAddSubView(scrollView)
    scrollView.myAddSubView(backgroundView)
    backgroundView.myAddSubView(mainStackView)
    
    view.myAddSubView(bottomParticipantsView)
    bottomParticipantsView.myAddSubView(bottomPhotosStackView)
    bottomParticipantsView.myAddSubView(participantCountLabel)
    
    view.myAddSubView(bottomButtonsView)
    
//    view.myAddSubView(bottomButtonsView)
//    bottomButtonsView.myAddSubView(bottomIconsStackView)
//    bottomButtonsView.myAddSubView(bottomButtonsStackView)
//    bottomButtonsView.myAddSubView(separatorImageView1)
//    bottomButtonsView.myAddSubView(separatorImageView2)
//    bottomButtonsView.myAddSubView(separatorImageView3)
  }
  
  func addConstraints() {
    NSLayoutConstraint.activate([
      scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
      scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
      scrollView.bottomAnchor.constraint(equalTo: bottomParticipantsView.topAnchor, constant: -32),
      
      backgroundView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
      backgroundView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
      backgroundView.topAnchor.constraint(equalTo: scrollView.topAnchor),
      backgroundView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
      
      mainStackView.topAnchor.constraint(equalTo: backgroundView.topAnchor),
      mainStackView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -20),
      mainStackView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 20),
      mainStackView.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor),
      
      bottomParticipantsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      bottomParticipantsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      bottomParticipantsView.bottomAnchor.constraint(equalTo: bottomButtonsView.topAnchor),
      bottomParticipantsView.heightAnchor.constraint(equalToConstant: 68),
      
      bottomPhotosStackView.centerYAnchor.constraint(equalTo: bottomParticipantsView.centerYAnchor),
      bottomPhotosStackView.leadingAnchor.constraint(equalTo: bottomParticipantsView.leadingAnchor, constant: 20),
      bottomPhotosStackView.widthAnchor.constraint(equalToConstant: 180),
      bottomPhotosStackView.heightAnchor.constraint(equalToConstant: 36),
      
      participantCountLabel.centerYAnchor.constraint(equalTo: bottomParticipantsView.centerYAnchor),
      participantCountLabel.leadingAnchor.constraint(equalTo: bottomPhotosStackView.trailingAnchor, constant: 10),
      
      bottomButtonsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      bottomButtonsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      bottomButtonsView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
      bottomButtonsView.heightAnchor.constraint(equalToConstant: 70),
      
//      bottomButtonsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//      bottomButtonsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//      bottomButtonsView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
//      bottomButtonsView.heightAnchor.constraint(equalToConstant: 70),
//
//      bottomIconsStackView.centerYAnchor.constraint(equalTo: bottomButtonsView.centerYAnchor),
//      bottomIconsStackView.leadingAnchor.constraint(equalTo: bottomButtonsView.leadingAnchor),
//      bottomIconsStackView.trailingAnchor.constraint(equalTo: bottomButtonsView.trailingAnchor),
//
//      bottomButtonsStackView.centerYAnchor.constraint(equalTo: bottomButtonsView.centerYAnchor),
//      bottomButtonsStackView.leadingAnchor.constraint(equalTo: bottomButtonsView.leadingAnchor),
//      bottomButtonsStackView.trailingAnchor.constraint(equalTo: bottomButtonsView.trailingAnchor),
//
//      separatorImageView1.centerYAnchor.constraint(equalTo: bottomButtonsView.centerYAnchor),
//      separatorImageView1.leadingAnchor.constraint(equalTo: bottomButtonsView.leadingAnchor, constant: UIScreen.main.bounds.width / 4),
//
//      separatorImageView2.centerYAnchor.constraint(equalTo: bottomButtonsView.centerYAnchor),
//      separatorImageView2.trailingAnchor.constraint(equalTo: bottomButtonsView.trailingAnchor, constant: -(UIScreen.main.bounds.width / 4)),
//
//      separatorImageView3.centerYAnchor.constraint(equalTo: bottomButtonsView.centerYAnchor),
//      separatorImageView3.centerXAnchor.constraint(equalTo: bottomButtonsView.centerXAnchor)
    ])
  }
  
  func setupNavBar() {
    customNavBarTitle()
    navigationItem.rightBarButtonItem = barButtonItem
    let appearance = UINavigationBarAppearance()
    appearance.backgroundColor = UIColor.specialNavBarBGColor
    navigationController?.navigationBar.standardAppearance = appearance
    navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
    navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
  }
  
  func customNavBarTitle() {
    let label = UILabel()
    label.text = "Тут будет название события"
    label.font = UIFont(name: Fonts.OfficSanExtraBold, size: 21)
    label.textColor = .white
    navigationItem.titleView = label
  }
}
