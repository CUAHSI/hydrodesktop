﻿using System;
using System.ComponentModel.Composition;
using System.Linq;
using DotSpatial.Controls;
using DotSpatial.Controls.Header;
using DotSpatial.Symbology;
using HydroDesktop.Common;
using HydroDesktop.Common.UserMessage;
using HydroDesktop.Interfaces;
using HydroDesktop.Interfaces.PluginContracts;
using Hydrodesktop.Common;

namespace DataAggregation
{
    /// <summary>
    /// Allow to aggregate data in features layers
    /// </summary>
    public class DataAggregationPlugin : Extension, IDataAggregationPlugin
    {
        private const string Interpolation_Root_Key = "kInterpolation_Methods";

        /// <summary>
        /// Series View
        /// </summary>
        [Import("SeriesControl", typeof(ISeriesSelector))]
        internal ISeriesSelector SeriesControl { get; private set; }

        #region Extension methods

        /// <summary>
        /// Activates this provider
        /// </summary>
        public override void Activate()
        {
            base.Activate();

            App.Map.LayerAdded += Map_LayerAdded;
            App.Map.Layers.LayerRemoved += Layers_LayerRemoved;
            App.SerializationManager.Deserializing += SerializationManager_Deserializing;
            App.ExtensionsActivated += AppOnExtensionsActivated;
        }
       

        /// <summary>
        /// Deactivates this provider
        /// </summary>
        public override void Deactivate()
        {
            App.Map.LayerAdded -= Map_LayerAdded;
            App.Map.Layers.LayerRemoved -= Layers_LayerRemoved;
            App.SerializationManager.Deserializing -= SerializationManager_Deserializing;
            App.ExtensionsActivated -= AppOnExtensionsActivated;
            foreach (var layer in App.Map.MapFrame.Layers)
                DettachLayerFromPlugin(layer);

            base.Deactivate();
        }

        #endregion

        #region Private methods

        private void AppOnExtensionsActivated(object sender, EventArgs eventArgs)
        {
            if (App.GetExtension("GeostatisticalTool") != null)
            {
                App.HeaderControl.Add(new SimpleActionItem(MessageStrings.Show_Values_in_Map, ClickShowValueInMapEventHandler)
                    {
                        RootKey = Interpolation_Root_Key,
                        LargeImage = Properties.Resources.show_values_in_map_32,
                        SmallImage = Properties.Resources.show_values_in_map_16,
                    });
                App.HeaderControl.Add(new SimpleActionItem(MessageStrings.Merge_Layers, ClickMergeLayersEventHandler)
                {
                    RootKey = Interpolation_Root_Key,
                    LargeImage = Properties.Resources.arrow_merge32,
                    SmallImage = Properties.Resources.arrow_merge16,
                });
            }
        }

        private void ClickMergeLayersEventHandler(object sender, EventArgs eventArgs)
        {
            using (var form = new MergeTool.MergeLayersForm(App, SeriesControl))
            {
                form.ShowDialog();
            }
        }

        private void ClickShowValueInMapEventHandler(object sender, EventArgs eventArgs)
        {
            var layer = App.Map.MapFrame.GetAllLayers().FirstOrDefault(f => f.IsSelected) as IFeatureLayer;
            if (Aggregator.ContainsSeries(layer))
            {
                Aggregator.ShowAggregationSettingsDialog(layer);
            }
            else
            {
                AppContext.Instance.Get<IUserMessage>().Info(MessageStrings.Msg_Select_Layer);
            }
        }

        private void SerializationManager_Deserializing(object sender, SerializingEventArgs e)
        {
            foreach (var layer in App.Map.MapFrame.Layers)
                AttachLayerToPlugin(layer);
        }
       
        private void Map_LayerAdded(object sender, LayerEventArgs e)
        {
            if (e.Layer == null) return; //occurs when moving layer

            AttachLayerToPlugin(e.Layer);
        }

        void Layers_LayerRemoved(object sender, LayerEventArgs e)
        {
            DettachLayerFromPlugin(e.Layer);
        }

        private void DettachLayerFromPlugin(ILayer layer)
        {
            Aggregator.RemoveContextMenu(layer);

            var group = layer as IGroup;
            if (group != null)
            {
                group.LayerAdded -= Map_LayerAdded;
                group.LayerRemoved -= Layers_LayerRemoved;

                foreach (var child in group.GetLayers())
                    DettachLayerFromPlugin(child);
            }

            var mg = layer as IMapGroup;
            if (mg != null && mg.LegendText == LayerConstants.SearchGroupName)
            {
                var toRemove = mg.ContextMenuItems.FirstOrDefault(d => d.Name == MessageStrings.Merge_Layers);
                if (toRemove != null)
                {
                    mg.ContextMenuItems.Remove(toRemove);
                }
            }
        }

        #endregion

        /// <summary>
        /// Attach layer to data aggregation plug-in
        /// </summary>
        /// <param name="layer">Layer to attach</param>
        public void AttachLayerToPlugin(ILayer layer)
        {
            // Check for DataAggregation 
            var fl = layer as IFeatureLayer;
            if (Aggregator.ContainsSeries(fl))
            {
                Aggregator.UpdateContextMenu(fl);
            }

            var group = layer as IGroup;
            if (group != null)
            {
                group.LayerAdded += Map_LayerAdded;
                group.LayerRemoved += Layers_LayerRemoved;

                foreach (var child in group.GetLayers())
                    AttachLayerToPlugin(child);
            }

            // Update context menu for 'Data Sites'  group
            var mg = layer as IMapGroup;
            if (mg != null && mg.LegendText == LayerConstants.SearchGroupName)
            {
                if (mg.ContextMenuItems.All(d => d.Name != MessageStrings.Merge_Layers))
                {
                    mg.ContextMenuItems.Add(new SymbologyMenuItem(MessageStrings.Merge_Layers,
                                                                  Properties.Resources.arrow_merge16,
                                                                  ClickMergeLayersEventHandler));
                }
            }
        }
    }
}
