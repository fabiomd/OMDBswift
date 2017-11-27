//
//  Router.swift
//  OMDB
//
//  Created by Rodrigo on 27/11/17.
//  Copyright © 2017 Rodrigo. All rights reserved.
//

import Foundation
import UIKit

public class Router {
    fileprivate let window: UIWindow
    fileprivate var navigationController: NavigationController!
    
    
    init(window: UIWindow, withRouteName name: RouteName = .welcome) {
        self.window = window
        
        if let intialViewController = viewControllerForRouteWith(name: name){
            navigationController = NavigationController(rootViewController: intialViewController)
        }
        else {
            debugPrint("The route named: \(name) is invalid!")
        }
        
        window.rootViewController = navigationController.topViewController?.viewController
    }
}


// Creating routes
extension Router {
    @discardableResult public func unwind(animated: Bool = true, interactively: Bool = false) -> UIViewController?{
        let destinationViewController = navigationController.viewControllers[navigationController.viewControllers.count - 1]
        navigationController.dismissLastViewController(animated: animated, interactively: interactively)
        return destinationViewController.viewController
    }
    
    fileprivate func viewControllerForRouteWith(name: RouteName, withCodableObject object: Codable? = nil) -> UIViewController?{
        switch name {
        case .weather:
            return UIStoryboard.instantiateViewController(withIdentifier: .terms,
                                                          onStoryboardWithName: .terms,
                                                          routeDelegate: self)
            
        default:
            return nil
        }
    }
}

extension Router: RouteDelegate {
    @discardableResult public func performSegueToRouteWith(name: RouteName, onCompletion: (() -> Swift.Void)? = nil) -> UIViewController? {
        return performSegueToRouteWith(name: name, withMode: .present(animated: true, interactively: true), withCodableObject: nil, onCompletion: onCompletion)
    }
    @discardableResult public func performSegueToRouteWith(name: RouteName, withMode mode: PresentMode?, onCompletion: (() -> Swift.Void)? = nil) -> UIViewController? {
        return performSegueToRouteWith(name: name, withMode: mode, withCodableObject: nil, onCompletion: onCompletion)
    }
    @discardableResult func performSegueToRouteWith(name: RouteName, withCodableObject object: Codable?, onCompletion: (() -> Swift.Void)? = nil) -> UIViewController? {
        return performSegueToRouteWith(name: name, withMode: .present(animated: true, interactively: true), withCodableObject: object, onCompletion: onCompletion)
    }
    @discardableResult public func performSegueToRouteWith(name: RouteName, withMode mode: PresentMode? = .present(animated: true, interactively: true), withCodableObject object: Codable? = nil, onCompletion: (() -> Swift.Void)? = nil) -> UIViewController? {
        
        guard let destinationViewController = viewControllerForRouteWith(name: name, withCodableObject: object) else {
            return nil
        }
        
        navigationController.present(viewController: destinationViewController, presentMode: mode!, completion: onCompletion)
        
        return destinationViewController
    }
    
    public func dismissViewController(onCompletion: (() -> Swift.Void)? = nil) {
        navigationController.dismissLastViewController(animated: true, interactively: false, completion: onCompletion)
    }
}

