//
// MainMenuControl.cs
// Author: Eugene Pankov
// January 31, 2009

using System.Windows;
using System.Windows.Controls;
using CWA.Infrastructure;


namespace CWA.UIControls.Menus
{
    /// <summary>
    /// Class <see cref="MainMenuControl"/> is a Main Menu item.
    /// </summary>
    public partial class MainMenuControl : MenuItem
    {
        public MainMenuControl()
        {
            InitializeComponent();
        }

        /// <summary>
        /// Sends SkinItemUpdateCommand up by visual tree on sub-menu opening.
        /// This command will be catched by Application.Current.MainWindow.CommandBindings
        /// and processed by SkinCommandController.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void StyleMenuItem_SubmenuOpened(object sender, RoutedEventArgs e)
        {
            MenuItem menuItem = e.OriginalSource as MenuItem;

            if (menuItem != null && menuItem.HasItems)
            {
                foreach (object mi in menuItem.Items)
                {
                    if (mi is MenuItem)
                    {
                        GlobalCommands.SkinItemUpdateCommand.Execute(mi, this);
                    }
                }
            }
        }
    }
}
