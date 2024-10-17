import Foundation

@available(*, deprecated, renamed: "PeripheryScanOptionsBuilder")
public typealias PeripheryArgumentsBuilder = PeripheryScanOptionsBuilder

@resultBuilder
public struct PeripheryScanOptionsBuilder {
    public static func buildBlock(_ components: PeripheryScanOptions...) -> [PeripheryScanOptions] {
        components
    }

    public static func buildEither(first component: [PeripheryScanOptions]) -> PeripheryScanOptions {
        component.first ?? .custom("")
    }

    public static func buildEither(second component: [PeripheryScanOptions]) -> PeripheryScanOptions {
        component.first ?? .custom("")
    }

    public static func buildOptional(_ component: [PeripheryScanOptions]?) -> PeripheryScanOptions {
        component?.first ?? .custom("")
    }

    public static func buildFinalResult(_ component: [PeripheryScanOptions]) -> [String] {
        component.compactMap { $0.optionString.isEmpty ? nil : $0.optionString }
    }

    public static func buildArray(_ components: [[PeripheryScanOptions]]) -> PeripheryScanOptions {
        .custom(
            components
                .flatMap { $0.map { $0.optionString } }
                .joined(separator: " ")
        )
    }
}
