//
// DocumentsModule.cs
// Author: Eugene Pankov
// February 3, 2008

using Microsoft.Practices.Unity;
using Microsoft.Practices.Composite.Events;
using Microsoft.Practices.Composite.Modularity;
using Microsoft.Practices.Composite.Regions;
using CWA.Infrastructure;


namespace CWA.Module.Documents
{
    /// <summary>
    /// Class <see cref="DocumentsModule"/> is used to display Documents view in the Main Region.
    /// </summary>
    [Module(ModuleName = ModuleNames.Documents)]
    public class DocumentsModule : IModule, IModulePresentation
    {
        private readonly IUnityContainer container;
        private readonly IRegionManager regionManager;
        private readonly IEventAggregator eventAggregator;
        private readonly IServerContextService serverContextService;


        public DocumentsModule(IUnityContainer container, IRegionManager regionManager, IEventAggregator eventAggregator,
            IServerContextService serverContextService)
        {
            this.container = container;
            this.regionManager = regionManager;
            this.eventAggregator = eventAggregator;
            this.serverContextService = serverContextService;
        }

        /// <summary>
        /// A View associated with the module.
        /// </summary>
        public object View
        {
            get
            {
                // Each ServerContext shall have a PresentationModel
                DocumentsPresentationModel presentationModel = (DocumentsPresentationModel)TryResolve<IPresentationModel>(serverContextService.CurrentServerContext.Uid);

                if (presentationModel == null)
                {
                    // If there is no a PresentationModel associated with the ServerContext
                    // (i.e. the module was not called/displayed for the currently selected Server), create it.
                    container.RegisterType<IPresentationModel, DocumentsPresentationModel>(serverContextService.CurrentServerContext.Uid, new ContainerControlledLifetimeManager());

                    // Create a PresentationModel
                    presentationModel = (DocumentsPresentationModel)container.Resolve<IPresentationModel>(serverContextService.CurrentServerContext.Uid);
                }

                return presentationModel.View;
            }
        }

        /// <summary>
        /// IModule interface method called on module loading.
        /// </summary>
        public void Initialize()
        {
            // This class exposes IModulePresentation interface, so it can be resolved by the module name
            container.RegisterInstance<IModulePresentation>(ModuleNames.Documents, this);
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
