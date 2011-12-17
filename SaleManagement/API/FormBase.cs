using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace SaleManagement.API
{
    public class FormBase : Form
    {
        public virtual int TabID { get; set; }
    }
}
