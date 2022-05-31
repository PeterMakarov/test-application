//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Петр Макаров on 09.04.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    
    // MARK: - Private Properties
    
    private var postModel = PostModel.makeSomePost()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.identifier)
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        return tableView
    }()
    
    private lazy var profileHeaderView: UIView = {
        let profileView = ProfileHeaderView()
        profileView.backgroundColor = .lightGray
        return profileView
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

// MARK: - UITableViewDataSource

extension ProfileViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 1
        default: return postModel.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: PhotosTableViewCell.identifier, for: indexPath) as! PhotosTableViewCell
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
            cell.delegate = self
            cell.delegateView = self
            cell.tag = indexPath.row
            cell.setupCell(postModel[indexPath.row])
            return cell
        }
    }
}

// MARK: - UITableViewDelegate

extension ProfileViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0: return 150
        default: return UITableView.automaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            let photosVC = PhotosViewController()
            navigationController?.pushViewController(photosVC, animated: true)
        default:
            let detailVC = PostViewController()
            detailVC.setupVC(model: postModel[indexPath.row])
            navigationController?.pushViewController(detailVC, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0: return 200.0
        default: return 0.0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0: return profileHeaderView
        default: return nil
        }
    }
}


// MARK: - CustomPostTableleCellDelegate

extension ProfileViewController: CustomPostTableleCellDelegate {
    func liked(like: UILabel, cell: CustomTableViewCell) {
        var strLike = like.text
        var intLike = String(strLike!.dropFirst(6))
        like.text = "Likes:\((Int(intLike) ?? 0) + 1)"
        postModel[cell.tag].likes += 1
    }
}

// MARK: - PostViewControllerDelegate

extension ProfileViewController: PostViewControllerDelegate {
    
    func viewing(views: UILabel, cell: CustomTableViewCell) {
        var strView = views.text
        var intView = String(strView!.dropFirst(6))
        views.text = "Views:\((Int(intView) ?? 0) + 1)"
        postModel[cell.tag].views += 1
        let detailVC = PostViewController()
        detailVC.setupVC(model: postModel[cell.tag])
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

