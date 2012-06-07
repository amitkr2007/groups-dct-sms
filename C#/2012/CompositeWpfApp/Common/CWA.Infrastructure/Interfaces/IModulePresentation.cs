//
// IModulePresentation.cs
// Author: Eugene Pankov
// January 31, 2009


namespace CWA.Infrastructure
{
    public interface IModulePresentation
    {
        /// <summary>
        /// Current view presented by the module.
        /// </summary>
        object View { get; }
    }
}
