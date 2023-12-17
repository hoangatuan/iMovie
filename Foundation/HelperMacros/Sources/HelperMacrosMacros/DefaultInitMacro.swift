//
//  File.swift
//  
//
//  Created by Tuan Hoang on 30/11/23.
//

import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

// swiftlint:disable:next private_over_fileprivate
fileprivate struct Argument {
    let argumentName: PatternSyntax
    let argumentType: TypeSyntax
    let initializer: ExprSyntax?
}

/// Implementation of the `DefaultInit` macro, which takes struct/class and provide public default initialize for it.
/// Note that you need to declare the type explicit for the variable you want to add to the `init`.
/// For example
///
///     @DefaultInit
///     struct Person {
///         let name: String
///     }
///
///  will expand to
///
///     struct Person {
///         let name: String
///         public init(
///             name: string
///         ) {
///             self.name = name
///         }
///     }
///
public struct DefaultInit: MemberMacro {
    public static func expansion(
        of node: AttributeSyntax,
        providingMembersOf declaration: some DeclGroupSyntax, // Type enum decleration
        in context: some MacroExpansionContext
    ) throws -> [DeclSyntax] {
        if !declaration.is(StructDeclSyntax.self) && !declaration.is(ClassDeclSyntax.self) {
            throw MacroError.notStructOrClass
        }

        let members = declaration.memberBlock.members
        var arguments: [Argument] = []

        let declarations = members
            .compactMap { $0.decl.as(VariableDeclSyntax.self) }

        for decl in declarations {
            let bindings = decl.bindings
            let specifier = decl.bindingSpecifier

            for binding in bindings {
                let argumentName = binding.pattern
                guard let type = binding.typeAnnotation?.type.trimmed ?? bindings.last?.typeAnnotation?.type.trimmed else {
                    // Throw
                    return []
                }

                let defaultParam = binding.initializer?.value
                if specifier.text == "var" || defaultParam == nil {
                    arguments.append(.init(argumentName: argumentName, argumentType: type, initializer: defaultParam))
                }
            }
        }

        let initializer = try InitializerDeclSyntax(generateInitialCode(arguments: arguments)) {
            for index in 0..<arguments.count {
                ExprSyntax("self.\(arguments[index].argumentName) = \(arguments[index].argumentName)")
            }
        }

        return [DeclSyntax(initializer)]
    }

    fileprivate static func generateInitialCode(
        arguments: [Argument]
    ) -> SyntaxNodeString {

        var initialCode: String = "public init("
        for argument in arguments {
            if let initializer = argument.initializer {
                initialCode += "\n\(argument.argumentName): \(argument.argumentType) = \(initializer),"
            } else {
                initialCode += "\n\(argument.argumentName): \(argument.argumentType),"
            }
        }
        initialCode = String(initialCode.dropLast(1))
        initialCode += "\n)"
        return SyntaxNodeString(stringLiteral: initialCode)
    }
}

// swiftlint:disable:next private_over_fileprivate
fileprivate enum MacroError: Error, CustomStringConvertible {
    case notStructOrClass

    var description: String {
        switch self {
        case .notStructOrClass:
            return "@DefaultInit only applied for struct or class"
        }
    }
}
