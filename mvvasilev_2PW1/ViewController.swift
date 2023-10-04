//
//  ViewController.swift
//  mvvasilev_2PW1
//
//  Created by Matvey Vasilyev on 03.10.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var views: [UIView]!
    func setRandomBackgroundColor(views: [UIView]) {
            var colors: [UIColor] = []
            while colors.count < views.count {
                let randomRed = CGFloat.random(in: 0...1)
                let randomGreen = CGFloat.random(in: 0...1)
                let randomBlue = CGFloat.random(in: 0...1)
                let color = UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1)
                if colors.contains(color) == false {
                    colors.append(color)
                }
            }
        for index in 0...(views.count - 1) {
            views[index].backgroundColor = colors[index]
        }
    }
    func setRandomCornerRadius(views: [UIView]) {
        var randomRadiuses: [Float] = []
            while randomRadiuses.count < views.count {
                let randomRadius = Float.random(in: 0...100)
                if randomRadiuses.contains(randomRadius) == false {
                    randomRadiuses.append(randomRadius)
                }
            }
        for index in 0...(views.count - 1) {
            views[index].layer.cornerRadius = CGFloat(randomRadiuses[index])
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        UIView.animate(withDuration: 0.3, animations: { [self] in
            setRandomBackgroundColor(views: self.views)
            setRandomCornerRadius(views: self.views)})
    }
    @IBAction func buttonWasPressed(_ sender: Any) {
        let button = sender as? UIButton
        UIView.animate(withDuration: 0.3, animations: { [self] in
            setRandomBackgroundColor(views: self.views)
            setRandomCornerRadius(views: self.views)
            button?.isEnabled = false
        }, completion: {_ in button?.isEnabled = true})
    }
    
}
