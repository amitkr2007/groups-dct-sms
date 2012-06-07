//
// ModuleController.cs
// Author: Eugene Pankov
// January 31, 2009
//
// Subscribes to following CompositePresentationEvent events:
//      ModuleChangeEvent
//

using System;
using System.Windows;
using Microsoft.Practices.Unity;
using Microsoft.Practices.Composite.Events;
using Microsoft.Practices.Composite.Modularity;
using Microsoft.Practices.Composite.Regions;
using Microsoft.Practices.Composite.Presentation.Events;
using CWA.Infrastructure;


namespace CompositeWpfApp.Controllers
{
    /// <summary>
    /// Class <see cref="ModuleController"/> is used to display modules in the Main Region.
    /// </summary>
    public class ModuleController : IGeneralController
    {
        private readonly IUnityContainer container;
        private readonly IRegionManager regionManager;
        private readonly IModuleCatalog moduleCatalog;
        private readonly IModuleManager moduleManager;
        private readonly IEventAggregator eventAggregator;
        private readonly IServerContextService serverContextService;

        private object currentView;


        public ModuleController(IUnityContainer container, IRegionManager regionManager, IModuleCatalog moduleCatalog,
            IModuleManager moduleManager, IEventAggregator eventAggregator, IServerContextService serverContextService)
        {
            this.container = container;
            this.regionManager = regionManager;
            this.moduleCatalog = moduleCatalog;
            this.moduleManager = moduleManager;
            this.eventAggregator = eventAggregator;
            this.serverContextService = serverContextService;
        }

        #region IGeneralController Members

        public void Run()
        {
            eventAggregator.GetEvent<ModuleChangeEvent>().Subscribe(DisplayModule, ThreadOption.UIThread, true);
        }

        #endregion

        /// <summary>
        /// Display a module with the specified <paramref name="moduleName" /> in the Main Region.
        /// </summary>
        /// <param name="moduleName">Module name.</param>
        /// <exception cref="ArgumentNullException">Empty module name.</exception>
        private void DisplayModule(string moduleName)
        {
            if (string.IsNullOrEmpty(moduleName))
                throw new ArgumentNullException(moduleName, "Illegal module name to load.");

            try
            {
                moduleManager.LoadModule(moduleName);

                IModulePresentation module = TryResolve<IModulePresentation>(moduleName);

                if (module != null)
                {
                    IRegion region = regionManager.Regions[RegionNames.MainRegion];
                    currentView = region.GetView(RegionNames.MainRegion);

                    if (currentView != null)
                        region.Remove(currentView);

                    currentView = module.View;
                    region.Add(currentView, RegionNames.MainRegion);
                    region.Activate(currentView);

                    if (serverContextService.CurrentServerContext != null)
                    {
                        // Save current module name
                        serverContextService.CurrentServerContext.CurrentModule = moduleName;
                    }
                }
            }
            catch
            {
                MessageBox.Show(string.Format("Unable to display \"{0}\" module.", moduleName));
            }
        }

        /// <summary>
        /// Resolve an Object by Type and Registration Name.
        /// </summary>
        /// <typeparam name="T">Type.</typeparam>
        /// <param name="name">Registration Name.</param>
        /// <returns>Instances of registered object in the Unity Container.</returns>
        private T TryResolve<T>(string name)
        {
            try
            {
                return container.Resolve<T>(name);
            }
            catch
            {
                return default(T);
            }
        }
    }
}
