import UIKit


class BaseTabBarViewController: UITabBarController {


    override func viewDidLoad() {
        super.viewDidLoad()

        let todayVC = self.makeTabItem(viewController: TodayVC(), title: "Hoje", image: "icone-hoje")

        let appsVC = self.makeTabItem(viewController: AppsVC(), title: "Apps", image: "icone-apps")

        let searchVC = self.makeTabItem(viewController: SearchVC(), title: "Busca", image: "icone-busca")

        // seta os view controllers
        viewControllers = [
            todayVC,
            appsVC,
            searchVC
        ]

        selectedIndex = 0
    }


    // cria os tabItens e adiciona seus controllers
    func makeTabItem(viewController: UIViewController, title: String, image: String) -> UIViewController {
        let navController = UINavigationController(rootViewController: viewController)
        navController.navigationBar.prefersLargeTitles = true
        navController.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.black]


        viewController.navigationItem.title = title
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = UIImage(named: image)
        viewController.view.backgroundColor = .white

        return navController
    }
}
