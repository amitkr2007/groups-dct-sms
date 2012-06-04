using System.IO;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Markup;
using System.Xml;
using Microsoft.Windows.Controls.Ribbon;
using VM = RibbonWindowSample.ViewModel;

namespace RibbonWindowSample
{
    /// <summary>
    /// Interaction logic for UserControlMvvm.xaml
    /// </summary>
    public partial class UserControlMvvm : UserControl
    {
        public UserControlMvvm()
        {
            InitializeComponent();
        }

        private void UserControl_Loaded(object sender, RoutedEventArgs e)
        {
            if (ribbon.QuickAccessToolBar == null)
            {
                ribbon.QuickAccessToolBar = new RibbonQuickAccessToolBar();
            }

            LoadQatItems(ribbon.QuickAccessToolBar);
        }

        internal void UserControl_Unloaded(object sender, RoutedEventArgs e)
        {
            SaveQatItems(ribbon.QuickAccessToolBar);
        }

        private void SaveQatItems(RibbonQuickAccessToolBar qat)
        {
            if (qat != null)
            {
                VM.QatItemCollection qatItems = new VM.QatItemCollection();
                VM.QatItemCollection remainingItems = new VM.QatItemCollection();

                if (qat.Items.Count > 0)
                {
                    for (int qatIndex = 0; qatIndex < qat.Items.Count; qatIndex++)
                    {
                        object instance = qat.Items[qatIndex];
                        bool isSplitHeader = false;

                        if (instance is FrameworkElement)
                        {
                            FrameworkElement element = (FrameworkElement)instance;
                            instance = ((FrameworkElement)instance).DataContext;

                            isSplitHeader =
                                (instance is VM.SplitMenuItemData && element is ButtonBase) ||
                                (instance is VM.SplitButtonData && element is ButtonBase);
                        }

                        VM.QatItem qatItem = new VM.QatItem(instance, isSplitHeader);
                        qatItems.Add(qatItem);
                        remainingItems.Add(qatItem);
                    }

                    VM.RibbonData ribbonData = VM.ViewModelData.RibbonData;
                    for (int tabIndex = 0; tabIndex < ribbonData.TabDataCollection.Count && remainingItems.Count > 0; tabIndex++)
                    {
                        for (int qatIndex = 0; qatIndex < remainingItems.Count; qatIndex++)
                        {
                            VM.QatItem qatItem = remainingItems[qatIndex];
                            qatItem.TabIndex = tabIndex;
                        }

                        VM.TabData tabData = ribbonData.TabDataCollection[tabIndex];
                        for (int groupIndex = 0; groupIndex < tabData.GroupDataCollection.Count && remainingItems.Count > 0; groupIndex++)
                        {
                            VM.GroupData groupData = tabData.GroupDataCollection[groupIndex];
                            for (int qatIndex = 0; qatIndex < remainingItems.Count; qatIndex++)
                            {
                                VM.QatItem qatItem = remainingItems[qatIndex];
                                qatItem.GroupIndex = groupIndex;

                                if (qatItem.Instance == groupData)
                                {
                                    remainingItems.Remove(qatItem);
                                    qatIndex--;
                                }
                            }

                            for (int controlIndex = 0; controlIndex < groupData.ControlDataCollection.Count && remainingItems.Count > 0; controlIndex++)
                            {
                                for (int qatIndex = 0; qatIndex < remainingItems.Count; qatIndex++)
                                {
                                    VM.QatItem qatItem = remainingItems[qatIndex];
                                    qatItem.ControlIndices.Add(controlIndex);
                                }

                                VM.ControlData controlData = groupData.ControlDataCollection[controlIndex];
                                bool matched = SaveQatControlData(remainingItems, controlData);
                                if (!matched)
                                {
                                    for (int qatIndex = 0; qatIndex < remainingItems.Count; qatIndex++)
                                    {
                                        VM.QatItem qatItem = remainingItems[qatIndex];
                                        qatItem.ControlIndices.Clear();
                                    }
                                }
                            }
                        }
                    }
                }

                XmlWriter xmlWriter = XmlWriter.Create(_qatFileName);
                XamlWriter.Save(qatItems, xmlWriter);
                xmlWriter.Close();
            }
        }

