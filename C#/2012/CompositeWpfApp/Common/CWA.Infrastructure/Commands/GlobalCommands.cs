//
// GlobalCommands.cs
// Author: Eugene Pankov
// January 31, 2009

using System.Windows.Input;


namespace CWA.Infrastructure
{
    /// <summary>
    /// Class GlobalCommands contains globally available RoutedUICommands.
    /// </summary>
    public static class GlobalCommands
    {
        public static RoutedUICommand ConnectToServerCommand { get; private set; }
        public static RoutedUICommand ServerListCommand { get; private set; }
        public static RoutedUICommand SettingsCommand { get; private set; }
        public static RoutedUICommand SkinCommand { get; private set; }
        public static RoutedUICommand ExitCommand { get; private set; }
        public static RoutedUICommand HelpCommand { get; private set; }
        public static RoutedUICommand AboutCommand { get; private set; }
        public static RoutedUICommand SkinItemUpdateCommand { get; private set; }


        static GlobalCommands()
        {
            InitializeCommands();
        }

        private static void InitializeCommands()
        {
            ConnectToServerCommand = new RoutedUICommand();
            ServerListCommand = new RoutedUICommand();
            SettingsCommand = new RoutedUICommand();
            SkinCommand = new RoutedUICommand();
            ExitCommand = new RoutedUICommand();
            AboutCommand = new RoutedUICommand();
            SkinItemUpdateCommand = new RoutedUICommand();

            // "Help" command. Shortcut: F1

            InputGestureCollection inputs = new InputGestureCollection();
            inputs.Add(new KeyGesture(Key.F1, ModifierKeys.None, "F1"));
            HelpCommand = new RoutedUICommand("About Program", "Help", typeof(GlobalCommands), inputs);
        }
    }
}
