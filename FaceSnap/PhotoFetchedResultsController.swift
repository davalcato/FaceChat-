//
//  PhotoFetchedResultsController.swift
//  FaceSnap
//
//  Created by Daval Cato on 10/29/16.
//  Copyright © 2016 Me2 Software. All rights reserved.
//

import UIKit
import CoreData

class PhotoFetchedResultsController: NSFetchedResultsController<NSFetchRequestResult>, NSFetchedResultsControllerDelegate {
    
    private let collectionView: UICollectionView
    
    init(fetchRequest: NSFetchRequest<NSFetchRequestResult>, managedObjectContext: NSManagedObjectContext, collectionView: UICollectionView) {
        
        self.collectionView = collectionView
        
        super.init(fetchRequest: fetchRequest, managedObjectContext: managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
        self.delegate = self
        
        executeFetch()
    }
    
    func executeFetch() {
        do {
            try performFetch()
        } catch let error as NSError {
            print("Unresolved error \(error), \(error.userInfo)")
        }
    }
    
    func performFetch(withPredicate predicate: NSPredicate?) {
        NSFetchedResultsController<NSFetchRequestResult>.deleteCache(withName: nil)
        fetchRequest.predicate = predicate
        executeFetch()
    }
    
    // MARK: - NSFetchedResultsControllerDelegate
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        collectionView.reloadData()
    }
}
























