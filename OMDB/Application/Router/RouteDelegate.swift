//
//  RouteDelegate.swift
//  OMDB
//
//  Created by Rodrigo on 27/11/17.
//  Copyright © 2017 Rodrigo. All rights reserved.
//

import UIKit

public protocol RouteDelegate: class {
    @discardableResult func performSegueToRouteWith(name: RouteName, onCompletion: (() -> Swift.Void)?) -> UIViewController?
    @discardableResult func performSegueToRouteWith(name: RouteName, withMode mode: PresentMode?, onCompletion: (() -> Swift.Void)?) -> UIViewController?
    func dismissViewController(onCompletion: (() -> Swift.Void)?)
}

