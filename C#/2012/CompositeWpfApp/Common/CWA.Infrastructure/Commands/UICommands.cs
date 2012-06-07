//
// UICommands.cs
// Author: Eugene Pankov
// January 31, 2009

using System.Windows.Input;


namespace CWA.Infrastructure
{
    /// <summary>
    /// Class <see cref="UICommands"/> contains publicly available UI commands.
    /// </summary>
    public static class UICommands
    {
        public static RoutedCommand CloseTabCommand = new RoutedCommand();
    }
}
