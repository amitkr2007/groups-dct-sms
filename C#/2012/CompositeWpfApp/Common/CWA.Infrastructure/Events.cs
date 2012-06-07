//
// Events.cs
// Author: Eugene Pankov
// January 31, 2009

using System.Windows.Controls;
using Microsoft.Practices.Composite.Presentation.Events;


namespace CWA.Infrastructure
{
    /// <summary>
    /// Events.cs contains publicly available CompositeWpf events.
    /// </summary>

    public class ModuleChangeEvent : CompositePresentationEvent<string> { }
    public class MainMenuChangeEvent : CompositePresentationEvent<object> { }

    public class ServerContextAddEvent : CompositePresentationEvent<ServerContext> { }
    public class ServerContextAddedEvent : CompositePresentationEvent<ServerContext> { }
    public class ServerContextChangeEvent : CompositePresentationEvent<ServerContext> { }
    public class ServerContextChangedEvent : CompositePresentationEvent<ServerContext> { }
    public class ServerContextRemoveEvent : CompositePresentationEvent<ServerContext> { }
    public class ServerContextRemovedEvent : CompositePresentationEvent<ServerContext> { }
    public class ServerContextClearedEvent : CompositePresentationEvent<object> { }
}
