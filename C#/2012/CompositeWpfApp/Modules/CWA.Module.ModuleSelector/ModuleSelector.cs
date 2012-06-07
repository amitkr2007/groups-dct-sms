//
// ModuleSelector.cs
// Author: Eugene Pankov
// February 3, 2008

using Microsoft.Practices.Unity;
using Microsoft.Practices.Composite.Modularity;
using Microsoft.Practices.Composite.Regions;
using CWA.Infrastructure;


namespace CWA.Module.ModuleSelector
{
    /// <summary>
    /// Class <see cref="ModuleSelector"/> is used to display Module Selector view in the ModuleSelectorRegion.
    /// </summary>
    [Module(ModuleName = ModuleNames.ModuleSelector)]
    public class ModuleSelector : IModule
    {
        private readonly IUnityContainer container;
        private readonly IRegionManager regionManager;


        public ModuleSelector(IUnityContainer container, IRegionManager regionManager)
        {
            this.container = container;
            this.regionManager = regionManager;
        }

        /// <summary>
        /// IModule interface method called on module loading.
        /// </summary>
        public void Initialize()
        {
            ModuleSelectorPresententaionModel presententaionModel = container.Resolve<ModuleSelectorPresententaionModel>();
            regionManager.Regions[RegionNames.ModuleSelectorRegion].Add(presententaionModel.View);
        }
    }
}
