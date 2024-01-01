//
//  RepoWatcherWidgetBundle.swift
//  RepoWatcherWidget
//
//  Created by Danielle Lewis on 12/23/23.
//

import WidgetKit
import SwiftUI

@main
struct RepoWatcherWidgets: WidgetBundle {
    var body: some Widget {
        CompactRepoWidget()
        ContributorWidget()
    }
}
