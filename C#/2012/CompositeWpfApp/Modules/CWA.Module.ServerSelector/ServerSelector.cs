//
// ServerSelector.cs
// Author: Eugene Pankov
// February 2, 2009

using Microsoft.Practices.Unity;
using Microsoft.Practices.Composite.Modularity;
using Microsoft.Practices.Composite.Regions;
using CWA.Infrastructure;


namespace CWA.Module.ServerSelector
{
    /// <summary>
    /// Class <see cref="ServerSelector"/> is used to display Server Selector view in the ServerSelectorRegion.
    /// </summary>
    [Module(ModuleName = ModuleNames.ServerSelector)]
    public class ServerSelector : IModule
    {
        private readonly IUnityContainer container;
        private readonly IRegionManager regionManager;


        public ServerSelector(IUnityContainer container, IRegionManager regionManager)
        {
            this.container = container;
            this.regionManager = regionManager;
        }

        /// <summary>
        /// IModule interface method called on module loading.
        /// </summary>
        public void Initialize()
        {
            var view = container.Resolve<ServerSelectorView>();
            regionManager.Regions[RegionNames.ServerSelectorRegion].Add(view);
        }
    }
}
