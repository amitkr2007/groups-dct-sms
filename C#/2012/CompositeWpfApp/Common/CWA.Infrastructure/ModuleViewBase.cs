//
// ModuleViewBase.cs
// Author: Eugene Pankov
// January 31, 2009

using System;
using System.Windows.Controls;
using Microsoft.Practices.Composite;
using Microsoft.Practices.Unity;
using Microsoft.Practices.Composite.Events;


namespace CWA.Infrastructure
{
    /// <summary>
    /// Class <see cref="ModuleViewBase"/> is a base class for user controls presenting views.
    /// </summary>
    public class ModuleViewBase : UserControl, IView, IActiveAware
    {
        protected IUnityContainer container;
        protected IEventAggregator eventAggregator;

        private bool _isActive = false;


        public ModuleViewBase()
        {
            Activated += new EventHandler(ViewActivated);
        }

        /// <summary>
        /// Virtual method invoked each time the View is activated.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected virtual void ViewActivated(object sender, EventArgs e)
        {
        }

        #region IActiveAware Members

        /// <summary>
        /// Gets or sets a value indicating whether the view is active.
        /// </summary>
        /// <value><see langword="true" /> if the object is active; otherwise <see langword="false" />.</value>
        public bool IsActive
        {
            get { return _isActive; }
            set
            {
                if (_isActive != value)
                {
                    _isActive = value;
                    OnIsActiveChanged();

                    if (_isActive)
                        OnActivated();
                }
            }
        }

        /// <summary>
        /// Notifies that the value for <see cref="IsActive"/> property has changed.
        /// </summary>
        public event EventHandler IsActiveChanged;

        /// <summary>
        /// Notifies that the view is activated.
        /// </summary>
        public event EventHandler Activated;

        /// <summary>
        /// Raises the <see cref="IsActiveChanged"/> event.
        /// </summary>
        protected virtual void OnIsActiveChanged()
        {
            if (IsActiveChanged != null)
                IsActiveChanged(this, EventArgs.Empty);
        }

        /// <summary>
        /// Raises the <see cref="Activated"/> event.
        /// </summary>
        protected virtual void OnActivated()
        {
            if (Activated != null)
                Activated(this, EventArgs.Empty);
        }
        #endregion
    }
}
