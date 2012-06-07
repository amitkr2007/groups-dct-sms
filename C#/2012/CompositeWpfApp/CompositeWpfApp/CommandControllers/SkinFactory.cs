//
// SkinFactory.cs
// Author: Eugene Pankov
// January 12, 2009

using System;
using System.Collections;
using System.Windows;
using CWA.Infrastructure;
using CWA.ResourceLibrary.Skins;


namespace CompositeWpfApp.CommandControllers
{
    /// <summary>
    /// Class <see cref="SkinFactory"/> creates, keeps and retrieves Resource Dictionaries
    /// for application skins.
    /// </summary>
    public static class SkinFactory
    {
        private static Hashtable skinTable = new Hashtable();


        /// <summary>
        /// Gets a ResourceDictionary corresponding to the <paramref name="skinName"/>.
        /// </summary>
        /// <param name="skinName">Skin name.</param>
        /// <returns>ResourceDictionary.</returns>
        /// <exception cref="ArgumentNullException">Skin Name is not specified.</exception>
        /// <exception cref="ArgumentException">Invalid Skin Name.</exception>
        public static ResourceDictionary GetResourceDictionary(string skinName)
        {
            if (string.IsNullOrEmpty(skinName))
                throw new ArgumentException("Skin Name is empty.", "skinName");

            if (skinTable.ContainsKey(skinName))
                return (ResourceDictionary)skinTable[skinName];

            ResourceDictionary resourceDictionary = null;

            switch (skinName)
            {
                case SkinNames.DefaultSkin:
                    resourceDictionary = (ResourceDictionary)new DefaultSkin();
                    break;

                case SkinNames.BlueSkin:
                    resourceDictionary = (ResourceDictionary)new BlueSkin();
                    break;

                default:
                    throw new ArgumentException("Invalid Skin Name.");
            }

            if (resourceDictionary != null)
            {
                skinTable.Add(skinName, resourceDictionary);
            }

            return resourceDictionary;
        }
    }
}
