////
////  PostTableViewCell.swift
////  Navigation
////
////  Created by Петр Макаров on 12.05.2022.
////
//
//import UIKit
//
//class PostTableViewCell: UITableViewCell {
//
//
//    private let whiteView: UIView = {
//        let whiteView = UIView()
//        whiteView.translatesAutoresizingMaskIntoConstraints = false
//        return whiteView
//    }()
//
//    private let titlePost: UILabel = {
//        $0.translatesAutoresizingMaskIntoConstraints = false
//        $0.font = UIFont.systemFont(ofSize: 20, weight: .bold)
//        $0.textColor = .black
//        $0.numberOfLines = 2
//        $0.text = "testTextTitle"
//        return $0
//    }(UILabel())
//
//    private let imagePost: UIImageView = {
//        $0.translatesAutoresizingMaskIntoConstraints = false
//        $0.image = UIImage(named: "IMG_6394")
//        $0.contentMode = .scaleAspectFit
//        $0.backgroundColor = .black
//        return $0
//    }(UIImageView())
//
//    private let desciptionPost: UILabel = {
//        $0.translatesAutoresizingMaskIntoConstraints = false
//        $0.numberOfLines = 0
//        $0.textColor = .systemGray
//        $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
//        return $0
//    }(UILabel())
//
//    private let newStack: UIStackView = {
//        $0.translatesAutoresizingMaskIntoConstraints = false
//        $0.axis = .horizontal
//        $0.distribution = .equalSpacing
//        return $0
//    }(UIStackView())
//
//    private var likesPost: UILabel = {
//        $0.translatesAutoresizingMaskIntoConstraints = false
//        $0.textColor = .black
//        $0.font = UIFont.systemFont(ofSize: 16, weight: .regular)
//        return $0
//    }(UILabel())
//
//    private var viewsPost: UILabel = {
//        $0.translatesAutoresizingMaskIntoConstraints = false
//        $0.textColor = .black
//        $0.font = UIFont.systemFont(ofSize: 16, weight: .regular)
//        return $0
//    }(UILabel())
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        backgroundColor = .systemBackground
//        layout()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    func setupCell(_ post: PostModel) {
//        titlePost.text = post.title
//        imagePost.image = post.image
//        likesPost.text = "Likes: \(post.likes)"
//        viewsPost.text = "Views: \(post.views)"
//        desciptionPost.text = post.description
//    }
//
//    private func layout() {
//        [whiteView, titlePost, newStack, imagePost, desciptionPost].forEach{contentView.addSubview($0)}
//
//        newStack.addArrangedSubview(likesPost)
//        newStack.addArrangedSubview(viewsPost)
//
//        let screenSize: CGRect = UIScreen.main.bounds
//        let inset: CGFloat = 16
//
//        NSLayoutConstraint.activate([
//
//            whiteView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
//            whiteView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
//            whiteView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
//            whiteView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
//
//            titlePost.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: inset),
//            titlePost.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: inset),
//            titlePost.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -inset),
//
//            imagePost.topAnchor.constraint(equalTo: titlePost.bottomAnchor, constant: inset),
//            imagePost.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor),
//            imagePost.widthAnchor.constraint(equalToConstant: screenSize.width),
//            imagePost.heightAnchor.constraint(equalToConstant: screenSize.width),
//
//            desciptionPost.topAnchor.constraint(equalTo: imagePost.bottomAnchor, constant: inset),
//            desciptionPost.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: inset),
//            desciptionPost.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -inset),
//
//            newStack.topAnchor.constraint(equalTo: desciptionPost.bottomAnchor, constant: inset),
//            newStack.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: inset),
//            newStack.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -inset),
//            newStack.bottomAnchor.constraint(equalTo: whiteView.bottomAnchor,constant: -inset)
//        ])
//    }
//}
