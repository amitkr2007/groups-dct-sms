using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;

namespace SaleManagement.DAL
{
    public class CommonDAO
    {
        private static SaleEntities _DBContext;
 
        public static SaleEntities DBContext
        {
            get
            {
                if (_DBContext == null)
                {
                    return new SaleEntities();                    
                }
                return _DBContext;                
            }
        }
    }
}
