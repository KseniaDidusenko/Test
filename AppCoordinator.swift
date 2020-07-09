//
//  AppCoordinator.swift
//
//  Created by Oksana Didusenko on 10/28/19.
//  Copyright © 2019 All rights reserved.
//

import UIKit

private let kUserRegisteredKey = (Bundle.main.bundleIdentifier ?? "") + ".UserRegistered"

class AppCoordinator: Coordinator {

    // MARK: - Public properties

    var isUserRegistered: Bool {
        get { return UserDefaults.standard.bool(forKey: kUserRegisteredKey) }
        set { UserDefaults.standard.set(newValue, forKey: kUserRegisteredKey) }
    }
    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?
    var navigationController: UINavigationController
    let window: UIWindow

    // MARK: - Private properties

    private var isTokenExists: Bool {
        PersistentDataManager.shared().token != nil
    }

    // MARK: - Initializer

    init(navController: UINavigationController, window: UIWindow) {
        self.navigationController = navController
        self.navigationController.isNavigationBarHidden = true
        self.window = window
    }

    // MARK: - Public API

    func start() {
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        runApplication()
    }

    func startOnboarding() {
        let onboardingCoordinator = OnboardingCoordinator(navController: navigationController)
        onboardingCoordinator.parentCoordinator = self
        childCoordinators.append(onboardingCoordinator)
        onboardingCoordinator.start()
    }

    func signUp() {
        let joinCoordinator = JoinCoordinator(navController: navigationController)
        joinCoordinator.parentCoordinator = self
        childCoordinators.append(joinCoordinator)
        joinCoordinator.start()
    }

    func startMain() {
        let mainCoordinator = MainCoordinator(navController: navigationController)
        mainCoordinator.parentCoordinator = self
        childCoordinators.append(mainCoordinator)
        mainCoordinator.start()
    }

    func logout() {
        runApplication()
    }

    func startVehicleInfo() {
        let vehicleCoordinator = VehicleCoordinator(navController: navigationController)
        vehicleCoordinator.parentCoordinator = self
        childCoordinators.append(vehicleCoordinator)
        vehicleCoordinator.start()
    }

    // MARK: - Private API

    private func runApplication() {
        if self.isTokenExists {
            startMain()
        } else if !(PersistentDataManager.shared().isFirstStart ?? true) {
            signUp()
        } else {
            startOnboarding()
        }
    }
}
