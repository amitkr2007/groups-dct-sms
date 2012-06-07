//
// MenuController.cs
// Author: Eugene Pankov
// January 31, 2009
//
// Subscribes to following CompositePresentationEvent events:
//      MainMenuChangeEvent
//      

using System;
using Microsoft.Practices.Unity;
using Microsoft.Practices.Composite.Events;
using Microsoft.Practices.Composite.Regions;
using Microsoft.Practices.Composite.Presentation.Events;
using CWA.Infrastructure;


namespace CompositeWpfApp.Controllers
{
    /// <summary>
    /// Class <see cref="MenuController"/> is used to display menu in the MainMenuRegion.
    /// </summary>
    public class MenuController : IGeneralController
    {
        private readonly IRegionManager regionManager;
        private readonly IEventAggregator eventAggregator;


        public MenuController(IRegionManager regionManager, IEventAggregator eventAggregator)
        {
            this.regionManager = regionManager;
            this.eventAggregator = eventAggregator;
        }

        #region IGeneralController Members

        public void Run()
        {
            eventAggregator.GetEvent<MainMenuChangeEvent>().Subscribe(SetMenuView, ThreadOption.UIThread, true);
        }

        #endregion

        /// <summary>
        /// Replaces current view displayed in the MainMenuRegion.
        /// </summary>
        /// <param name="view">New menu view.</param>
        /// <exception cref="ArgumentNullException">View is null.</exception>
        private void SetMenuView(object view)
        {
            if (view == null)
                throw new ArgumentNullException("view", "Cannot resolve main menu view.");

            IRegion region = regionManager.Regions[RegionNames.MainMenuRegion];

            if (region != null)
            {
                object currentView = region.GetView(RegionNames.MainMenuRegion);

                if (currentView != null)
                    region.Remove(currentView);

                // Display a menu
                region.Add(view, RegionNames.MainMenuRegion);
            }
        }
    }
}