        private bool SaveQatControlData(
            VM.QatItemCollection remainingItems,
            VM.ControlData controlData)
        {
            bool matched = false;

            for (int qatIndex = 0; qatIndex < remainingItems.Count; qatIndex++)
            {
                VM.QatItem qatItem = remainingItems[qatIndex];
                if (qatItem.Instance == controlData)
                {
                    if (qatItem.IsSplitHeader)
                    {
                        // This is the case of the Header of a SplitButton 
                        // or a SplitMenuItem added to the QAT. Note -1 is 
                        // the sentinel being used to indicate this case.

                        qatItem.ControlIndices.Add(-1);
                    }

                    remainingItems.Remove(qatItem);
                    qatIndex--;
                    matched = true;
                }
            }

            VM.MenuButtonData menuButtonData = controlData as VM.MenuButtonData;
            if (menuButtonData != null)
            {
                for (int controlIndex = 0; controlIndex < menuButtonData.ControlDataCollection.Count && remainingItems.Count > 0; controlIndex++)
                {
                    controlData = menuButtonData.ControlDataCollection[controlIndex];

                    for (int qatIndex = 0; qatIndex < remainingItems.Count; qatIndex++)
                    {
                        VM.QatItem qatItem = remainingItems[qatIndex];
                        qatItem.ControlIndices.Add(controlIndex);
                    }

                    matched = SaveQatControlData(remainingItems, controlData);
                    if (!matched)
                    {
                        for (int qatIndex = 0; qatIndex < remainingItems.Count; qatIndex++)
                        {
                            VM.QatItem qatItem = remainingItems[qatIndex];
                            qatItem.ControlIndices.RemoveAt(qatItem.ControlIndices.Count - 1);
                        }
                    }
                }
            }

            return matched;
        }

        private void LoadQatItems(RibbonQuickAccessToolBar qat)
        {
            if (qat != null)
            {
                if (File.Exists(_qatFileName))
                {
                    XmlReader xmlReader = XmlReader.Create(_qatFileName);
                    VM.QatItemCollection qatItems = (VM.QatItemCollection)XamlReader.Load(xmlReader);
                    xmlReader.Close();
                    if (qatItems != null)
                    {
                        int remainingItemsCount = qatItems.Count;
                        VM.QatItemCollection tabMatchedItems = new VM.QatItemCollection();
                        VM.QatItemCollection groupMatchedItems = new VM.QatItemCollection();

                        if (qatItems.Count > 0)
                        {
                            VM.RibbonData ribbonData = VM.ViewModelData.RibbonData;
                            for (int tabIndex = 0; tabIndex < ribbonData.TabDataCollection.Count && remainingItemsCount > 0; tabIndex++)
                            {
                                tabMatchedItems.Clear();
                                for (int qatIndex = 0; qatIndex < qatItems.Count; qatIndex++)
                                {
                                    VM.QatItem qatItem = qatItems[qatIndex];
                                    if (qatItem.TabIndex == tabIndex)
                                    {
                                        tabMatchedItems.Add(qatItem);
                                    }
                                }

                                VM.TabData tabData = ribbonData.TabDataCollection[tabIndex];
                                for (int groupIndex = 0; groupIndex < tabData.GroupDataCollection.Count && tabMatchedItems.Count > 0 && remainingItemsCount > 0; groupIndex++)
                                {
                                    VM.GroupData groupData = tabData.GroupDataCollection[groupIndex];

                                    groupMatchedItems.Clear();
                                    for (int qatIndex = 0; qatIndex < tabMatchedItems.Count; qatIndex++)
                                    {
                                        VM.QatItem qatItem = tabMatchedItems[qatIndex];
                                        if (qatItem.GroupIndex == groupIndex)
                                        {
                                            if (qatItem.ControlIndices.Count == 0)
                                            {
                                                qatItem.Instance = groupData;
                                                remainingItemsCount--;
                                            }
                                            else
                                            {
                                                groupMatchedItems.Add(qatItem);
                                            }
                                        }
                                    }

                                    for (int controlIndex = 0; controlIndex < groupData.ControlDataCollection.Count && groupMatchedItems.Count > 0 && remainingItemsCount > 0; controlIndex++)
                                    {
                                        VM.ControlData controlData = groupData.ControlDataCollection[controlIndex];
                                        LoadQatControlData(groupMatchedItems, 0, controlIndex, controlData, ref remainingItemsCount);
                                    }
                                }
                            }

                            for (int qatIndex = 0; qatIndex < qatItems.Count; qatIndex++)
                            {
                                VM.QatItem qatItem = qatItems[qatIndex];
                                Control control = MapQatDataToControl(qatItem);
                                if (control != null)
                                {
                                    qat.Items.Add(control);
                                }
                            }
                        }
                    }
                }
            }
        }

