//
//  LogInViewController.swift
//  Navigation
//
//  Created by Петр Макаров on 11.05.2022.
//

import UIKit

class LogInViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
        return $0
    }(UIView())
    
    private let vkImage: UIImageView = {
        let vkImage = UIImageView()
        vkImage.image = UIImage(named: "logo")
        vkImage.translatesAutoresizingMaskIntoConstraints = false
        return vkImage
    }()
    
    private let topTextField: UITextField = {
        let topTextField = UITextField()
        topTextField.textColor = .black
        topTextField.layer.borderColor = UIColor.black.cgColor
        topTextField.font = UIFont.boldSystemFont(ofSize: 16)
        topTextField.translatesAutoresizingMaskIntoConstraints = false
        topTextField.placeholder = "Email or phone"
        return topTextField
    }()
    
    private let bottomTextField: UITextField = {
        let bottomTextField = UITextField()
        bottomTextField.textColor = .black
        bottomTextField.layer.borderColor = UIColor.black.cgColor
        bottomTextField.font = UIFont.boldSystemFont(ofSize: 16)
        bottomTextField.isSecureTextEntry = true
        bottomTextField.translatesAutoresizingMaskIntoConstraints = false
        bottomTextField.placeholder = "Password"
        return bottomTextField
    }()
    
    private let stackViewText: UIStackView = {
        let stackViewText = UIStackView()
        stackViewText.axis = .vertical
        stackViewText.distribution = .fillProportionally
        stackViewText.layer.cornerRadius = 10
        stackViewText.layer.borderWidth = 0.5
        stackViewText.layer.borderColor = UIColor.lightGray.cgColor
        stackViewText.translatesAutoresizingMaskIntoConstraints = false
        return stackViewText
    }()
    
    private let buttonDidPressed: UIButton = {
        let buttonDidPressed = UIButton()
        buttonDidPressed.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        buttonDidPressed.setTitle("Log In", for: .normal)
        buttonDidPressed.layer.cornerRadius = 10
        buttonDidPressed.alpha = 1
        buttonDidPressed.tintColor = .white
        buttonDidPressed.translatesAutoresizingMaskIntoConstraints = false
        return buttonDidPressed
    }()
    
    private let dividingStrip: UIView = {
        let dividingStrip = UIView()
        dividingStrip.backgroundColor = .lightGray
        return dividingStrip
    }()
    
    private let alertlabel: UILabel = {
        let alertLabel = UILabel()
        alertLabel.font = UIFont.boldSystemFont(ofSize: 10)
        alertLabel.text = "Количество символов ниже необходимого"
        alertLabel.translatesAutoresizingMaskIntoConstraints = false
        alertLabel.isHidden = true
        return alertLabel
    }()
    
    public func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    let login: String = "zebra@mail.ru"
    let password: String = "paSsword142"
    
    let lowercase = CharacterSet.lowercaseLetters
    let upperCase = CharacterSet.uppercaseLetters
    
    @objc func buttonPressed(sender: UIButton!) {
        
        if topTextField.text?.count == 0 && bottomTextField.text?.count == 0 {
            UIButton.animate(
                withDuration: 1,
                delay: 0.1,
                usingSpringWithDamping: 1,
                initialSpringVelocity: 0.3,
                options: .curveEaseInOut) {
                    self.buttonDidPressed.backgroundColor = .red
                } completion: { _ in
                    UIButton.animate(withDuration: 1.0,
                                     delay: 0.0) {
                        let colorSet = self.hexStringToUIColor(hex: "#4885CC")
                        self.buttonDidPressed.backgroundColor = colorSet
                    }
                }
        } else if topTextField.text!.count < 5 || bottomTextField.text!.count < 5 {
            alertlabel.isHidden = false
        } else if topTextField.text != login && bottomTextField.text != password {
            let alert = UIAlertController(title: "Ошибка авторизации", message: "проверьте правильность ввода логина и пароля", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "OK", style: .destructive)
            alert.addAction(cancelAction)
            present(alert, animated: true)
        } else if topTextField.text == login && bottomTextField.text == password {
            let vc = ProfileViewController()
            self.navigationController?.pushViewController(vc, animated: false)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let colorSet = hexStringToUIColor(hex: "#4885CC")
        buttonDidPressed.backgroundColor = colorSet
        view.addSubview(scrollView)
        
        
        scrollView.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
//            для работы при развороте экрана
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -400),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        [vkImage, stackViewText, buttonDidPressed, alertlabel].forEach({ contentView.addSubview($0) })
        
        [topTextField, dividingStrip, bottomTextField].forEach {stackViewText.addArrangedSubview($0) }
        
        NSLayoutConstraint.activate([
            vkImage.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 120),
            vkImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            vkImage.widthAnchor.constraint(equalToConstant: 100),
            vkImage.heightAnchor.constraint(equalToConstant: 100),
        
            stackViewText.topAnchor.constraint(equalTo: vkImage.safeAreaLayoutGuide.bottomAnchor, constant: 120),
            stackViewText.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            stackViewText.heightAnchor.constraint(equalToConstant: 100),
            stackViewText.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            topTextField.leadingAnchor.constraint(equalTo: stackViewText.leadingAnchor, constant: 16),
            
            dividingStrip.topAnchor.constraint(equalTo: topTextField.bottomAnchor),
            dividingStrip.leadingAnchor.constraint(equalTo: stackViewText.leadingAnchor),
            dividingStrip.trailingAnchor.constraint(equalTo: stackViewText.trailingAnchor),
            dividingStrip.heightAnchor.constraint(equalToConstant: 0.5),
            
            bottomTextField.leadingAnchor.constraint(equalTo: stackViewText.leadingAnchor, constant: 16),
            
            buttonDidPressed.topAnchor.constraint(equalTo: stackViewText.bottomAnchor, constant: 16),
            buttonDidPressed.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            buttonDidPressed.heightAnchor.constraint(equalToConstant: 50),
            buttonDidPressed.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            buttonDidPressed.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            alertlabel.topAnchor.constraint(equalTo: stackViewText.bottomAnchor, constant: 3),
            alertlabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
}
    

