//
//  UICollectionViewDiffableDataSource+Ext.swift
//  Baraka
//
//  Created by Nour Araar on 7/17/22.
//

import UIKit

extension UICollectionViewDiffableDataSource {

    func replaceItems(_ items : [ItemIdentifierType], in section: SectionIdentifierType) {
        var currentSnapshot = snapshot()
        let itemsOfSection = currentSnapshot.itemIdentifiers(inSection: section)
        currentSnapshot.deleteItems(itemsOfSection)
        currentSnapshot.appendItems(items, toSection: section)
        currentSnapshot.reloadSections([section])
        apply(currentSnapshot, animatingDifferences: false)
    }
}
