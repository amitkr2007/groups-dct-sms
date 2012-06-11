//
// HelpCommandController.cs
// Author: Eugene Pankov
// January 6, 2009
//      

using System;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using CWA.Infrastructure;


namespace CompositeWpfApp.CommandControllers
{
    /// <summary>
    /// Class <see cref="HelpCommandController"/> processes the "Help" command.
    /// </summary>
    public class HelpCommandController : IGeneralController
    {
        /// <summary>
        /// IGeneralController Member.
        /// </summary>
        public void Run()
        {
            // Bind "Help" command to the MainWindow
            CommandBinding binding = new CommandBinding(GlobalCommands.HelpCommand, Command_Executed, Command_CanExecute);
            Application.Current.MainWindow.CommandBindings.Add(binding);
        }

        /// <summary>
        /// Event handler enabling or disabling command execution.
        /// </summary>
        /// <param name="sender">object.</param>
        /// <param name="e">CanExecuteRoutedEventArgs.</param>
        private void Command_CanExecute(object sender, CanExecuteRoutedEventArgs e)
        {
            e.CanExecute = true;
            e.Handled = true;
        }

        /// <summary>
        /// Help command event handler.
        /// </summary>
        /// <param name="sender">object.</param>
        /// <param name="e">ExecutedRoutedEventArgs.</param>
        private void Command_Executed(object sender, ExecutedRoutedEventArgs e)
        {
            MessageBox.Show("HELP!!!");
        }
    }
}
