//
// ControllerNames.cs
// Author: Eugene Pankov
// January 31, 2009


namespace CWA.Infrastructure
{
    /// <summary>
    /// Class ControllerNames contains controller names used to by UnityBootstrapper
    /// to register and resolve controller classes.
    /// </summary>
    public class ControllerNames
    {
        public const string ServerController = "ServerController";
        public const string ModuleController = "ModuleController";
        public const string MenuController = "MenuController";

        // Command controllers
        public const string SkinCommandController = "SkinCommandController";
        public const string ExitCommandController = "ExitCommandController";
        public const string AboutCommandController = "AboutCommandController";
        public const string HelpCommandController = "HelpCommandController";
        public const string SettingsCommandController = "SettingsCommandController";
    }
}
