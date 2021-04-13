//
//  ContentViewController.swift
//  UIPageViewController
//
//  Created by Никита Коголенок on 1.02.21.
//

import UIKit

class ContentViewController: UIViewController {
    // MARK: - Variabels
    var presentText = ""
    var emoji = ""
    var curentPage = 0    // Номер текущей страницы
    var numberOfPage = 0  // Количество страниц
    // MARK: - Outlet
    @IBOutlet weak var presentTextLabel: UILabel!
    @IBOutlet weak var emojiLabel: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presentTextLabel.text = presentText
        emojiLabel.text = emoji
        pageControl.numberOfPages = numberOfPage
        pageControl.currentPage = curentPage
    }
}
