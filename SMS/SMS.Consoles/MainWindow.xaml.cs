using SMS.Lib.UI.WPF;
using System.Windows;
using System.Windows.Input;

namespace SMS.Consoles
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : MainBase
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void OnSelectLayout(object sender, System.Windows.Controls.SelectionChangedEventArgs e)
        {
            if (e.AddedItems[0] != null)
            {
                Layout = (Layout)e.AddedItems[0];
            }
        }

        private void OnOfficeButtonClick(object sender, ExecutedRoutedEventArgs e)
        {
            MessageBox.Show("OfficeButton notification received in derived Window class!");
        }


        private void OnHelp(object sender, ExecutedRoutedEventArgs e)
        {
            MessageBox.Show("Display Help file!");
        }
    }
}
