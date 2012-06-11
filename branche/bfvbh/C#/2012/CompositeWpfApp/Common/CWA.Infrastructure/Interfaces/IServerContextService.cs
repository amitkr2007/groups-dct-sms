//
// ServerContextService.cs
// Author: Eugene Pankov
// January 31, 2009

using System.Collections.Generic;


namespace CWA.Infrastructure
{
    /// <summary>
    /// Interface that defines current server context and a list of contexts.
    /// </summary>
    public interface IServerContextService
    {
        ServerContext CurrentServerContext { get; set; }
        ICollection<ServerContext> ServerContexts { get; }
    }
}
