//
// ServerController.cs
// Author: Eugene Pankov
// January 31, 2009
//
// Subscribes to following CompositePresentationEvent events:
//      ServerContextAddEvent
//      ServerContextChangeEvent
//      ServerContextRemoveEvent
//
// Publishes CompositePresentationEvent events:
//      ServerContextChangedEvent
//      ServerContextClearedEvent
//   

using System;
using Microsoft.Practices.Unity;
using Microsoft.Practices.Composite.Events;
using Microsoft.Practices.Composite.Modularity;
using Microsoft.Practices.Composite.Regions;
using Microsoft.Practices.Composite.Presentation.Events;
using CWA.Infrastructure;


namespace CompositeWpfApp.Controllers
{
    /// <summary>
    /// Class <see cref="ServerController"/> is used to add/remove/change server contexts.
    /// </summary>
    public class ServerController : IGeneralController
    {
        private readonly IEventAggregator eventAggregator;
        private readonly IServerContextService serverContextService;


        public ServerController(IEventAggregator eventAggregator, IServerContextService serverContextService)
        {
            this.eventAggregator = eventAggregator;
            this.serverContextService = serverContextService;
        }

        #region IGeneralController Members

        public void Run()
        {
            // Subscribe to events, fired in the ServerSelector

            eventAggregator.GetEvent<ServerContextAddEvent>().Subscribe(AddServerContext, ThreadOption.UIThread, true);
            eventAggregator.GetEvent<ServerContextChangeEvent>().Subscribe(ChangeServerContext, ThreadOption.UIThread, true);
            eventAggregator.GetEvent<ServerContextRemoveEvent>().Subscribe(RemoveServerContext, ThreadOption.UIThread, true);
        }

        #endregion

        /// <summary>
        /// Adds a server context.
        /// </summary>
        /// <param name="serverContext">ServerContext to add.</param>
        /// <exception cref="ArgumentNullException">Illegal server context.</exception>
        public void AddServerContext(ServerContext serverContext)
        {
            if (serverContext == null)
                throw new ArgumentNullException("serverContext", "Illegal server context.");

            if (serverContextService.ServerContexts.Contains(serverContext))
                throw new ArgumentException("Server context already exists.");

            serverContextService.ServerContexts.Add(serverContext);

            // ServerContext is added
            eventAggregator.GetEvent<ServerContextAddedEvent>().Publish(serverContext);
        }

        /// <summary>
        /// Change server context to the specified by the <paramref name="serverContext" /> parameter.
        /// </summary>
        /// <param name="serverContext">ServerContext</param>
        /// <exception cref="ArgumentNullException">Illegal server context.</exception>
        public void ChangeServerContext(ServerContext serverContext)
        {
            if (serverContext == null)
                throw new ArgumentNullException("serverContext", "Illegal server context.");

            if (serverContextService.ServerContexts.Contains(serverContext))
            {
                serverContextService.CurrentServerContext = serverContext;

                // ServerContext is changed
                eventAggregator.GetEvent<ServerContextChangedEvent>().Publish(serverContext);
            }
        }

        /// <summary>
        /// Removes <paramref name="serverContext" /> from the list of servers.
        /// </summary>
        /// <param name="serverContext">ServerContext</param>
        /// <exception cref="ArgumentNullException">Illegal server context.</exception>
        public void RemoveServerContext(ServerContext serverContext)
        {
            if (serverContext == null)
                throw new ArgumentNullException("serverContext", "Illegal server context.");

            if (serverContextService.ServerContexts.Contains(serverContext))
            {
                serverContextService.ServerContexts.Remove(serverContext);

                // ServerContext is removed
                eventAggregator.GetEvent<ServerContextRemovedEvent>().Publish(serverContext);
            }

            if (serverContextService.ServerContexts.Count == 0)
            {
                serverContextService.CurrentServerContext = null;
                eventAggregator.GetEvent<ServerContextClearedEvent>().Publish(null);

                // Load DefaultModule
                eventAggregator.GetEvent<ModuleChangeEvent>().Publish(ModuleNames.DefaultModule);
            }
        }
    }
}
