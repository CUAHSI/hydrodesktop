﻿using HydroDesktop.Configuration;

namespace HydroDesktop.DataDownload
{
    class Global
    {
        public static string GetHISCentralURL()
        {
            return Settings.Instance.SelectedHISCentralURL;
        }
    }
}
