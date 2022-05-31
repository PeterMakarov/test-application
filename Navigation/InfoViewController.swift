//
//  InfoViewController.swift
//  Navigation
//
//  Created by Петр Макаров on 04.04.2022.
//

import UIKit

class InfoViewController: UIViewController {
    
    
   private let redBall: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .red
        $0.layer.cornerRadius = 50
        $0.isUserInteractionEnabled = true
        $0.alpha = 0.3
        return $0
    }(UIView())
    
    
    private var redBallHeight = NSLayoutConstraint()
    private var redBallWeight = NSLayoutConstraint()
    
    
//    closeAnimationButton.setBackgroundImage(UIImage(systemName: "xmark"), for: .normal)
//    closeAnimationButton.addTarget(self, action: #selector(closeAction), for: .touchUpInside)
    
    private let increaseButton: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .red
        $0.layer.cornerRadius = 25
        $0.setBackgroundImage(UIImage(systemName: "plus.circle"), for: .normal)
        $0.tintColor = .white
        $0.contentMode = .scaleAspectFit
        $0.addTarget(self, action: #selector(growing), for: .touchDown)
        return $0
    }(UIButton())
    
    @objc private func growing() {

        UIView.animate(
            withDuration: 1,
            delay: 0.1,
            usingSpringWithDamping: 0.3,
            initialSpringVelocity: 0.3,
            options: .curveEaseInOut) {
//                self.catImageView.bounds.width / 2
                self.redBallWeight.constant += 5
                self.redBallHeight.constant += 5
                self.redBall.alpha += 0.03
                self.redBall.layer.cornerRadius += 2.5
            }
    }
    
    
    private let decreaseButton: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .red
        $0.layer.cornerRadius = 25
        $0.setBackgroundImage(UIImage(systemName: "minus.circle"), for: .normal)
        $0.tintColor = .white
        $0.contentMode = .center
        $0.addTarget(self, action: #selector(down), for: .touchDown)
        return $0
    }(UIButton())
    
    @objc private func down() {

        UIView.animate(
            withDuration: 1,
            delay: 0.1,
            usingSpringWithDamping: 0.3,
            initialSpringVelocity: 0.3,
            options: .curveEaseInOut) {
                
                self.redBallWeight.constant -= 5
                self.redBallHeight.constant -= 5
                self.redBall.alpha -= 0.03
                self.redBall.layer.cornerRadius -= 2.5
            }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        makeButton()
        layout()
    }
    
    
    private func layout() {
        
        [redBall, increaseButton, decreaseButton].forEach {view.addSubview($0)}
        
        redBallHeight = redBall.heightAnchor.constraint(equalToConstant: 100)
        redBallWeight = redBall.widthAnchor.constraint(equalToConstant: 100)
        
        NSLayoutConstraint.activate([
            redBall.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            redBall.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            redBallHeight,
            redBallWeight,
            
            increaseButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            increaseButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            increaseButton.heightAnchor.constraint(equalToConstant: 50),
            increaseButton.widthAnchor.constraint(equalToConstant: 50),
            
            decreaseButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            decreaseButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            decreaseButton.heightAnchor.constraint(equalToConstant: 50),
            decreaseButton.widthAnchor.constraint(equalToConstant: 50),
            
            
        ])
    }
    
    private func makeButton() {
        let button = UIButton(frame: CGRect(x: view.center.x - 25, y: 750, width: 50, height: 50))
//        button.center = view.center
        button.setTitle("leave", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 25
        button.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        view.addSubview(button)
    }

    @objc private func tapAction() {
        let alert = UIAlertController(title: "Вернуться", message: "Вы уверены ?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Покинуть", style: .default) {
            _ in
            self.dismiss(animated: true)
            self.navigationController?.popViewController(animated: true)
        }

        let cancelAction = UIAlertAction(title: "Отмена", style: .destructive)
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
