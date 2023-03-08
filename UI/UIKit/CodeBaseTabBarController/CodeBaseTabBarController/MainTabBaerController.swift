import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        let firstViewController = UINavigationController.init(rootViewController: TabViewController(title: "First Tab", backgroundColor: .red))
        let secondViewController = UINavigationController.init(rootViewController: TabViewController(title: "Seconds Tab", backgroundColor: .blue))
        let thirdViewController = UINavigationController.init(rootViewController: TabViewController(title: "Third Tab", backgroundColor: .green))
        
        self.viewControllers = [firstViewController, secondViewController, thirdViewController]
        
        let firstTabBarItem = UITabBarItem(title: "First", image: UIImage(systemName: "house"), tag: 0)
        let secondsTabBarItem = UITabBarItem(title: "Seconds", image: UIImage(systemName: "house"), tag: 1)
        let thirdTabBarItem = UITabBarItem(title: "Third", image: UIImage(systemName: "house"), tag: 2)
        
        firstViewController.tabBarItem = firstTabBarItem
        secondViewController.tabBarItem = secondsTabBarItem
        thirdViewController.tabBarItem = thirdTabBarItem
    }
    
}
