// This file is used by Code Analysis to maintain SuppressMessage 
// attributes that are applied to this project. 
// Project-level suppressions either have no target or are given 
// a specific target and scoped to a namespace, type, member, etc. 
//

using System.Diagnostics.CodeAnalysis;

// The following are internal classes or namespaces.
[module: SuppressMessage("Microsoft.MSInternal","CA904:DeclareTypesInMicrosoftOrSystemNamespace", Scope="namespace", Target="RibbonSamples.Common", Justification="This namespaces is shared between the our samples only.")]
[module: SuppressMessage("Microsoft.MSInternal","CA904:DeclareTypesInMicrosoftOrSystemNamespace", Scope="namespace", Target="RibbonWindowSample", Justification="This namespace is internal to the sample.")]
[module: SuppressMessage("Microsoft.MSInternal","CA904:DeclareTypesInMicrosoftOrSystemNamespace", Scope="namespace", Target="RibbonWindowSample.ViewModel")]

// The following words are abbreviation.
[module: SuppressMessage("Microsoft.Naming", "CA1704:IdentifiersShouldBeSpelledCorrectly", MessageId = "Qat", Scope = "type", Target = "RibbonWindowSample.ViewModel.QatItem")]
[module: SuppressMessage("Microsoft.Naming", "CA1704:IdentifiersShouldBeSpelledCorrectly", MessageId = "Qat", Scope = "type", Target = "RibbonWindowSample.ViewModel.QatItemCollection")]
[module: SuppressMessage("Microsoft.Naming", "CA1704:IdentifiersShouldBeSpelledCorrectly", MessageId = "Mvvm", Scope = "type", Target = "RibbonWindowSample.RibbonWindowMvvm")]
[module: SuppressMessage("Microsoft.Naming", "CA1704:IdentifiersShouldBeSpelledCorrectly", MessageId = "Mvvm", Scope = "type", Target = "RibbonWindowSample.UserControlMvvm")]
[module: SuppressMessage("Microsoft.Naming", "CA1704:IdentifiersShouldBeSpelledCorrectly", MessageId = "Xps", Scope = "member", Target = "RibbonWindowSample.ViewModel.WordModel.#EmailAsXpsAttachment")]
[module: SuppressMessage("Microsoft.Naming", "CA1704:IdentifiersShouldBeSpelledCorrectly", MessageId = "Xps", Scope = "member", Target = "RibbonWindowSample.ViewModel.WordModel.#SaveAsPdfOrXps")]

// Term "Requery" is used in CommandManager.
[module: SuppressMessage("Microsoft.Naming", "CA1704:IdentifiersShouldBeSpelledCorrectly", MessageId = "Requery", Scope = "member", Target = "RibbonSamples.Common.DelegateCommand`1.#IsAutomaticRequeryDisabled")]
[module: SuppressMessage("Microsoft.Naming", "CA1704:IdentifiersShouldBeSpelledCorrectly", MessageId = "Requery", Scope = "member", Target = "RibbonSamples.Common.DelegateCommand`1.#.ctor(System.Action`1<!0>,System.Func`2<!0,System.Boolean>,System.Boolean)")]
[module: SuppressMessage("Microsoft.Naming", "CA1704:IdentifiersShouldBeSpelledCorrectly", MessageId = "Requery", Scope = "member", Target = "RibbonSamples.Common.DelegateCommand.#.ctor(System.Action,System.Func`1<System.Boolean>,System.Boolean)")]
[module: SuppressMessage("Microsoft.Naming", "CA1704:IdentifiersShouldBeSpelledCorrectly", MessageId = "Requery", Scope = "member", Target = "RibbonSamples.Common.DelegateCommand.#IsAutomaticRequeryDisabled")]

// False positives.
[module: SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode", Scope = "member", Target = "RibbonSamples.Common.CommandManagerHelper.#AddWeakReferenceHandler(System.Collections.Generic.List`1<System.WeakReference>&,System.EventHandler)")]
[module: SuppressMessage("Microsoft.Performance", "CA1812:AvoidUninstantiatedInternalClasses", Scope = "type", Target = "RibbonSamples.Common.CommandManagerHelper")]

// Collection property should be Read-Write in order to get serialized.
[module: SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly", Scope = "member", Target = "RibbonWindowSample.ViewModel.QatItem.#ControlIndices")]

[module: SuppressMessage("Microsoft.Design", "CA1030:UseEventsWhereAppropriate", Scope = "member", Target = "RibbonSamples.Common.DelegateCommand.#RaiseCanExecuteChanged()")]
[module: SuppressMessage("Microsoft.Design", "CA1030:UseEventsWhereAppropriate", Scope = "member", Target = "RibbonSamples.Common.DelegateCommand`1.#RaiseCanExecuteChanged()")]
