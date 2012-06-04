using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using Common;

namespace WorkTimerTracker
{
  /// <summary>
  /// Interaction logic for MainWindow.xaml
  /// </summary>
  public partial class MainWindow : Window
  {
    private Settings mSettings = new Settings( @"MainWindow" );

    /// <summary>
    /// Returns the settings container.
    /// </summary>
    public Common.Settings Settings
    {
      get
      {
        return mSettings;
      }
    }

    public MainWindow()
    {
      InitializeComponent();
    }
  }
}
