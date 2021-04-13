//
//  PageViewController.swift
//  UIPageViewController
//
//  Created by Никита Коголенок on 1.02.21.
//

import UIKit

class PageViewController: UIPageViewController {
    // MARK: - Variabels
    let presentScreenContent = [
        "Первая страница презентации,рассказывающая о том,что наше приложение из себя представляет",
        "Вторая страница презентации,расказывает о какой удобной фишке приложение",
        "Третья страница презентации тоже рассказывает о чем-то очень интересном",
        "Ну и на конец посденяя страница презентации с напудствием в добрый путь =)",
        ""
    ]
    let emojiArray = ["😉", "🤓","🧐","👍", ""]
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        if let contentViewController = showViewControllerAtIndex(0) {
            setViewControllers([contentViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    func showViewControllerAtIndex(_ index: Int) -> ContentViewController? {
        
        guard index >= 0 else { return nil}
        guard index < presentScreenContent.count else {
            let userDefoults = UserDefaults.standard
            userDefoults.set(true, forKey: "presentationsWasViewed")
            dismiss(animated: true, completion: nil)
            return nil
        }
        guard let contentViewController = storyboard?.instantiateViewController(withIdentifier: "ContentViewController") as? ContentViewController else {return nil }
        
        contentViewController.presentText = presentScreenContent[index]
        contentViewController.emoji = emojiArray[index]
        contentViewController.curentPage = index
        contentViewController.numberOfPage = index
        
        return contentViewController
    }
}
extension PageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        var pageNumber = (viewController as! ContentViewController).curentPage
        pageNumber -= 1
        
        return showViewControllerAtIndex(pageNumber)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        var pageNumber = (viewController as! ContentViewController).curentPage
        pageNumber += 1
        
        return showViewControllerAtIndex(pageNumber)
    }
    
    
}
