//
//  AnimationView.swift
//  Navigation
//
//  Created by Петр Макаров on 26.05.2022.
//

import UIKit

// MARK: -

class AnimationView: UIView {

    // MARK: - Private Properties

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.isHidden = true
        return imageView
    }()

    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.isHidden = true
        view.alpha = 0.0
        return view
    }()

    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(closeAction), for: .touchUpInside)
        button.setBackgroundImage(UIImage(systemName: "xmark"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isHidden = true
        button.alpha = 0.0
        return button
    }()

    private var imageViewLeadingLayoutContraint = NSLayoutConstraint()
    private var imageViewHeightLayoutContraint = NSLayoutConstraint()
    private var imageViewWidthLayoutContraint = NSLayoutConstraint()
    private var imageViewTopLayoutContraint = NSLayoutConstraint()

    private var startPoint: CGPoint = CGPoint.zero
    private var startSize: CGSize = CGSize.zero

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods

    func animateZoomIn(point: CGPoint, size: CGSize, image: UIImage) {
        startPoint = point
        startSize = size

        imageView.image = image

        imageViewLeadingLayoutContraint.constant = startPoint.x
        imageViewHeightLayoutContraint.constant = startSize.height
        imageViewWidthLayoutContraint.constant = startSize.width
        imageViewTopLayoutContraint.constant = startPoint.y

        isHidden = false
        backgroundView.isHidden = false
        imageView.isHidden = false
        closeButton.isHidden = false

        self.layoutIfNeeded()

        UIView.animate(
            withDuration: 1.0,
            delay: 0.1,
            usingSpringWithDamping: 1.0,
            initialSpringVelocity: 0.3,
            options: .curveEaseInOut) {

                self.backgroundView.alpha = 0.9
                self.imageView.alpha = 1.0
                self.closeButton.alpha = 1.0

                let length: CGFloat = self.frame.width

                self.imageViewLeadingLayoutContraint.constant = (self.frame.width - length) / 2.0
                self.imageViewHeightLayoutContraint.constant = length
                self.imageViewWidthLayoutContraint.constant = length
                self.imageViewTopLayoutContraint.constant = (self.frame.height - length) / 2.0

                self.layoutIfNeeded()
            }
    }

    private func animateZoomOut() {
        UIView.animate(
            withDuration: 0.5,
            delay: 0.1,
            usingSpringWithDamping: 1.0,
            initialSpringVelocity: 0.3,
            options: .curveEaseOut) {

            self.backgroundView.alpha = 0.0
            self.imageView.alpha = 0.0
            self.closeButton.alpha = 0.0

            self.imageViewLeadingLayoutContraint.constant = self.startPoint.x
            self.imageViewHeightLayoutContraint.constant = self.startSize.height
            self.imageViewWidthLayoutContraint.constant = self.startSize.width
            self.imageViewTopLayoutContraint.constant = self.startPoint.y

            self.layoutIfNeeded()

        } completion: { finish in

            self.isHidden = true
            self.backgroundView.isHidden = true
            self.imageView.isHidden = true
            self.closeButton.isHidden = true
        }
    }

    // MARK: - Private Methods

    private func layout() {
        self.isHidden = true

        [backgroundView, imageView, closeButton].forEach { addSubview($0) }

        imageViewTopLayoutContraint = imageView.topAnchor.constraint(equalTo: topAnchor, constant: 0.0)
        imageViewLeadingLayoutContraint = imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0.0)
        imageViewWidthLayoutContraint = imageView.widthAnchor.constraint(equalToConstant: 0.0)
        imageViewHeightLayoutContraint = imageView.heightAnchor.constraint(equalToConstant: 0.0)

        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),

            imageViewTopLayoutContraint,
            imageViewLeadingLayoutContraint,
            imageViewWidthLayoutContraint,
            imageViewHeightLayoutContraint,

            closeButton.topAnchor.constraint(equalTo: topAnchor, constant: 24.0),
            closeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24.0)
        ])
    }

    @objc private func closeAction (sender: UIButton) {
        animateZoomOut()
    }
}
