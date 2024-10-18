//
//  StocksShortcut.swift
//  Runner
//
//  Created by Saurabh Yadav on 16/10/24.
//

import AppIntents
import Foundation

let stockName1 = "Apple"

struct MahnifiShortcut: AppShortcutsProvider {
    @available(iOS 16.0, *)
    static var appShortcuts: [AppShortcut] {
        AppShortcut(
            intent: AnalysisIntent(),
            phrases: [
                "summarize my query",
                "get assistance from \(.applicationName)",
                "Get analysis from \(.applicationName)",
            ]
        )
        AppShortcut(
            intent: GetStockIntent(),
            phrases: [
                "Get stock details from \(.applicationName) ",
                "Get \(.applicationName) stock details",
                "Hey \(.applicationName) show stock details",
                "stock details from \(.applicationName) ",
            ]
        )
        AppShortcut(
            intent: GreetingIntent(),
            phrases: [
                "Hello magnifi", "hello \(.applicationName)",
                "hey \(.applicationName)",
            ]
        )
        AppShortcut(
            intent: SuggestionIntent(),
            phrases: [
                "What else can I ask Magnifi",
                "what I can ask to \(.applicationName)",
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
                "suggestion for \(.applicationName)",
            ]
        )
        AppShortcut(
            intent: WatchlistIntent(),
            phrases: [
                "Show my \(.applicationName) watchlist",
                "Show \(.applicationName) watchlist",
                "Add to \(.applicationName) watchlist",
                "Delete from \(.applicationName) watchlist",
            ]
        )
    }
}