        private void LoadQatControlData(
            VM.QatItemCollection previouslyMatchedItems,
            int matchLevel,
            int controlIndex,
            VM.ControlData controlData,
            ref int remainingItemsCount)
        {
            VM.QatItemCollection matchedItems = new VM.QatItemCollection();
            for (int qatIndex = 0; qatIndex < previouslyMatchedItems.Count; qatIndex++)
            {
                VM.QatItem qatItem = previouslyMatchedItems[qatIndex];
                if (qatItem.ControlIndices[matchLevel] == controlIndex)
                {
                    if (qatItem.ControlIndices.Count == matchLevel + 1)
                    {
                        qatItem.Instance = controlData;
                        remainingItemsCount--;
                    }
                    else if (qatItem.ControlIndices.Count == matchLevel + 2 && qatItem.ControlIndices[matchLevel + 1] == -1)
                    {
                        qatItem.IsSplitHeader = true;
                        qatItem.Instance = controlData;
                        remainingItemsCount--;
                    }
                    else
                    {
                        matchedItems.Add(qatItem);
                    }
                }
            }

            VM.MenuButtonData menuButtonData = controlData as VM.MenuButtonData;
            if (menuButtonData != null)
            {
                for (controlIndex = 0; controlIndex < menuButtonData.ControlDataCollection.Count && matchedItems.Count > 0 && remainingItemsCount > 0; controlIndex++)
                {
                    controlData = menuButtonData.ControlDataCollection[controlIndex];
                    LoadQatControlData(matchedItems, matchLevel + 1, controlIndex, controlData, ref remainingItemsCount);
                }
            }
        }

        private static Control MapQatDataToControl(VM.QatItem qatItem)
        {
            string typeName = qatItem.Instance.GetType().Name;
            Control control = null;

            switch (typeName)
            {
                case "ButtonData":
                    {
                        control = new RibbonButton();
                        control.DataContext = qatItem.Instance;
                        break;
                    }
                case "ToggleButtonData":
                    {
                        control = new RibbonToggleButton();
                        control.DataContext = qatItem.Instance;
                        break;
                    }
                case "RadioButtonData":
                    {
                        control = new RibbonRadioButton();
                        control.DataContext = qatItem.Instance;
                        break;
                    }
                case "CheckBoxData":
                    {
                        control = new RibbonCheckBox();
                        control.DataContext = qatItem.Instance;
                        break;
                    }
                case "TextBoxData":
                    {
                        control = new RibbonTextBox();
                        control.DataContext = qatItem.Instance;
                        break;
                    }
                case "MenuButtonData":
                    {
                        control = new RibbonMenuButton();
                        control.DataContext = qatItem.Instance;
                        break;
                    }
                case "SplitButtonData":
                    {
                        if (!qatItem.IsSplitHeader)
                        {
                            control = new RibbonSplitButton();
                        }
                        else
                        {
                            VM.SplitButtonData splitButtonData = (VM.SplitButtonData)qatItem.Instance;
                            if (splitButtonData.IsCheckable)
                            {
                                control = new RibbonToggleButton();
                            }
                            else
                            {
                                control = new RibbonButton();
                            }
                        }
                        control.DataContext = qatItem.Instance;
                        break;
                    }
                case "ComboBoxData":
                    {
                        control = new RibbonComboBox();
                        control.DataContext = qatItem.Instance;
                        break;
                    }
                case "MenuItemData":
                    {
                        VM.MenuItemData menuItemData = (VM.MenuItemData)qatItem.Instance;
                        if (menuItemData.ControlDataCollection.Count > 0)
                        {
                            control = new RibbonMenuButton();
                        }
                        else
                        {
                            control = new RibbonButton();
                        }
                        control.DataContext = qatItem.Instance;
                        break;
                    }
                case "SplitMenuItemData":
                    {
                        VM.SplitMenuItemData splitMenuItemData = (VM.SplitMenuItemData)qatItem.Instance;
                        if (!qatItem.IsSplitHeader)
                        {
                            if (splitMenuItemData.ControlDataCollection.Count > 0)
                            {
                                control = new RibbonSplitButton();
                            }
                            else if (splitMenuItemData.IsCheckable)
                            {
                                control = new RibbonToggleButton();
                            }
                            else
                            {
                                control = new RibbonButton();
                            }
                        }
                        else
                        {
                            control = new RibbonToggleButton();
                        }
                        control.DataContext = qatItem.Instance;
                        break;
                    }
                case "GalleryData":
                    {
                        RibbonGallery gallery = new RibbonGallery();
                        RibbonMenuButton menuButton = new RibbonMenuButton();
                        menuButton.ItemsSource = new object[] { gallery };

                        control = menuButton;
                        control.DataContext = qatItem.Instance;
                        break;
                    }
                case "GroupData":
                    {
                        control = new RibbonGroup();
                        control.DataContext = qatItem.Instance;
                        break;
                    }
            }

            return control;
        }

        private const string _qatFileName = "RibbonWindowMvvm_QAT.xml";
    }
}
