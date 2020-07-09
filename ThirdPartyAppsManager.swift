//
//  ThirdPartyAppsManager.swift
//
//  Created by Oksana Didusenko on 2/11/20.
//  Copyright © 2020. All rights reserved.
//

import UIKit

typealias ClientUrl = (url: URL, title: String)

class ThirdPartyAppsManager {

  // MARK: TODO - Think over a more generic manager

  private struct ThirdPartyMailClients {
    let scheme: String
    let root: String
    let recipientKey: String
    let subjectKey: String
    let bodyKey: String

    func composeUrl(recipient: String, subject: String? = nil, body: String? = nil) -> URL? {
      var components = URLComponents(string: "\(scheme):\(root)")
      components?.scheme = scheme
      var queryItems: [URLQueryItem] = []
      queryItems.append(URLQueryItem(name: recipientKey, value: recipient))
      if let subject = subject {
        queryItems.append(URLQueryItem(name: subjectKey, value: subject))
      }
      if let body = body {
        queryItems.append(URLQueryItem(name: bodyKey, value: body))
      }
      components?.queryItems = queryItems
      guard let URL = components?.url else { return URLComponents().url }
      return URL
    }
  }

  private enum ThirdPartyApps: String, CaseIterable {
    case mailto = "Apple Mail"
    case msOutlook = "MS Outlook"
    case googlegmail = "Google Mail"
    case ymail = "Yahoo"

    var scheme: ThirdPartyMailClients {
      switch self {
      case .mailto:
        return ThirdPartyMailClients(scheme: "mailto", root: "", recipientKey: "", subjectKey: "subject", bodyKey: "body")
      case .msOutlook:
        return ThirdPartyMailClients(scheme: "ms-outlook", root: "//compose", recipientKey: "to", subjectKey: "subject", bodyKey: "body")
      case .googlegmail:
        return ThirdPartyMailClients(scheme: "googlegmail", root: "///co", recipientKey: "to", subjectKey: "subject", bodyKey: "body")
      case .ymail:
        return ThirdPartyMailClients(scheme: "ymail", root: "//mail/compose", recipientKey: "to", subjectKey: "subject", bodyKey: "body")
      }
    }
  }

  // MARK: - Public properties

  // MARK: - Private properties

  // MARK: - Initializer

  // MARK: - Public API

  func getAvailableMailClientsUrl(recipient: String, subject: String? = nil, body: String? = nil) -> [ClientUrl] {
    guard let url = URL(string: "https://apps.apple.com/us/app/mail/id1108187098") else { return [ClientUrl]() }
    var urlArray: [ClientUrl] = ThirdPartyApps.allCases.compactMap {
      guard let url = $0.scheme.composeUrl(recipient: recipient, subject: subject, body: body),
        UIApplication.shared.canOpenURL(url) else { return nil }
      return ClientUrl(url: url, title: $0.rawValue)
    }
    guard !urlArray.isEmpty else {
      urlArray.append(ClientUrl(url: url, title: "App Store"))
      return urlArray
    }
    return urlArray
  }

  // MARK: - Private API

}
