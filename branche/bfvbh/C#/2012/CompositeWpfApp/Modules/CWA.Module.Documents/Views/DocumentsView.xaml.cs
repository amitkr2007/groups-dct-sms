//
// DocumentsView.cs
// Author: Eugene Pankov
// February 3, 2008

using System;
using System.Windows.Controls;
using Microsoft.Practices.Unity;
using Microsoft.Practices.Composite.Events;
using CWA.Infrastructure;


namespace CWA.Module.Documents
{
    /// <summary>
    /// Class <see cref="DocumentsView"/> presents Documents view displayed in the Main Region.
    /// </summary>
    public partial class DocumentsView : ModuleViewBase
    {
        /// <summary>
        /// Main Menu associated with the view.
        /// </summary>
        public UserControl Menu { get; set; }

        /// <summary>
        /// Text displayed in the view.
        /// </summary>
        public string Text 
        {
            set
            {
                textBlock.Text = textBlock.Text + value + "\n";
            }
        }


        public DocumentsView()
        {
            InitializeComponent();
        }

        public DocumentsView(IUnityContainer container, IEventAggregator eventAggregator)
            : this()
        {
            base.container = container;
            base.eventAggregator = eventAggregator;

            Menu = container.Resolve<DocumentsMainMenuView>();
        }

        /// <summary>
        /// A method invoking each time the view is activated.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected override void ViewActivated(object sender, EventArgs e)
        {
            base.ViewActivated(sender, e);

            if (Menu != null)
                eventAggregator.GetEvent<MainMenuChangeEvent>().Publish(Menu);
        }
    }
}
