//
// App.xaml.cs
// Author: Eugene Pankov
// January 26, 2009

using System.Windows;


namespace CompositeWpfApp
{
    /// <summary>
    /// Interaction logic for App.xaml
    /// </summary>
    public partial class App : Application
    {
        public App()
        {
            Bootstrapper bootStrapper = new Bootstrapper();
            bootStrapper.Run();
        }
    }
}
