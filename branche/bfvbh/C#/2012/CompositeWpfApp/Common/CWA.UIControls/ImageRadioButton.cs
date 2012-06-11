//
// ImageRadioButton.cs
// Author: Eugene Pankov
// January 31, 2009

using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using System.Windows.Media;


namespace CWA.UIControls
{
    /// <summary>
    /// Radio button class with an image on the button.
    /// </summary>
    public class ImageRadioButton : RadioButton, ICommandSource
    {
        /// <summary>
        /// Make an Icon dependency property so it can use databinding.
        /// </summary>
        public static readonly DependencyProperty IconProperty =
            DependencyProperty.RegisterAttached("Icon", typeof(ImageSource), typeof(ImageRadioButton));


        /// <summary>
        /// Static constructor
        /// </summary>
        static ImageRadioButton()
        {
            DefaultStyleKeyProperty.OverrideMetadata(typeof(ImageRadioButton), 
                new FrameworkPropertyMetadata(typeof(ImageRadioButton)));
        }

        /// <summary>
        /// Icon DependencyProperty. Points to an image to be displayed on the button.
        /// </summary>
        public ImageSource Icon
        {
            get { return (ImageSource)GetValue(IconProperty); }
            set { SetValue(IconProperty, value); }
        }
    }
}
