import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

/// Implementation of the `stringify` macro, which takes an expression
/// of any type and produces a tuple containing the value of that expression
/// and the source code that produced the value. For example
///
///     #stringify(x + y)
///
///  will expand to
///
///     (x + y, "x + y")
public struct StringifyMacro: ExpressionMacro {
    public static func expansion(
        of node: some FreestandingMacroExpansionSyntax,
        in context: some MacroExpansionContext
    ) -> ExprSyntax {
        guard let argument = node.argumentList.first?.expression else {
            fatalError("compiler bug: the macro does not have any arguments")
        }

        return "(\(argument), \(literal: argument.description))"
    }
}

public struct DefaultInit: MemberMacro {
    public static func expansion(
        of node: AttributeSyntax,
        providingMembersOf declaration: some DeclGroupSyntax, // Type enum decleration
        in context: some MacroExpansionContext
    ) throws -> [DeclSyntax] {
        guard let structDecl = declaration.as(StructDeclSyntax.self) else {
            return []
        }
        
        let members = structDecl.memberBlock.members
        let variables = members
            .compactMap { $0.decl.as(VariableDeclSyntax.self) }
            .compactMap { $0.bindings.as(PatternBindingListSyntax.self) }
            .flatMap { $0 }
        
        let arguments = variables
            .compactMap { $0.pattern.as(IdentifierPatternSyntax.self) }
            .map { $0.identifier.text }
        
        let types = variables
            .compactMap { $0.typeAnnotation?.type.as(IdentifierTypeSyntax.self) }
            .map { $0.name.text }

        if arguments.count != types.count { return [] }
        
        var header = "init("
        for i in 0..<arguments.count {
            header.append("\n\(arguments[i]): \(types[i])")
            if i < arguments.count - 1 {
                header.append(",")
            }
        }
        header.append("\n)")
        
        let initializer = try InitializerDeclSyntax(SyntaxNodeString(stringLiteral: header)) {
            for i in 0..<arguments.count {
                """
                self.\(raw: arguments[i]) = \(raw: arguments[i])
                """
            }
        }
        
        return [DeclSyntax(initializer)]
    }
}

@main
struct HelperMacrosPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        StringifyMacro.self,
        DefaultInit.self,
    ]
}
