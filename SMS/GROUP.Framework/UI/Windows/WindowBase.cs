using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;

namespace GROUP.Framework.UI.Windows
{
    [TemplatePart(Name = "WindowMaximize", Type = typeof(Button))]
    [TemplatePart(Name = "WindowMinimize", Type = typeof(Button))]
    [TemplatePart(Name = "WindowClose", Type = typeof(Button))]
    [TemplatePart(Name = "WindowTitle", Type = typeof(UIElement))]
    [TemplatePart(Name = "WindowLeftBorder", Type = typeof(UIElement))]
    [TemplatePart(Name = "WindowRightBorder", Type = typeof(UIElement))]
    [TemplatePart(Name = "WindowTopBorder", Type = typeof(UIElement))]
    [TemplatePart(Name = "WindowBottonBorder", Type = typeof(UIElement))]
    [TemplatePart(Name = "WindowTopBorder", Type = typeof(UIElement))]
    public class WindowBase : Window
    {
        public WindowBase()
        {
            this.OnCreateCommand();
        }

        private void OnCreateCommand()
        {
            CommandBindings.Add(new CommandBinding(_cmdMaximize, (a, b) => { WindowState = WindowState.Minimized; }));
            CommandBindings.Add(new CommandBinding(_cmdMinimize, (a, b) => { Maximized = !this.Maximized; }));
            CommandBindings.Add(new CommandBinding(ApplicationCommands.Close, (a, b) => { Close(); }));
        }

        public override void OnApplyTemplate()
        {
            base.OnApplyTemplate();
            OnAttachCloseButton();
            OnAttachMinimizeButton();
            OnAttachMaximizeButton();
            OnAttachTitleBar();
        }

        private T GetChildControl<T>(string controlName) where T : DependencyObject
        {
            T control = GetTemplateChild(controlName) as T;
            return control;
        }     

        private void OnAttachTitleBar()
        {
            if (this.TitleBar != null)
                TitleBar.RemoveHandler(UIElement.MouseLeftButtonDownEvent, new MouseButtonEventHandler(OnTitlebarClick));

            UIElement titleBar = GetChildControl<UIElement>("WindowTitle");
            if (titleBar != null)
            {
                TitleBar = titleBar;
                titleBar.AddHandler(UIElement.MouseLeftButtonDownEvent, new MouseButtonEventHandler(OnTitlebarClick));
            }
        }

        private void OnTitlebarClick(object source, MouseButtonEventArgs args)
        {
            switch (args.ClickCount)
            {
                case 1: if (!this.Maximized) DragMove();
                        break;
                case 2: this.Maximized = !this.Maximized;
                        break;
            }
        }

        private void OnAttachMaximizeButton()
        {
            if (this.MaximizeButton != null)
                this.MaximizeButton.Command = null;
            Button btnMax = GetChildControl<Button>("WindowMaximize");
            if (btnMax!=null)
            {
                btnMax.Command = _cmdMaximize;
            }
        }

        private void OnAttachMinimizeButton()
        {
            if (this.MinimizeButton != null)
                this.MinimizeButton.Command = null;

            Button btnMin = GetChildControl<Button>("WindowMinimize");
            if (btnMin != null)
            {
                btnMin.Command = _cmdMinimize;
                this.MinimizeButton = btnMin;
            }
        }

        private void OnAttachCloseButton()
        {
            if (this.CloseButton != null)
                this.CloseButton.Command = null;

            Button btnClose = GetChildControl<Button>("WindowClose");
            if (btnClose != null)
            {
                btnClose.Command = ApplicationCommands.Close;
                this.CloseButton = btnClose;
            }
        }

        private void ApplyRestoreBounds()
        {
            Left = this.RestoreBounds.Left;
            Top = this.RestoreBounds.Top;
            Width = this.RestoreBounds.Width;
            Height = this.RestoreBounds.Height;
        }

        private void UpdateRestoreBounds()
        {
            this.RestoreBounds = new Rect(new Point(Left, Top), new Point(Left + ActualWidth, Top + ActualHeight));
        }

        private void UpdateBorderVisibility(UIElement border, Visibility visibility)
        {
            if (border != null) border.Visibility = visibility;
        }

        public bool Maximized
        {
            get
            {
                return (bool)GetValue(_proMaximized);
            }
            private set
            {
                if (value)
                {
                    this.UpdateRestoreBounds();

                    // Maximize hides taskbar, hence workaround
                    Top = Left = 0;
                    Height = SystemParameters.MaximizedPrimaryScreenHeight - SystemParameters.BorderWidth * 2;
                    Width = SystemParameters.MaximizedPrimaryScreenWidth - SystemParameters.BorderWidth * 2;

                }
                else
                {
                    this.ApplyRestoreBounds();
                }

                Visibility sizerVisibility = value ? Visibility.Hidden : Visibility.Visible;
                this.UpdateBorderVisibility(this.RightBorder, sizerVisibility);
                this.UpdateBorderVisibility(this.TopBorder, sizerVisibility);
                this.UpdateBorderVisibility(this.BottomBorder, sizerVisibility);
                this.UpdateBorderVisibility(this.LeftBorder, sizerVisibility);

                SetValue(_proMaximizeKey, value);
            }
        }

        private bool IsResizing { get; set; }

        private new Rect RestoreBounds { get; set; }

        private UIElement RightBorder { get; set; }

        private UIElement TopBorder { get; set; }

        private UIElement BottomBorder { get; set; }

        private UIElement LeftBorder { get; set; }

        private UIElement TitleBar { get; set; }

        private Button CloseButton { get; set; }

        private Button MinimizeButton { get; set; }

        private Button MaximizeButton { get; set; }

        private readonly RoutedUICommand _cmdMinimize = new RoutedUICommand
            ("Minimize", "", typeof(GROUP.Framework.UI.Windows.WindowBase));

        private readonly RoutedUICommand _cmdMaximize = new RoutedUICommand
            ("Maximize", "", typeof(GROUP.Framework.UI.Windows.WindowBase));

        public static DependencyPropertyKey _proMaximizeKey = DependencyProperty.RegisterReadOnly
            ("Maximized", typeof(bool), typeof(GROUP.Framework.UI.Windows.WindowBase), new PropertyMetadata(false));

        public static DependencyProperty _proMaximized = _proMaximizeKey.DependencyProperty;
    }
}
