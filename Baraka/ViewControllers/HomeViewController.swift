//
//  HomeViewController.swift
//  Baraka
//
//  Created by Nour Araar on 7/16/22.
//

import UIKit
import Combine


class HomeViewController: UICollectionViewController {
    
    enum Section: String, CaseIterable {
        case stocks = "Stocks"
        case latestNews = "Latest News"
        case news = "News"
    }
    
    var viewModel: HomeViewModel?
    private var subscriptions = Set<AnyCancellable>()
    
    private var dataSource:
    UICollectionViewDiffableDataSource<Section, AnyHashable>?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.collectionViewLayout = generateLayout()
        setupCollectionView()
        regiserToPublishers()
    }
    
    func setViewModel(_ viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
    
    private func regiserToPublishers() {
        viewModel?.stocksPublisher.sink(receiveValue: { [weak self] stocks in
            self?.update(section: .stocks, items: stocks)
        }).store(in: &subscriptions)
        
        viewModel?.latestNewsPublisher.sink(receiveValue: { [weak self] news in
            self?.update(section: .latestNews, items: news)
        }).store(in: &subscriptions)
        
        viewModel?.newsPublisher.sink(receiveValue: { [weak self] news in
            self?.update(section: .news, items: news)
        }).store(in: &subscriptions)
    }
    
    
    
    private func setupCollectionView() {
        dataSource = UICollectionViewDiffableDataSource
        <Section, AnyHashable>(collectionView: collectionView) {
            (collectionView, indexPath, item) -> UICollectionViewCell? in
            
            let sectionType = Section.allCases[indexPath.section]
            switch sectionType {
            case .stocks:
                guard let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: "StockCell",
                    for: indexPath) as? StockCell,
                      let item = item as? Stock
                else { fatalError("Could not create new cell") }
                let viewModel = StockCellViewModel(stock: item)
                cell.configure(with: viewModel)
                return cell
                
            case .latestNews:
                guard let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: "LatestNewsCell",
                    for: indexPath) as? LatestNewsCell,
                      let item = item as? Article
                else { fatalError("Could not create new cell") }
                let viewModel = LatestNewsCellViewModel(article: item)
                cell.configure(with: viewModel)
                return cell
                
            case .news:
                guard let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: "NewsCell",
                    for: indexPath) as? NewsCell,
                      let item = item as? Article
                else { fatalError("Could not create new cell") }
                
                let viewModel = NewsCellViewModel(article: item)
                cell.configure(with: viewModel)
                return cell
            }
        }
        
        dataSource?.supplementaryViewProvider = { (
            collectionView: UICollectionView,
            kind: String,
            indexPath: IndexPath) -> UICollectionReusableView? in
            
            guard let supplementaryView = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: "HeaderCell",
                for: indexPath) as? HeaderCell else { fatalError("Cannot create header view") }
            
            supplementaryView.label.text = Section.allCases[indexPath.section].rawValue
            return supplementaryView
        }
        
        registerCells()
        dataSource?.apply(snapshotForCurrentState(), animatingDifferences: false)
    }
    
    private func registerCells() {
        collectionView.register(UINib(nibName: "StockCell", bundle: nil), forCellWithReuseIdentifier: "StockCell")
        collectionView.register(UINib(nibName: "LatestNewsCell", bundle: nil), forCellWithReuseIdentifier: "LatestNewsCell")
        collectionView.register(UINib(nibName: "NewsCell", bundle: nil), forCellWithReuseIdentifier: "NewsCell")
        collectionView.register(
            UINib(nibName: "HeaderCell", bundle: nil),
            forSupplementaryViewOfKind: "sectionHeaderElementKind",
            withReuseIdentifier: "HeaderCell")
    }
    
    func generateLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex: Int,
                                                            layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            let sectionLayoutKind = Section.allCases[sectionIndex]
            switch (sectionLayoutKind) {
            case .stocks: return LayoutFactory.generateStocksLayout()
            case .latestNews: return LayoutFactory.generateLatestNewsLayout()
            case .news: return LayoutFactory.generateNewsLayout()
            }
        }
        return layout
    }
        
    func snapshotForCurrentState() -> NSDiffableDataSourceSnapshot<Section, AnyHashable> {
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, AnyHashable>()
        snapshot.appendSections([.stocks, .latestNews, .news])
        
        return snapshot
    }
    
    func update(section: Section, items: [AnyHashable] ) {
        guard let dataSource = dataSource else { return }
        var snapshot = dataSource.snapshot()
        snapshot.appendItems(items, toSection: section)
        dataSource.apply(snapshot)
    }

}

