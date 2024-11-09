//
//  StocksShortcut.swift
//  Runner
//
//  Created by Saurabh Yadav on 16/10/24.
//

import AppIntents
import Foundation

struct MahnifiShortcut: AppShortcutsProvider {
    @available(iOS 16.0, *)
    static var appShortcuts: [AppShortcut] {
        AppShortcut(
            intent: AnalysisIntent(),
            phrases: [
                "Hey magnifi",
                "Askmagnifi",
                "Hello magnifi",
                "Hello \(.applicationName)",
            ]
        )
//        AppShortcut(
//            intent: GreetingIntent(),
//            phrases: [
//                "Hello \(.applicationName)",
//                "Hey \(.applicationName)",
//            ]
//        )
        AppShortcut(
            intent: SuggestionIntent(),
            phrases: [
                "What else can I ask Magnifi",
                "What I can ask to \(.applicationName)",
                "prompts of \(.applicationName)",
                "suggestion for \(.applicationName)",
            ]
        )
        AppShortcut(
            intent: SupportIntent(),
            phrases: [
                "help me \(.applicationName)",
                "\(.applicationName) support details",
                "\(.applicationName) customer support",
            ]
        )
        AppShortcut(
            intent: WatchlistIntent(),
            phrases: [
                "Show my \(.applicationName) watchlist",
                "Show \(.applicationName) watchlist",
            ]
        )
        AppShortcut(
            intent: PortfolioIntent(),
            phrases: [
                "Magnifi portfolio",
                "Magnifi holding",
                "show \(.applicationName) holding",
                "show \(.applicationName) portfolio",
            ]
        )
    }
}
