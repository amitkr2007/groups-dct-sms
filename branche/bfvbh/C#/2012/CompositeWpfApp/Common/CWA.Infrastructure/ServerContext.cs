//
// ServerContext.cs
// Author: Eugene Pankov
// January 31, 2009

using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;


namespace CWA.Infrastructure
{
    /// <summary>
    /// Class <see cref="ServerContext"/> contains server-specific attributes.
    /// </summary>
    public class ServerContext
    {
        private List<string> modules = new List<string>();
        private string currentModule = null;

        /// <summary>
        /// Unique context identifier.
        /// </summary>
        public string Uid { get; private set; }

        /// <summary>
        /// Server name.
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// Currently selected module.
        /// </summary>
        public string CurrentModule
        {
            get
            {
                // Get first module as first current one
                if (currentModule == null && modules.Count > 0)
                    currentModule = modules[0];

                return currentModule;
            }
            set { currentModule = value; }
        }

        /// <summary>
        /// List of modules accessible for the user.
        /// </summary>
        public List<string> Modules
        {
            set 
            {
                if (value != null)
                    modules = value;
                else
                    modules = new List<string>();
            }
        }


        public ServerContext() 
        {
            Uid = Guid.NewGuid().ToString();
        }

        public ServerContext(string name) : this()
        {
            Name = name;
        }

        /// <summary>
        /// Returns True if the <paramref name="moduleName"/> is in the list of permitted modules.
        /// </summary>
        /// <param name="moduleName">Module name.</param>
        /// <returns>True if the module is permitted.</returns>
        /// <exception cref="ArgumentNullException">Missing module name.</exception>
        public bool PermitsAccessToModule(string moduleName)
        {
            if (string.IsNullOrEmpty(moduleName))
                throw new ArgumentNullException("moduleName", "Empty module name.");

            return modules.Contains(moduleName, new ModuleComparer());
        }
    }

    #region ModuleComparer
    /// <summary>
    /// Comparer used to compare module names.
    /// </summary>
    class ModuleComparer : IEqualityComparer<string>
    {
        bool IEqualityComparer<string>.Equals(string x, string y)
        {
            return string.Compare(x, y, true) == 0;
        }

        int IEqualityComparer<string>.GetHashCode(string obj)
        {
            return obj.ToLower().GetHashCode();
        }
    } 
    #endregion
}
