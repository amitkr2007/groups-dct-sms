//
// ServerSelectorView.cs
// Author: Eugene Pankov
// February 2, 2009
//
// Subscribes to CompositePresentationEvent events:
//      ServerContextAddedEvent
//      ServerContextRemovedEvent
//
// Publishes CompositePresentationEvent events:
//      ServerContextChangeEvent
//      ServerContextRemoveEvent

using System;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using System.Collections.Generic;
using Microsoft.Practices.Composite.Events;
using Microsoft.Practices.Composite.Presentation.Events;
using CWA.UIControls;
using CWA.Infrastructure;


namespace CWA.Module.ServerSelector
{
    /// <summary>
    /// Class <see cref="ServerSelectorView"/> presents ServerSelector view 
    /// displayed in the ServerSelectorRegion.
    /// </summary>
    public partial class ServerSelectorView : UserControl
    {
        private const string DefaultTabHeader = "Not connected";
        private IEventAggregator eventAggregator;


        public ServerSelectorView()
        {
            InitializeComponent();
            AddDefaultTab();
        }

        public ServerSelectorView(IEventAggregator eventAggregator)
            : this()
        {
            this.eventAggregator = eventAggregator;
            this.eventAggregator.GetEvent<ServerContextAddedEvent>().Subscribe(AddServer, ThreadOption.UIThread, true);
            this.eventAggregator.GetEvent<ServerContextRemovedEvent>().Subscribe(RemoveServer, ThreadOption.UIThread, true);


            // WARNING: just for testing purposes only
            InitializeTestEnv();
        }

        private void InitializeTestEnv()
        {
            ServerContext sc = new ServerContext("Server 1");
            sc.Modules = new List<string>() { ModuleNames.Documents, ModuleNames.Security, ModuleNames.Users };
            eventAggregator.GetEvent<ServerContextAddEvent>().Publish(sc);

            sc = new ServerContext("Server 2");
            sc.Modules = new List<string>() { ModuleNames.Documents, ModuleNames.Security, ModuleNames.Users };
            eventAggregator.GetEvent<ServerContextAddEvent>().Publish(sc);

            sc = new ServerContext("Server 3");
            sc.Modules = new List<string>() { ModuleNames.Documents, ModuleNames.Security };
            eventAggregator.GetEvent<ServerContextAddEvent>().Publish(sc);

            sc = new ServerContext("Server 4");
            sc.Modules = new List<string>() { ModuleNames.Documents };
            eventAggregator.GetEvent<ServerContextAddEvent>().Publish(sc);
        }

        /// <summary>
        /// Adds a Default Tab.
        /// </summary>
        private void AddDefaultTab()
        {
            TabItemClosable tab = new TabItemClosable();
            tab.Header = DefaultTabHeader;
            tab.CanClose = false;
            tabServers.Items.Add(tab);
            tabServers.SelectedItem = tab;
        }

        /// <summary>
        /// Removes the Default Tab.
        /// </summary>
        private void RemoveDefaultTab()
        {
            foreach (TabItem tabItem in tabServers.Items)
            {
                if (tabItem.Tag == null)
                {
                    tabServers.Items.Remove(tabItem);
                    return;
                }
            }
        }

        /// <summary>
        /// Adds new tab for the specified ServerContext.
        /// </summary>
        /// <param name="serverContext">ServerContext.</param>
        /// <exception cref="ArgumentNullException">Illegal server context.</exception>
        public void AddServer(ServerContext serverContext)
        {
            if (serverContext == null)
                throw new ArgumentNullException("serverContext", "Illegal server context.");

            TabItemClosable tab = new TabItemClosable();
            tab.Header = serverContext.Name;
            tab.Tag = serverContext;
            tab.CanClose = true;
            tabServers.Items.Add(tab);

            RemoveDefaultTab();
        }

        /// <summary>
        /// Removes a tab for the specified ServerContext.
        /// </summary>
        /// <param name="serverContext">ServerContext.</param>
        /// <exception cref="ArgumentNullException">Illegal server context.</exception>
        public void RemoveServer(ServerContext serverContext)
        {
            if (serverContext == null)
                throw new ArgumentNullException("serverContext", "Illegal server context.");

            foreach (TabItem tabItem in tabServers.Items)
            {
                if (tabItem.Tag != null && (ServerContext)tabItem.Tag == serverContext)
                {
                    tabServers.Items.Remove(tabItem);
                    break;
                }
            }

            // All tabs were removed
            if (tabServers.Items.Count == 0)
            {
                AddDefaultTab();
            }
        }

        /// <summary>
        /// Event handler publishing ServerContextChangeEvent on selected tab changed.
        /// </summary>
        /// <param name="sender">object</param>
        /// <param name="e">SelectionChangedEventArgs</param>
        private void tabServers_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (e != null)
            {
                TabControl tabControl = (TabControl)e.Source;
                if (tabControl != null)
                {
                    TabItem tabItem = (TabItem)tabControl.SelectedItem;
                    if (tabItem != null)
                    {
                        ServerContext serverContext = (ServerContext)tabItem.Tag;

                        // Current ServerContext is changed
                        if (serverContext != null)
                        {
                            eventAggregator.GetEvent<ServerContextChangeEvent>().Publish(serverContext);
                        }
                    }
                }
            }
        }

        /// <summary>
        /// Populates the Context Menu with Tab names as menu items.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnOpenMenu_Click(object sender, RoutedEventArgs e)
        {
            if (tabServers.Items.Count != 0)
            {
                cmTabs.Items.Clear();

                foreach (TabItem tabItem in tabServers.Items)
                {
                    MenuItem mi = new MenuItem();
                    mi.Header = tabItem.Header;
                    mi.IsChecked = tabItem.IsSelected;
                    mi.Tag = tabItem;
                    cmTabs.Items.Add(mi);
                }

                cmTabs.PlacementTarget = btnOpenMenu;
                cmTabs.IsOpen = true;
            }
        }

        /// <summary>
        /// Prevents the context menu from opening on mouse right-click.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnOpenMenu_ContextMenuOpening(object sender, ContextMenuEventArgs e)
        {
            e.Handled = true;
        }

        /// <summary>
        /// Context menu item is clicked and appropriate tab is selected.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void cmTabs_Click(object sender, RoutedEventArgs e)
        {
            if (e != null)
            {
                MenuItem menuItem = (MenuItem)e.OriginalSource;

                if (menuItem != null)
                {
                    if (menuItem.Tag != null)
                    {
                        tabServers.SelectedItem = menuItem.Tag;
                    }
                }
            }

            // This is a workaround: otherwise global menu items are disabled 
            tabServers.Focus();
        }

        /// <summary>
        /// Removes selected tab on pressing "Close" button and fires a ServerContextRemoveEvent.
        /// </summary>
        /// <param name="sender">object</param>
        /// <param name="e">ExecutedRoutedEventArgs</param>
        private void CloseTabCommand_Executed(object sender, ExecutedRoutedEventArgs e)
        {
            if (e != null)
            {
                TabItem tabItem = (TabItem)tabServers.SelectedItem;
                if (tabItem != null)
                {
                    ServerContext serverContext = (ServerContext)tabItem.Tag;

                    // There can be a tab without a ServerContext
                    if (serverContext != null)
                    {
                        // The event will be catched by the ServerController
                        eventAggregator.GetEvent<ServerContextRemoveEvent>().Publish(serverContext);
                    }
                }
            }
        }
    }
}
