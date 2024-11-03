//
//  SearchViewController.swift
//  CleanCoordinator
//
//  Created by Jisoo Ham on 10/27/24.
//

import UIKit

import RxSwift
import SnapKit

final class SearchViewController: BaseNavigationViewController {
    var disposeBag: DisposeBag = DisposeBag()
    
    private let searchController: UISearchController = {
        let search = UISearchController(searchResultsController: nil)
        search.searchBar.placeholder = "시리즈 및 영화를 검색해보세요"
        return search
    }()
    private lazy var movieCV: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
        view.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: SearchCollectionViewCell.identifier)
        view.backgroundColor = .black
        return view
    }()
    
    private let btn: UIButton = {
        let btn = UIButton()
        btn.setTitle("하이루", for: .normal)
        return btn
    }()
    
    private let searchVM: SearchViewModel
    
    init(searchVM: SearchViewModel) {
        self.searchVM = searchVM
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func bind() {
        
        let input = SearchViewModel.Input(
            searchEnterTapped:
                searchController.searchBar.rx.searchButtonClicked
                .withLatestFrom(searchController.searchBar.rx.text.orEmpty),
            btnTap: btn.rx.tap.map { () }
        )
        
        let output = searchVM.transform(input: input)
        
        output.searchedList
            .drive(movieCV.rx.items(cellIdentifier: SearchCollectionViewCell.identifier, cellType: SearchCollectionViewCell.self)) { row, element, cell in
                cell.setImage(posterPath: element.posterPath)
            }
            .disposed(by: disposeBag)
        
        output.searchedError
            .drive(with: self) { owner, text in
                print(text)
            }
            .disposed(by: disposeBag)
    }
    
    override func setNavigation() {
        super.setNavigation()
        
        navigationItem.searchController = searchController
        title = "영화 검색"
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    override func setHierarchy() {
        view.addSubview(movieCV)
        [movieCV, btn]
            .forEach { view.addSubview($0) }
    }
    
    override func setConstraints() {
        btn.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(40)
        }
        movieCV.snp.makeConstraints { make in
            make.top.equalTo(btn)
            make.horizontalEdges.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

extension SearchViewController {
    private func collectionViewLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0 / 3.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(
            top: 0,
            leading: 5,
            bottom: 5,
            trailing: 5
        )

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalWidth(4.0 / 9.0)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitem: item,
            count: 3
        )
        
        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}

