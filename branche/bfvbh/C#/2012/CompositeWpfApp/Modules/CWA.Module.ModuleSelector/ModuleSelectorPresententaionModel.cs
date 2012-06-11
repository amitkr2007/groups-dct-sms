//
// ModuleSelectorPresententaionModel.cs
// Author: Eugene Pankov
// February 3, 2008
//
// Subscribes to CompositePresentationEvent events:
//      ServerContextChangedEvent
//      ServerContextClearedEvent
//
// Publishes CompositePresentationEvent events:
//      ModuleChangeEvent

using System;
using System.Collections;
using System.Windows;
using System.Windows.Controls;
using Microsoft.Practices.Composite.Events;
using Microsoft.Practices.Composite.Presentation.Events;
using Microsoft.Practices.Composite.Presentation.Commands;
using CWA.UIControls;
using CWA.Infrastructure;


namespace CWA.Module.ModuleSelector
{
    /// <summary>
    /// Class <see cref="ModuleSelectorPresententaionModel"/> observes the ModuleSelector model
    /// and notifies the view of changes in the visual content.
    /// </summary>
    public class ModuleSelectorPresententaionModel
    {
        private const string RadioButtonContainer = "RadioButtonContainer";

        private readonly IEventAggregator eventAggregator;
        private readonly IServerContextService serverContextService;

        /// <summary>
        /// Currently selected module name.
        /// </summary>
        public string CurrentModuleName { get; private set; }

        /// <summary>
        /// A view associated with the ModuleSelector.
        /// </summary>
        public ModuleSelectorView View { get; private set; }


        public ModuleSelectorPresententaionModel(IEventAggregator eventAggregator, ModuleSelectorView view, IServerContextService serverContextService)
        {
            this.eventAggregator = eventAggregator;
            this.serverContextService = serverContextService;

            View = view;
            View.DataContext = this;

            // Defines Execute and CanExecute methods for radio buttons
            foreach (ImageRadioButton button in CommandSources((Panel)View.FindName(RadioButtonContainer)))
            {
                button.Command = new DelegateCommand<string>(SelectModule, CanSelectModule);
            }

            eventAggregator.GetEvent<ServerContextChangedEvent>().Subscribe(ServerContextChanged, ThreadOption.UIThread, true);
            eventAggregator.GetEvent<ServerContextClearedEvent>().Subscribe(ServerContextCleared, ThreadOption.UIThread, true);
        }

        /// <summary>
        /// Saves selected module name and fires ModuleChangeEvent.
        /// </summary>
        /// <param name="moduleName">Module name specified in command parameter.</param>
        /// <exception cref="ArgumentNullException">Missing module name.</exception>
        private void SelectModule(string moduleName)
        {
            if (string.IsNullOrEmpty(moduleName))
                throw new ArgumentNullException("moduleName", "Empty module name.");

            if (CurrentModuleName != moduleName)
            {
                CurrentModuleName = moduleName;
                eventAggregator.GetEvent<ModuleChangeEvent>().Publish(moduleName);
            }
        }

        /// <summary>
        /// Checks whether access to the command is permitted by current ServerContext.
        /// </summary>
        /// <param name="moduleName">Module name.</param>
        /// <returns>True if the module is accessible.</returns>
        private bool CanSelectModule(string moduleName)
        {
            if (string.IsNullOrEmpty(moduleName))
                throw new ArgumentNullException("moduleName", "Empty module name.");

            if (serverContextService.CurrentServerContext == null)
                return false;

            return serverContextService.CurrentServerContext.PermitsAccessToModule(moduleName);
        }

        /// <summary>
        /// Checks ImageRadioButtons according to selected module name and fires CanExecuteChanged event.
        /// </summary>
        /// <param name="serverContext">ServerContext.</param>
        private void ServerContextChanged(ServerContext serverContext)
        {
            CurrentModuleName = string.Empty;

            foreach (ImageRadioButton button in CommandSources((Panel)View.FindName(RadioButtonContainer)))
            {
                if (string.Compare((string)button.CommandParameter, serverContext.CurrentModule, true) == 0)
                {
                    button.IsChecked = true;
                    SelectModule(serverContext.CurrentModule);
                }

                RaiseCanExecuteChanged(button);
            }
        }

        /// <summary>
        /// Raises CanExecuteChanged event for all ImageRadioButton elements.
        /// </summary>
        /// <param name="obj">Null.</param>
        private void ServerContextCleared(object obj)
        {
            CurrentModuleName = string.Empty;

            foreach (ImageRadioButton button in CommandSources((Panel)View.FindName(RadioButtonContainer)))
            {
                button.IsChecked = false;
                RaiseCanExecuteChanged(button);
            }
        }

        /// <summary>
        /// Raises CanExecuteChanged event for the button.
        /// </summary>
        /// <param name="button">ImageRadioButton.</param>
        private void RaiseCanExecuteChanged(ImageRadioButton button)
        {
            if (button != null && button.Command != null)
            {
                DelegateCommand<string> command = (DelegateCommand<string>)button.Command;
                if (command != null)
                    command.RaiseCanExecuteChanged();
            }
        }

        /// <summary>
        /// Provides ImageRadioButton value to the enumerator object.
        /// </summary>
        /// <param name="collection">Panel.</param>
        /// <returns>ImageRadioButton.</returns>
        private static IEnumerable CommandSources(Panel panel)
        {
            if(panel == null || panel.Children.Count == 0)
                yield break;

            foreach (UIElement element in panel.Children)
            {
                // Consider only ImageRadioButton objects
                if (element is ImageRadioButton)
                {
                    yield return (ImageRadioButton)element;
                }
            }
        }
    }
}
