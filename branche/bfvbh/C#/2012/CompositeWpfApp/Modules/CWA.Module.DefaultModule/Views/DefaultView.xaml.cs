//
// DefaultView.cs
// Author: Eugene Pankov
// February 2, 2009

using System;
using Microsoft.Practices.Unity;
using Microsoft.Practices.Composite.Events;
using CWA.Infrastructure;


namespace CWA.Module.DefaultModule
{
    /// <summary>
    /// Class <see cref="DefaultView"/> presents a default view displayed in the Main Region.
    /// </summary>
    public partial class DefaultView : ModuleViewBase
    {
        public DefaultView()
        {
            InitializeComponent();
        }

        public DefaultView(IUnityContainer container, IEventAggregator eventAggregator) : this()
        {
            base.container = container;
            base.eventAggregator = eventAggregator;
        }

        /// <summary>
        /// A method invoking each time the view is activated.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected override void ViewActivated(object sender, EventArgs e)
        {
            base.ViewActivated(sender, e);

            // Display main menu
            object menuView = container.Resolve<DefaultMainMenuView>();

            if (menuView != null)
                eventAggregator.GetEvent<MainMenuChangeEvent>().Publish(menuView);
        }
    }
}
