//
//  SearchResultViewController.swift
//  NetflixClone
//
//  Created by 高橋蓮 on 2022/02/27.
//

import UIKit
protocol SearchResultViewConstollerDelegate: AnyObject {
    func SearchResultViewControllerDidtap(_ viewModel: TItlePreviewViewModel)
}

class SearchResultViewController: UIViewController {
    
    
    public var titles: [Title] = [Title]()
    public weak var delegate: SearchResultViewConstollerDelegate?
    
    public let searchResultView: UICollectionView  = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 3 - 10, height: 200)
        layout.minimumLineSpacing = 0
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(TitleCollectionViewCell.self, forCellWithReuseIdentifier: TitleCollectionViewCell.identifer)
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        view.addSubview(searchResultView)
        searchResultView.delegate = self
        searchResultView.dataSource = self
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        searchResultView.frame = view.bounds
    }
    
}
extension SearchResultViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TitleCollectionViewCell.identifer, for: indexPath) as? TitleCollectionViewCell else {
            return UICollectionViewCell()
        }
        let title = titles[indexPath.row]
        cell.configure(with: title.poster_path ?? "")
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let title = titles[indexPath.row]
        let titleName = title.original_title ?? ""
        
        APICaller.shared.getMovie(with: titleName) { [weak self] result in
            switch result {
            case .success(let videoElement):
                self?.delegate?.SearchResultViewControllerDidtap(TItlePreviewViewModel(title: title.original_title ?? "", youtubeVideo: videoElement, titleOverView: title.overview ?? ""))
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }
    
}
