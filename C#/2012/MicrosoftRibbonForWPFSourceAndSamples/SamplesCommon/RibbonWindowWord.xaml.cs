using System;
using System.Windows;
using Microsoft.Windows.Controls.Ribbon;

namespace RibbonWindowSample
{
    /// <summary>
    /// Interaction logic for RibbonWindowWord.xaml
    /// </summary>
    public partial class RibbonWindowWord : RibbonWindow
    {
        public RibbonWindowWord()
        {
            InitializeComponent();
            Application.Current.Properties["WordControlRef"] = new WeakReference(WordControl);
        }

        private void RibbonWindow_Closing(object sender, System.ComponentModel.CancelEventArgs e)
        {
            WordControl.UserControl_Unloaded(WordControl, null);
        }
    }
}
