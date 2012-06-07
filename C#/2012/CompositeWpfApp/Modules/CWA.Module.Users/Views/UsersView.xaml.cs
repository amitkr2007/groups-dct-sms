//
// UsersView.cs
// Author: Eugene Pankov
// February 4, 2008

using System;
using System.Windows;
using System.Windows.Controls;
using Microsoft.Practices.Unity;
using Microsoft.Practices.Composite;
using Microsoft.Practices.Composite.Events;
using CWA.Infrastructure;


namespace CWA.Module.Users
{
    public partial class UsersView : ModuleViewBase
    {
        public UsersView()
        {
            InitializeComponent();
        }

        public UsersView(IUnityContainer container, IEventAggregator eventAggregator)
            : this()
        {
            base.container = container;
            base.eventAggregator = eventAggregator;
        }

        protected override void ViewActivated(object sender, EventArgs e)
        {
            base.ViewActivated(sender, e);

            // Display main menu
            object menuView = container.Resolve<UsersMainMenuView>();

            if (menuView != null)
                eventAggregator.GetEvent<MainMenuChangeEvent>().Publish(menuView);
        }
    }
}
