//
// TabItemClosable.cs
// Author: Eugene Pankov
// January 31, 2009

using System.Windows;
using System.Windows.Controls;


namespace CWA.UIControls
{
    /// <summary>
    /// TabItem that can be closed.
    /// </summary>
    public class TabItemClosable : TabItem
    {
        /// <summary>
        /// Make a CanClose dependency property so it can use databinding.
        /// </summary>
        public static readonly DependencyProperty CanCloseProperty =
            DependencyProperty.RegisterAttached("CanClose", typeof(bool), typeof(TabItemClosable));


        /// <summary>
        /// Static constructor
        /// </summary>
        static TabItemClosable()
        {
            DefaultStyleKeyProperty.OverrideMetadata(typeof(TabItemClosable),
                new FrameworkPropertyMetadata(typeof(TabItemClosable)));
        }

        /// <summary>
        /// CanClose DependencyProperty. Specifies whether the TabItem can be closed.
        /// </summary>
        public bool CanClose
        {
            get { return (bool)GetValue(CanCloseProperty); }
            set { SetValue(CanCloseProperty, value); }
        }
    }
}
