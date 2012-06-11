//
// StatusArea.cs
// Author: Eugene Pankov
// February 3, 2008

using Microsoft.Practices.Composite.Modularity;
using Microsoft.Practices.Composite.Regions;
using CWA.Infrastructure;


namespace CWA.Module.StatusArea
{
    /// <summary>
    /// Class <see cref="StatusArea"/> is used to display Status Area in the StatusRegion.
    /// </summary>
    [Module(ModuleName = "StatusArea")]
    public class StatusArea : IModule
    {
        private readonly IRegionManager _regionManager;


        public StatusArea(IRegionManager regionManager)
        {
            _regionManager = regionManager;
        }

        /// <summary>
        /// IModule interface method called on module loading.
        /// </summary>
        public void Initialize()
        {
            _regionManager.Regions[RegionNames.StatusRegion].Add(new StatusAreaView());
        }
    }
}
