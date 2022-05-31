//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Петр Макаров on 03.05.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    // MARK: - Private Properties
    
    private lazy var statusTextField: UITextField = {
        let status = UITextField()
        status.placeholder = "Waiting for something..."
        status.textColor = UIColor.gray
        status.backgroundColor = .white
        status.layer.cornerRadius = 10
        status.font = UIFont.boldSystemFont(ofSize: 14)
        status.translatesAutoresizingMaskIntoConstraints = false
        status.addTarget(self, action: #selector(statusTextFieldValueChanged(_:)), for: .valueChanged)
        return status
    }()
    
    private lazy var statusButton: UIButton = {
        let showStatus = UIButton()
        showStatus.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        showStatus.setTitle("Set status", for: .normal)
        showStatus.tintColor = UIColor.white
        showStatus.layer.cornerRadius = 4
        showStatus.layer.shadowOffset = CGSize(width: 4, height: 4)
        showStatus.layer.shadowOpacity = 1.0
        showStatus.layer.shadowColor = UIColor.black.cgColor
        showStatus.backgroundColor = .blue
        showStatus.translatesAutoresizingMaskIntoConstraints = false
        return showStatus
    }()
    
    private lazy var hearLabel: UILabel = {
        var heading = UILabel()
        heading.font = UIFont.boldSystemFont(ofSize: 18)
        heading.text = "Hipster cat"
        heading.translatesAutoresizingMaskIntoConstraints = false
        return heading
    }()
    
    private lazy var profileLabel: UILabel = {
        let profile = UILabel()
        profile.font = UIFont.boldSystemFont(ofSize: 18)
        profile.text = "Profile"
        profile.translatesAutoresizingMaskIntoConstraints = false
        return profile
    }()
    
    private var catImageView: UIImageView = {
        let catImageView = UIImageView()
        catImageView.image = UIImage(named: "cat")
        catImageView.layer.borderWidth = 3
        catImageView.layer.borderColor = UIColor.white.cgColor
        catImageView.layer.cornerRadius = 50
        catImageView.contentMode = .scaleAspectFill
        catImageView.isUserInteractionEnabled = true
        catImageView.clipsToBounds = true
        catImageView.translatesAutoresizingMaskIntoConstraints = false
        return catImageView
    }()
    
    private let whiteView: UIView = {
        let whiteView = UIView()
        whiteView.translatesAutoresizingMaskIntoConstraints = false
        return whiteView
    }()
    
    private let mainView: UIView = {
        let mainView = UIView()
        mainView.translatesAutoresizingMaskIntoConstraints = false
        return mainView
    }()
    
    private var topCatImageView = NSLayoutConstraint()
    private var leadingCatImageView = NSLayoutConstraint()
    private var widthCatImageView = NSLayoutConstraint()
    private var heightCatImageView = NSLayoutConstraint()
    private var catViewY = CGFloat()
    private var catViewX = CGFloat()
    
    private let blackView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .black
        $0.isHidden = true
        $0.alpha = 0.9
        return $0
    }(UIView())
    
    private var closeAnimationButton : UIButton = {
        let closeAnimationButton = UIButton()
        closeAnimationButton.translatesAutoresizingMaskIntoConstraints = false
        closeAnimationButton.isHidden = true
        closeAnimationButton.setBackgroundImage(UIImage(systemName: "xmark"), for: .normal)
        closeAnimationButton.addTarget(self, action: #selector(closeAction), for: .touchUpInside)
        return closeAnimationButton
    }()
    
    private func setupGestures() {
        let setupGestures = UITapGestureRecognizer(target: self, action: #selector(tapInCat))
        catImageView.addGestureRecognizer(setupGestures)
    }
    
    // MARK: - IBActions
    
    @objc func statusTextFieldValueChanged(_ sender: UITextField) {
        restorationIdentifier = statusTextField.text
    }
    
    @objc func buttonPressed(_ sender: UIButton!) {
        if statusTextField.text?.count == 0 {
            hearLabel.text = "Введите статус"
        } else {
        hearLabel.text = statusTextField.text
        print(hearLabel.text ?? statusTextField.placeholder)
    }
    }
    
    
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        isUserInteractionEnabled = true
        
        viewProfile()
        setupGestures()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    
    func viewProfile() {
        
        addSubview(whiteView)
        
        [hearLabel, statusButton, statusTextField, blackView, mainView, catImageView].forEach {whiteView.addSubview($0)}
        
        
        blackView.addSubview(closeAnimationButton)
        
        
        leadingCatImageView = catImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        topCatImageView = catImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16)
        widthCatImageView = catImageView.widthAnchor.constraint(equalToConstant: 100)
        heightCatImageView = catImageView.heightAnchor.constraint(equalToConstant: 100)
        
        NSLayoutConstraint.activate([
            
            whiteView.topAnchor.constraint(equalTo: self.topAnchor),
            whiteView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            whiteView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            whiteView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            topCatImageView,
            leadingCatImageView,
            widthCatImageView,
            heightCatImageView,
            
            hearLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 27),
            hearLabel.leadingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: 27),
            
            mainView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            mainView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            mainView.widthAnchor.constraint(equalToConstant: 100),
            mainView.heightAnchor.constraint(equalToConstant: 100),
            
            statusButton.topAnchor.constraint(equalTo: mainView.bottomAnchor, constant: 16),
            statusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            statusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            statusButton.widthAnchor.constraint(equalToConstant: 380),
            statusButton.heightAnchor.constraint(equalToConstant: 50),
            
            blackView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            blackView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height),
            
            closeAnimationButton.topAnchor.constraint(equalTo: blackView.topAnchor),
            closeAnimationButton.trailingAnchor.constraint(equalTo: blackView.trailingAnchor),
            
            statusTextField.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -34),
            statusTextField.leadingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: 27),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            statusTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        ])
    }
    
    @objc private func tapInCat() {
        catViewY = self.catImageView.center.y
        catViewX = self.catImageView.center.x
        
        
        UIView.animate(
            withDuration: 0.5,
            delay: 0.1,
            usingSpringWithDamping: 1,
            initialSpringVelocity: 0.3,
            options: .curveEaseInOut) {
                
                self.blackView.isHidden = false
                
                self.topCatImageView.constant = UIScreen.main.bounds.midY / 3
                self.leadingCatImageView.isActive = false
                self.widthCatImageView.constant = UIScreen.main.bounds.width
                self.heightCatImageView.constant = UIScreen.main.bounds.width
                self.layoutIfNeeded()
                
            } completion: { _ in
                UIView.animate(withDuration: 1.0,
                               delay: 0.3) {
                    self.closeAnimationButton.isHidden = false
                    self.catImageView.layer.cornerRadius = 0
                    
                }
            }
    }
    
    @objc private func closeAction(){
        
        UIView.animate(
            withDuration: 0.5,
            delay: 0.1,
            usingSpringWithDamping: 1,
            initialSpringVelocity: 0.3,
            options: .curveEaseInOut) {
                self.closeAnimationButton.isHidden = true
                self.catImageView.center = CGPoint(x: self.catViewX, y: self.catViewY)
                self.topCatImageView.constant = self.bounds.minY + 16
                self.leadingCatImageView.isActive = true
                self.widthCatImageView.constant = 100
                self.heightCatImageView.constant = 100
                self.blackView.isHidden = true
                self.layoutIfNeeded()
                self.catImageView.layer.cornerRadius = self.catImageView.bounds.width / 2
            }
    }
}
