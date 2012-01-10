using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace GROUP.Framework.Utilities
{
    public static class Validate
    {
        public static void Notnull(object param, string paramName)
        {
            if (param == null) throw new ArgumentNullException(paramName);
        }
    }
}
