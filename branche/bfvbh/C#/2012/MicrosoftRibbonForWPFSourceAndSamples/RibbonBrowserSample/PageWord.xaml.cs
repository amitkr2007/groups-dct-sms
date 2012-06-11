using System;
using System.Windows;
using System.Windows.Controls;

namespace RibbonBrowserSample
{
    /// <summary>
    /// Interaction logic for PageWord.xaml
    /// </summary>
    public partial class PageWord : Page
    {
        public PageWord()
        {
            InitializeComponent();
            Application.Current.Properties["WordControlRef"] = new WeakReference(WordControl);
        }
    }
}
