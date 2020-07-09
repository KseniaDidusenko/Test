//
//  ScreenPreviewManager.swift
//
//  Created by Oksana Didusenko on 23.01.2020.
//  Copyright © 2020. All rights reserved.
//

import UIKit

struct MenuItems {
  let title: String
  let image: UIImage?
  let style: UIPreviewAction.Style
  var handler: EmptyClosure

  init(title: String, image: UIImage? = nil, style: UIPreviewAction.Style, handler: @escaping (EmptyClosure)) {
    self.title = title
    self.image = image
    self.style = style
    self.handler = handler
  }
}

typealias MenuItemsType = (actions: [MenuItems], menuTitle: String?)

class ScreenPreviewManager {

  // MARK: - Public properties

  var previewController = UIViewController()

  // MARK: - Private properties

  private let actions: [MenuItems]?
  private let menuTitle: String?

  // MARK: - Initializer

  init(previewController: UIViewController, menuOptions: MenuItemsType) {
    self.actions = menuOptions.actions
    self.menuTitle = menuOptions.menuTitle
    self.previewController = previewController
  }

  // MARK: - Public API

  func createMenuItems() -> [UIPreviewAction] {
    guard let actions = actions else { return [UIPreviewAction]() }
    let actionsArray = actions.compactMap { item in
      UIPreviewAction(title: item.title, style: item.style) { _, _ in
        item.handler()
      }
    }
    return actionsArray
  }

  @available(iOS 13.0, *)
  func createConfiguration() -> UIContextMenuConfiguration {
    let configuration = UIContextMenuConfiguration(identifier: nil,
                                                   previewProvider: { self.previewController },
                                                   actionProvider: { _ in UIMenu(title: self.menuTitle ?? "",
                                                                                 children: self.createMenuItems()) })
    return configuration
  }

  // MARK: - Private API

  @available(iOS 13.0, *)
  private func createMenuItems() -> [UIAction] {
    guard let actions = actions else { return [UIAction]() }
    let actionsArray = actions.compactMap { item in
      UIAction(title: item.title, image: item.image, identifier: nil) { _ in
        item.handler()
      }
    }
    return actionsArray
  }
}
