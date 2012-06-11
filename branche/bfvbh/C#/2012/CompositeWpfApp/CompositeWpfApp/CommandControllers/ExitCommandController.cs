//
// ExitCommandController.cs
// Author: Eugene Pankov
// December 21, 2008

using System;
using System.Windows;
using System.Windows.Input;
using CWA.Infrastructure;


namespace CompositeWpfApp.CommandControllers
{
    /// <summary>
    /// Class <see cref="ExitCommandController"/> processes the "Exit" command and sends a signal
    /// to terminate current activities to all interested modules.
    /// </summary>
    public class ExitCommandController : IGeneralController
    {
        private bool processingExitCommand;

        /// <summary>
        /// IGeneralController Member.
        /// </summary>
        public void Run()
        {
            // Bind "Exit" command to the MainWindow
            CommandBinding binding = new CommandBinding(GlobalCommands.ExitCommand, Command_Executed, Command_CanExecute);
            Application.Current.MainWindow.CommandBindings.Add(binding);
        }

        /// <summary>
        /// Event handler enabling or disabling command execution.
        /// </summary>
        /// <param name="sender">object.</param>
        /// <param name="e">CanExecuteRoutedEventArgs.</param>
        private void Command_CanExecute(object sender, CanExecuteRoutedEventArgs e)
        {
            e.CanExecute = !processingExitCommand;
            e.Handled = true;
        }

        /// <summary>
        /// Exit command event handler.
        /// </summary>
        /// <param name="sender">object.</param>
        /// <param name="e">ExecutedRoutedEventArgs.</param>
        private void Command_Executed(object sender, ExecutedRoutedEventArgs e)
        {
            ExecuteCommand();
        }

        /// <summary>
        /// Executes "Exit" command.
        /// </summary>
        public void ExecuteCommand()
        {
            if (processingExitCommand)
            {
                // Prevent command execution if it is already processing
                return;
            }

            processingExitCommand = true;

            // At this point we can ask for user's confirmation to exit the program
            // In this case set processingExitCommand to false

            if (GlobalCompositeCommands.ShutdownCommand.RegisteredCommands.Count == 0)
            {
                // If there is no modules interested in receiving ShutdownCommand, exit the program
                Application.Current.Shutdown();
            }
            else
            {
                // Send Shutdown command to registered modules
                GlobalCompositeCommands.ShutdownCommand.Execute(null);

                // Start a timer to wait for completing runnning activities
                // or exit when GlobalCompositeCommands.ShutdownCommand.RegisteredCommands.Count is 0
            }
        }
    }
}
