using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows.Input;

namespace SMS.Lib.UI.WPF
{
    public class CustomWindowCommands
    {
        public static readonly ICommand MinimizeWindow = new RoutedCommand("MinimizeWindowCommand", typeof(CustomWindowCommands));
        public static readonly ICommand MaximizeWindow = new RoutedCommand("MaximizeWindowCommand", typeof(CustomWindowCommands));

        public static readonly ICommand DisplayOfficeButtonOptions = new RoutedCommand("DisplayOfficeButtonOptions", typeof(CustomWindowCommands));
    }
}
