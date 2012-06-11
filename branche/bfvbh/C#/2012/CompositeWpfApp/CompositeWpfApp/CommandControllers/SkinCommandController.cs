//
// SkinCommandController.cs
// Author: Eugene Pankov
// November 30, 2008
//      

using System;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using CWA.Infrastructure;


namespace CompositeWpfApp.CommandControllers
{
    /// <summary>
    /// Class <see cref="SkinCommandController"/> processes the "Style..." command.
    /// </summary>
    public class SkinCommandController : IGeneralController
    {
        private string currentSkinName = string.Empty;

        /// <summary>
        /// IGeneralController Member.
        /// </summary>
        public void Run()
        {
            // Bind "Skin" command to the MainWindow
            CommandBinding skinCommandBinding = new CommandBinding(GlobalCommands.SkinCommand, SkinCommand_Executed, Command_CanExecute);
            Application.Current.MainWindow.CommandBindings.Add(skinCommandBinding);

            // Bind SkinItemUpdate command raised on "Style..." menu opening
            CommandBinding skinItemUpdateCommandBinding = new CommandBinding(GlobalCommands.SkinItemUpdateCommand, SkinItemUpdateCommand_Executed, Command_CanExecute);
            Application.Current.MainWindow.CommandBindings.Add(skinItemUpdateCommandBinding);

            // Here we can read a Skin Name, set as default one and saved in a configuration file
            currentSkinName = SkinNames.DefaultSkin;
        }

        /// <summary>
        /// Event handler enabling command execution.
        /// </summary>
        /// <param name="sender">object.</param>
        /// <param name="e">CanExecuteRoutedEventArgs.</param>
        private void Command_CanExecute(object sender, CanExecuteRoutedEventArgs e)
        {
            e.CanExecute = true;
            e.Handled = true;
        }

        /// <summary>
        /// SkinItemUpdate command event handler.
        /// </summary>
        /// <param name="sender">object.</param>
        /// <param name="e">ExecutedRoutedEventArgs.</param>
        private void SkinItemUpdateCommand_Executed(object sender, ExecutedRoutedEventArgs e)
        {
            if (e != null && e.Parameter != null && e.Parameter is MenuItem)
            {
                MenuItem mi = e.Parameter as MenuItem;
                string skinName = (string)mi.CommandParameter;

                if(skinName != null)
                {
                    // Check the MenuItem if its CommandParameter contains current Skin Name
                    mi.IsChecked = string.Compare(skinName, currentSkinName, true) == 0;
                }
            }
        }

        /// <summary>
        /// Skin command event handler.
        /// </summary>
        /// <param name="sender">object.</param>
        /// <param name="e">ExecutedRoutedEventArgs.</param>
        /// <exception cref="ArgumentNullException">Skin Name is not specified.</exception>
        private void SkinCommand_Executed(object sender, ExecutedRoutedEventArgs e)
        {
            if (e == null)
                throw new ArgumentNullException("e", "Skin Name is not specified.");

            ChangeSkin((string)e.Parameter);
        }

        /// <summary>
        /// Changes current application skin to the skin with the <paramref name="skinName"/>.
        /// </summary>
        /// <param name="skinName">The name of the skin.</param>
        /// <exception cref="ArgumentNullException">Skin is null or empty.</exception>
        private void ChangeSkin(string skinName)
        {
            if (string.IsNullOrEmpty(skinName))
                throw new ArgumentException("Skin Name is empty.", "skinName");

            if (string.Compare(skinName, currentSkinName, true) != 0)
            {
                // Change the skin if it differs from the current one
                Application.Current.Resources.MergedDictionaries[0] = SkinFactory.GetResourceDictionary(skinName);
                currentSkinName = skinName;
            }
        }
    }
}
