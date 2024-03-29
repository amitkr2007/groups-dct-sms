﻿//
// AboutCommandController.cs
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
    /// Class <see cref="AboutCommandController"/> processes the "About" command.
    /// </summary>
    public class AboutCommandController : IGeneralController
    {
        /// <summary>
        /// IGeneralController Member.
        /// </summary>
        public void Run()
        {
            // Bind "About" command to the MainWindow
            CommandBinding binding = new CommandBinding(GlobalCommands.AboutCommand, Command_Executed, Command_CanExecute);
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
        /// About command event handler.
        /// </summary>
        /// <param name="sender">object.</param>
        /// <param name="e">ExecutedRoutedEventArgs.</param>
        private void Command_Executed(object sender, ExecutedRoutedEventArgs e)
        {
            MessageBox.Show("Composite WPF Application.");
        }
    }
}
