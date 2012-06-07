//
// DocumentsPresentationModel.cs
// Author: Eugene Pankov
// February 3, 2008

using System;
using Microsoft.Practices.Unity;
using Microsoft.Practices.Composite.Presentation.Commands;
using CWA.Infrastructure;


namespace CWA.Module.Documents
{
    /// <summary>
    /// Class <see cref="DocumentsPresentationModel"/> observes the Documents model
    /// and notifies the view of changes in the visual content.
    /// </summary>
    public class DocumentsPresentationModel : IPresentationModel
    {
        private readonly IUnityContainer container;
        private readonly IServerContextService serverContextService;
        private readonly DocumentsView view;

        public DelegateCommand<object> NewDocumentCommand { get; private set; }
        public DelegateCommand<object> CutCommand { get; private set; }
        public DelegateCommand<object> CopyCommand { get; private set; }
        public DelegateCommand<object> DeleteCommand { get; private set; }
        public DelegateCommand<object> RenameCommand { get; private set; }
        public DelegateCommand<object> PropertiesCommand { get; private set; }


        /// <summary>
        /// A view associated with the model.
        /// </summary>
        public object View
        {
            get { return view; }
        }

        public DocumentsPresentationModel(IUnityContainer container, IServerContextService serverContextService)
        {
            this.container = container;
            this.serverContextService = serverContextService;

            view = container.Resolve<DocumentsView>();
            view.Menu.DataContext = this;

            view.Text = serverContextService.CurrentServerContext.Name;

            NewDocumentCommand = new DelegateCommand<object>(NewDocument, CanExecuteCommand);
            CutCommand = new DelegateCommand<object>(Cut, CanExecuteCommand);
            CopyCommand = new DelegateCommand<object>(Copy, CanExecuteCommand);
            DeleteCommand = new DelegateCommand<object>(Delete, CanExecuteCommand);
            RenameCommand = new DelegateCommand<object>(Rename, CanExecuteCommand);
            PropertiesCommand = new DelegateCommand<object>(Properties, CanExecuteCommand);
        }

        private bool CanExecuteCommand(object arg)
        {
            return true;
        }

        private void NewDocument(object obj)
        {
            view.Text = "New Document";
        }

        private void Cut(object obj)
        {
            view.Text = "Cut";
        }

        private void Copy(object obj)
        {
            view.Text = "Copy";
        }

        private void Delete(object obj)
        {
            view.Text = "Delete";
        }

        private void Rename(object obj)
        {
            view.Text = "Rename";
        }

        private void Properties(object obj)
        {
            view.Text = "Properties";
        }
    }
}
