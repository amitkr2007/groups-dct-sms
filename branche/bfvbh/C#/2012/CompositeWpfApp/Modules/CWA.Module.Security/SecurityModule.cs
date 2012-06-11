//
// SecurityModule.cs
// Author: Eugene Pankov
// February 5, 2008

using Microsoft.Practices.Unity;
using Microsoft.Practices.Composite.Events;
using Microsoft.Practices.Composite.Modularity;
using Microsoft.Practices.Composite.Regions;
using CWA.Infrastructure;


namespace CWA.Module.Security
{
    [Module(ModuleName = ModuleNames.Security)]
    public class SecurityModule : IModule, IModulePresentation
    {
        private readonly IUnityContainer container;
        private readonly IRegionManager regionManager;
        private readonly IEventAggregator eventAggregator;


        public SecurityModule(IUnityContainer container, IRegionManager regionManager, IEventAggregator eventAggregator)
        {
            this.container = container;
            this.regionManager = regionManager;
            this.eventAggregator = eventAggregator;
        }

        public void Initialize()
        {
            // This class exposes IModulePresentation interface that can be resolved by the module name
            container.RegisterInstance<IModulePresentation>(ModuleNames.Security, this);

            // IView interface can be resolved by the view name and implemented by the SecurityView class
            container.RegisterType<IView, SecurityView>(ViewNames.Security, new ContainerControlledLifetimeManager());
        }

        #region IModulePresentation Members

        public object View
        {
            get
            {
                return container.Resolve<IView>(ViewNames.Security);
            }
        }

        #endregion
    }
}
