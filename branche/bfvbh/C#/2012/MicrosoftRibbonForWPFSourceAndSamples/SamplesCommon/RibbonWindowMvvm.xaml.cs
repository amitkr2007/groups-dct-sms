using System.ComponentModel;
using Microsoft.Windows.Controls.Ribbon;

namespace RibbonWindowSample
{
    /// <summary>
    /// Interaction logic for RibbonWindowMvvm.xaml
    /// </summary>
    public partial class RibbonWindowMvvm : RibbonWindow
    {
        public RibbonWindowMvvm()
        {
            InitializeComponent();
        }

        private void RibbonWindow_Closing(object sender, CancelEventArgs e)
        {
            MvvmControl.UserControl_Unloaded(MvvmControl, null);
        }
    }
}
