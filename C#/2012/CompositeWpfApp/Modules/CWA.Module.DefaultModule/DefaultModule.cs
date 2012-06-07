//
// DefaultModule.cs
// Author: Eugene Pankov
// February 2, 2009

using Microsoft.Practices.Unity;
using Microsoft.Practices.Composite.Events;
using Microsoft.Practices.Composite.Modularity;
using Microsoft.Practices.Composite.Regions;
using CWA.Infrastructure;


namespace CWA.Module.DefaultModule
{
    /// <summary>
    /// Class <see cref="DefaultModule"/> is used to display default view in the Main Region.
    /// </summary>
    [Module(ModuleName = ModuleNames.DefaultModule)]
    public class DefaultModule : IModule, IModulePresentation
    {
        private readonly IUnityContainer container;
        private readonly IEventAggregator eventAggregator;


        public DefaultModule(IUnityContainer container, IEventAggregator eventAggregator)
        {
            this.container = container;
            this.eventAggregator = eventAggregator;
        }

        /// <summary>
        /// A View associated with the module.
        /// </summary>
        public object View
        {
            get
            {
                return container.Resolve<DefaultView>();
            }
        }

        /// <summary>
        /// IModule interface method called on module loading.
        /// </summary>
        public void Initialize()
        {
            // This class exposes IModulePresentation interface that can be resolved by the module name
            container.RegisterInstance<IModulePresentation>(ModuleNames.DefaultModule, this);

            // Register a view
            container.RegisterType<DefaultView>(new ContainerControlledLifetimeManager());

            // Register a menu view
            container.RegisterType<DefaultMainMenuView>(new ContainerControlledLifetimeManager());

            // Load the module on application loading
            eventAggregator.GetEvent<ModuleChangeEvent>().Publish(ModuleNames.DefaultModule);
        }
    }
}
