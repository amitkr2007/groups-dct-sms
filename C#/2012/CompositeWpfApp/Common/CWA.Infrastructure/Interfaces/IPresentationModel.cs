//
// IPresentationModel.cs
// Author: Eugene Pankov
// January 31, 2009


namespace CWA.Infrastructure
{
    public interface IPresentationModel
    {
        /// <summary>
        /// A View associated with a PresentationModel.
        /// </summary>
        object View { get; }
    }
}
