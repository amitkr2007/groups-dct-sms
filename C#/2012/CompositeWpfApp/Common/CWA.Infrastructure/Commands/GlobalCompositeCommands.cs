//
// GeneralCommands.cs
// Author: Eugene Pankov
// January 31, 2009

using System.Windows.Input;
using Microsoft.Practices.Composite.Presentation.Commands;

namespace CWA.Infrastructure
{
    /// <summary>
    /// Class GlobalCompositeCommands contains globally available CompositeCommands.
    /// </summary>
    public class GlobalCompositeCommands
    {
        /// <summary>
        /// Composite command sent to all registered modules signaling they have to complete their work.
        /// </summary>
        public static CompositeCommand ShutdownCommand = new CompositeCommand();
    }
}
