//
//  ViewController.swift
//  Navigation
//
//  Created by Петр Макаров on 04.04.2022.
//

import UIKit

struct Post {
    var title: String
}

class FeedViewController: UIViewController {
    
    let postOne = Post(title: "Post")
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
    return stackView
    }()
    
    private let buttonTop: UIButton = {
        let buttonTop = UIButton()
        buttonTop.setTitle("Red Ball", for: .normal)
        buttonTop.backgroundColor = .lightGray
        buttonTop.layer.cornerRadius = 10
        buttonTop.addTarget(self, action: #selector(tapAction), for: .touchDown)
        buttonTop.translatesAutoresizingMaskIntoConstraints = false
        return buttonTop
    }()
    
    private let buttonBottom: UIButton = {
        let buttonBottom = UIButton()
        buttonBottom.setTitle("Collection", for: .normal)
        buttonBottom.backgroundColor = .lightGray
        buttonBottom.layer.cornerRadius = 10
        buttonBottom.addTarget(self, action: #selector(collection), for: .touchDown)
        buttonBottom.translatesAutoresizingMaskIntoConstraints = false
        return buttonBottom
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(stackView)
        
        [buttonTop, buttonBottom].forEach {stackView.addArrangedSubview($0) }
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 100),
            stackView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    @objc private func tapAction() {
        let vc = InfoViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func collection() {
        let vc = PhotosViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

}

