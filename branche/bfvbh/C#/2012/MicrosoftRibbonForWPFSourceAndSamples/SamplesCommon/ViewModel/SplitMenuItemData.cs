﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace RibbonWindowSample.ViewModel
{
    public class SplitMenuItemData : MenuItemData
    {
        public SplitMenuItemData()
            : this(false)
        {
        }

        public SplitMenuItemData(bool isApplicationMenu)
            : base(isApplicationMenu)
        {
        }
    }
}
