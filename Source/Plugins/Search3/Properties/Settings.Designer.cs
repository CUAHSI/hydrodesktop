﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.18444
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace HydroDesktop.Plugins.Search.Properties {
    
    
    [global::System.Runtime.CompilerServices.CompilerGeneratedAttribute()]
    [global::System.CodeDom.Compiler.GeneratedCodeAttribute("Microsoft.VisualStudio.Editors.SettingsDesigner.SettingsSingleFileGenerator", "11.0.0.0")]
    internal sealed partial class Settings : global::System.Configuration.ApplicationSettingsBase {
        
        private static Settings defaultInstance = ((Settings)(global::System.Configuration.ApplicationSettingsBase.Synchronized(new Settings())));
        
        public static Settings Default {
            get {
                return defaultInstance;
            }
        }
        
        [global::System.Configuration.ApplicationScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("HisCentral")]
        public global::HydroDesktop.Plugins.Search.Settings.TypeOfCatalog TypeOfCatalog {
            get {
                return ((global::HydroDesktop.Plugins.Search.Settings.TypeOfCatalog)(this["TypeOfCatalog"]));
            }
        }
        
        [global::System.Configuration.ApplicationScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("WebServices.xml")]
        public string WebServicesFileName {
            get {
                return ((string)(this["WebServicesFileName"]));
            }
        }
        
        [global::System.Configuration.ApplicationScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("Resources\\Synonyms.xml")]
        public string SynonymsFilename {
            get {
                return ((string)(this["SynonymsFilename"]));
            }
        }
        
        [global::System.Configuration.ApplicationScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("Resources\\OntologyTree.xml")]
        public string OntologyFilename {
            get {
                return ((string)(this["OntologyFilename"]));
            }
        }
        
        [global::System.Configuration.ApplicationScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("searchresult_{0}_{1}.shp")]
        public string SearchResultNameMask {
            get {
                return ((string)(this["SearchResultNameMask"]));
            }
        }
        
        [global::System.Configuration.UserScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("http://hiscentral.cuahsi.org/webservices/hiscentral_1_1.asmx")]
        public string HISCENTRAL_URL {
            get {
                return ((string)(this["HISCENTRAL_URL"]));
            }
            set {
                this["HISCENTRAL_URL"] = value;
            }
        }
        
        [global::System.Configuration.ApplicationScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("http://hiscentral.cuahsi.org/webservices/hiscentral_1_1.asmx")]
        public string HISCENTRAL_URL_1 {
            get {
                return ((string)(this["HISCENTRAL_URL_1"]));
            }
        }
        
        [global::System.Configuration.ApplicationScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("http://water.sdsc.edu/hiscentral/webservices/hiscentral.asmx")]
        public string HISCENTRAL_URL_2 {
            get {
                return ((string)(this["HISCENTRAL_URL_2"]));
            }
        }
    }
}
