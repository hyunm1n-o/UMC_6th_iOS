//
//  CellType.swift
//  DG2_codebase
//
//  Created by 오현민 on 5/6/24.
//

import Foundation
import UIKit

enum MyItem: Equatable {
  case vertical(UIImage?, String, String, String?, UIImage?, UIImage?, String?, String?) // thumbnailImage, title, subtitle, price, dibimg, chatimg, dib, chat
  case collection(String, [CollectionViewItem]) // title, collection
}

enum CollectionViewItem: Equatable {
  case horizontal(UIImage?, String, String)
}


