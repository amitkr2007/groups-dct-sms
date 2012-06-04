// This file is used by Code Analysis to maintain SuppressMessage 
// attributes that are applied to this project. 
// Project-level suppressions either have no target or are given 
// a specific target and scoped to a namespace, type, member, etc. 
//

using System.Diagnostics.CodeAnalysis;

// The following are internal classes or namespaces.
[module: SuppressMessage("Microsoft.MSInternal","CA904:DeclareTypesInMicrosoftOrSystemNamespace", Scope="namespace", Target="RibbonBrowser")]
[module: SuppressMessage("Microsoft.MSInternal", "CA904:DeclareTypesInMicrosoftOrSystemNamespace", Scope = "namespace", Target = "RibbonBrowserSample")]

// MVVM is a known abbreviation.
[module: SuppressMessage("Microsoft.Naming", "CA1704:IdentifiersShouldBeSpelledCorrectly", MessageId = "Mvvm", Scope = "type", Target = "RibbonBrowserSample.PageMvvm")]
