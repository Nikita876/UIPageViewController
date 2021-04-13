//
//  ViewController.swift
//  UIPageViewController
//
//  Created by Никита Коголенок on 1.02.21.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Lifecycle
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        startPresentation()
    }
    // MARK: - Methods
    func startPresentation() {
        let userDefoult = UserDefaults.standard
        let presentationWasViewed = userDefoult.bool(forKey: "presentationsWasViewed")
        if presentationWasViewed == false {
            if let pageViewController = storyboard?.instantiateViewController(
                withIdentifier: "PageViewController") as? PageViewController {
                
                present(pageViewController, animated: true, completion: nil)
            }
        }
    }
}

