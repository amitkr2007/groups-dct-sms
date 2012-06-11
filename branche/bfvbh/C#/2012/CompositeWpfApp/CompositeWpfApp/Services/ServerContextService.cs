//
// ServerContextService.cs
// Author: Eugene Pankov
// January 31, 2009

using System.Collections.Generic;
using CWA.Infrastructure;


namespace CompositeWpfApp
{
    /// <summary>
    /// Class <see cref="ServerContextService"/> maintains a list of server contexts.
    /// </summary>
    public class ServerContextService : IServerContextService
    {
        private List<ServerContext> serverContexts = new List<ServerContext>();

        public ServerContext CurrentServerContext { get; set; }

        /// <summary>
        /// Gets or sets a list of server contexts.
        /// </summary>
        public ICollection<ServerContext> ServerContexts
        {
            get { return serverContexts; }
        }
    }
}
