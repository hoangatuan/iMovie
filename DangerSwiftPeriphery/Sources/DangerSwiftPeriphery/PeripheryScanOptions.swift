import Foundation

@available(*, deprecated, renamed: "PeripheryScanOptions")
public typealias PeripheryArguments = PeripheryScanOptions

/// periphery scan command options
public enum PeripheryScanOptions {
    case config(String)
    case workspace(String)
    case project(String)
    case schemes([String])
    case targets([String])
    case indexExclude([String])
    case reportExclude([String])
    case reportInclude([String])
    case indexStorePath(String)
    case retainPublic
    case disableRedundantPublicAnalysis
    case retainAssignOnlyProperties
    case retainAssignOnlyPropertyTypes([String])
    case externalEncodableProtocols([String])
    case externalTestCaseClasses([String])
    case retainObjcAccessible
    case retainObjcAnnotated
    case retainUnusedProtocolFuncParams
    case cleanBuild
    case retainSwiftUIPreviews
    case skipBuild
    case relativeResults
    case strict
    case custom(String)
}

extension PeripheryScanOptions {
    var optionString: String {
        switch self {
        case .config(let config):
            return "--config \(config)"
        case .workspace(let workspace):
            return "--workspace \(workspace)"
        case .project(let project):
            return "--project \(project)"
        case .schemes(let schemes):
            return schemes
                .map({ "--schemes \($0)" })
                .joined(separator: " ")
        case .targets(let targets):
            return targets
                .map({ "--targets \($0)" })
                .joined(separator: " ")
        case .indexExclude(let indexes):
            return indexes
                .map({ "--index-exclude \($0)" })
                .joined(separator: " ")
        case .reportExclude(let reports):
            return reports
                .map({ "--report-exclude \($0)" })
                .joined(separator: " ")
        case .reportInclude(let reports):
            return reports
                .map({ "--report-include \($0)" })
                .joined(separator: " ")
        case .indexStorePath(let path):
            return "--index-store-path \(path)"
        case .retainPublic:
            return "--retain-public"
        case .disableRedundantPublicAnalysis:
            return "--disable-redundant-public-analysis"
        case .retainAssignOnlyProperties:
            return "--retain-assign-only-properties"
        case .retainAssignOnlyPropertyTypes(let types):
            return types
                .map({ "--retain-assign-only-property-types \($0)" })
                .joined(separator: " ")
        case .externalEncodableProtocols(let protocols):
            return protocols
                .map({ "--external-encodable-protocols \($0)" })
                .joined(separator: " ")
        case .externalTestCaseClasses(let classes):
            return classes
                .map({ "--external-test-case-classes \($0)" })
                .joined(separator: " ")
        case .retainObjcAccessible:
            return "--retain-objc-accessible"
        case .retainObjcAnnotated:
            return "--retain-objc-annotated"
        case .retainUnusedProtocolFuncParams:
            return "--retain-unused-protocol-func-params"
        case .cleanBuild:
            return "--clean-build"
        case .retainSwiftUIPreviews:
            return "--retain-swift-ui-previews"
        case .skipBuild:
            return "--skip-build"
        case .relativeResults:
            return "--relative-results"
        case .strict:
            return "--strict"
        case .custom(let option):
            return option
        }
    }
}
