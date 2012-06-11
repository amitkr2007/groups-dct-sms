//
// Bootstrapper.cs
// Author: Eugene Pankov
// January 26, 2009

using System.Windows;
using System.Collections;
using System.Collections.Generic;
using Microsoft.Practices.Unity;
using Microsoft.Practices.Composite.Modularity;
using Microsoft.Practices.Composite.UnityExtensions;
using CWA.Infrastructure;
using CompositeWpfApp.Controllers;
using CompositeWpfApp.CommandControllers;


namespace CompositeWpfApp
{
    /// <summary>
    /// UnityBootstrapper enables all of the Composite Application Library services by default.
    /// </summary>
    class Bootstrapper : UnityBootstrapper
    {
        /// <summary>
        /// Creates the shell or main window of the application.
        /// </summary>
        /// <returns>The shell of the application.</returns>
        protected override DependencyObject CreateShell()
        {
            Shell shell = Container.Resolve<Shell>();

            if (shell != null)
            {
                shell.Show();
            }

            // Run controllers
            IEnumerable<IGeneralController> controllers = Container.ResolveAll<IGeneralController>();

            if (controllers != null)
            {
                foreach (IGeneralController controller in controllers)
                {
                    controller.Run();
                }
            }

            return shell;
        }

        /// <summary>
        /// Defines the enumeration strategy for modules.
        /// </summary>
        /// <returns>IModuleCatalog</returns>
        protected override IModuleCatalog GetModuleCatalog()
        {
            // ConfigurationModuleCatalog class builds a catalog of modules from a configuration file
            return new ConfigurationModuleCatalog();
        }

        /// <summary>
        /// Configures the <see cref="IUnityContainer"/>. May be overwritten in a derived class to add specific
        /// type mappings required by the application.
        /// </summary>
        protected override void ConfigureContainer()
        {
            base.ConfigureContainer();

            // ModuleController is responsible for switching modules displayed in the Main Region
            Container.RegisterType<IGeneralController, ModuleController>(ControllerNames.ModuleController, new ContainerControlledLifetimeManager());

            // ServerController is responsible for switching current ServerContext
            Container.RegisterType<IGeneralController, ServerController>(ControllerNames.ServerController, new ContainerControlledLifetimeManager());

            // MenuController is responsible for displaying main menus associated with views
            Container.RegisterType<IGeneralController, MenuController>(ControllerNames.MenuController, new ContainerControlledLifetimeManager());

            // ServerContextService provides access to ServerContexts
            Container.RegisterType<IServerContextService, ServerContextService>(new ContainerControlledLifetimeManager());

            // Register global command controllers
            RegisterCommandControllers();
        }

        /// <summary>
        /// Registers classes responsible for executing global commands like "Exit" or "Help".
        /// </summary>
        private void RegisterCommandControllers()
        {
            Container.RegisterType<IGeneralController, ExitCommandController>(ControllerNames.ExitCommandController, new ContainerControlledLifetimeManager());
            Container.RegisterType<IGeneralController, SkinCommandController>(ControllerNames.SkinCommandController, new ContainerControlledLifetimeManager());
            Container.RegisterType<IGeneralController, AboutCommandController>(ControllerNames.AboutCommandController, new ContainerControlledLifetimeManager());
            Container.RegisterType<IGeneralController, HelpCommandController>(ControllerNames.HelpCommandController, new ContainerControlledLifetimeManager());
            Container.RegisterType<IGeneralController, SettingsCommandController>(ControllerNames.SettingsCommandController, new ContainerControlledLifetimeManager());
        }
    }
}
