//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.1
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------


namespace SMS.Lib.UI.WPF {
    
    
    [System.Runtime.InteropServices.ComVisible(false)]
    public partial class MainBase : System.Activities.Activity, System.ComponentModel.ISupportInitialize {
        
        private bool _contentLoaded;
        
        internal System.Windows.Controls.Border MainBorder;
        
        internal System.Windows.Shapes.Rectangle PART_LEFT_BORDER;
        
        internal System.Windows.Shapes.Rectangle PART_RIGHT_BORDER;
        
        internal System.Windows.Shapes.Rectangle PART_TOP_BORDER;
        
        internal System.Windows.Shapes.Rectangle PART_BOTTOM_BORDER;
        
        internal System.Windows.Controls.Border PART_TITLEBAR;
        
        internal System.Windows.Controls.Button PART_CLOSE;
        
        internal System.Windows.Controls.Button PART_MAXIMIZE_RESTORE;
        
        internal System.Windows.Controls.Image MaximizeRestoreImage;
        
        internal System.Windows.Controls.Button PART_MINIMIZE;
        
        public MainBase() {
            this.InitializeComponent();
        }
        
        /// <summary>
        /// InitializeComponent
        /// </summary>
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        public void InitializeComponent() {
            if ((this._contentLoaded == true)) {
                return;
            }
            this._contentLoaded = true;
            string resourceName = this.FindResource();
            System.IO.Stream initializeXaml = typeof(MainBase).Assembly.GetManifestResourceStream(resourceName);
            System.Xml.XmlReader xmlReader = null;
            System.Xaml.XamlReader reader = null;
            System.Xaml.XamlObjectWriter objectWriter = null;
            try {
                System.Xaml.XamlSchemaContext schemaContext = XamlStaticHelperNamespace._XamlStaticHelper.SchemaContext;
                xmlReader = System.Xml.XmlReader.Create(initializeXaml);
                System.Xaml.XamlXmlReaderSettings readerSettings = new System.Xaml.XamlXmlReaderSettings();
                readerSettings.LocalAssembly = System.Reflection.Assembly.GetExecutingAssembly();
                readerSettings.AllowProtectedMembersOnRoot = true;
                reader = new System.Xaml.XamlXmlReader(xmlReader, schemaContext, readerSettings);
                System.Xaml.XamlObjectWriterSettings writerSettings = new System.Xaml.XamlObjectWriterSettings();
                writerSettings.RootObjectInstance = this;
                writerSettings.AccessLevel = System.Xaml.Permissions.XamlAccessLevel.PrivateAccessTo(typeof(MainBase));
                objectWriter = new System.Xaml.XamlObjectWriter(schemaContext, writerSettings);
                System.Xaml.XamlServices.Transform(reader, objectWriter);
                MainBorder = ((System.Windows.Controls.Border)(objectWriter.RootNameScope.FindName("MainBorder")));
                PART_LEFT_BORDER = ((System.Windows.Shapes.Rectangle)(objectWriter.RootNameScope.FindName("PART_LEFT_BORDER")));
                PART_RIGHT_BORDER = ((System.Windows.Shapes.Rectangle)(objectWriter.RootNameScope.FindName("PART_RIGHT_BORDER")));
                PART_TOP_BORDER = ((System.Windows.Shapes.Rectangle)(objectWriter.RootNameScope.FindName("PART_TOP_BORDER")));
                PART_BOTTOM_BORDER = ((System.Windows.Shapes.Rectangle)(objectWriter.RootNameScope.FindName("PART_BOTTOM_BORDER")));
                PART_TITLEBAR = ((System.Windows.Controls.Border)(objectWriter.RootNameScope.FindName("PART_TITLEBAR")));
                PART_CLOSE = ((System.Windows.Controls.Button)(objectWriter.RootNameScope.FindName("PART_CLOSE")));
                PART_MAXIMIZE_RESTORE = ((System.Windows.Controls.Button)(objectWriter.RootNameScope.FindName("PART_MAXIMIZE_RESTORE")));
                MaximizeRestoreImage = ((System.Windows.Controls.Image)(objectWriter.RootNameScope.FindName("MaximizeRestoreImage")));
                PART_MINIMIZE = ((System.Windows.Controls.Button)(objectWriter.RootNameScope.FindName("PART_MINIMIZE")));
            }
            finally {
                if ((xmlReader != null)) {
                    ((System.IDisposable)(xmlReader)).Dispose();
                }
                if ((reader != null)) {
                    ((System.IDisposable)(reader)).Dispose();
                }
                if ((objectWriter != null)) {
                    ((System.IDisposable)(objectWriter)).Dispose();
                }
            }
        }
        
        private string FindResource() {
            string[] resources = typeof(MainBase).Assembly.GetManifestResourceNames();
            for (int i = 0; (i < resources.Length); i = (i + 1)) {
                string resource = resources[i];
                if ((resource.Contains(".MainBase.g.xaml") || resource.Equals("MainBase.g.xaml"))) {
                    return resource;
                }
            }
            throw new System.InvalidOperationException("Resource not found.");
        }
        
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1033")]
        void System.ComponentModel.ISupportInitialize.BeginInit() {
        }
        
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1033")]
        void System.ComponentModel.ISupportInitialize.EndInit() {
            this.InitializeComponent();
        }
    }
}
