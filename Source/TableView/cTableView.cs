﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Windows.Forms;
using HydroDesktop.Interfaces;
using HydroDesktop.Database;
using HydroDesktop.Configuration;

namespace TableView
{
    public partial class cTableView : UserControl
    {
        #region Fields

        private readonly ISeriesSelector _seriesSelector;

        #endregion

        #region Constructor

        public cTableView(ISeriesSelector seriesSelector)
        {
            if (seriesSelector == null) throw new ArgumentNullException("seriesSelector");

            InitializeComponent();

            _seriesSelector = seriesSelector;

            dataGridViewNavigator1.PageChanged += dataGridViewNavigator1_PageChanged;

            _seriesSelector.SeriesCheck += seriesSelector_Refreshed;
            _seriesSelector.Refreshed += seriesSelector_Refreshed;
        }

        #endregion

        #region Properties

        private TableViewMode _viewMode;
        public TableViewMode ViewMode
        {
            get { return _viewMode; }
            set
            {
                _viewMode = value;
                UpdateViewMode();
            }
        }

        /// <summary>
        /// Path to current database
        /// </summary>
        public string DatabasePath { get; private set; }

        #endregion

        #region Private methods

        private void UpdateViewMode()
        {
            if (String.IsNullOrEmpty(Settings.Instance.DataRepositoryConnectionString)) return;

            switch (ViewMode)
            {
                case TableViewMode.SequenceView:
                    ShowAllFieldsinSequence();
                    break;
                case TableViewMode.JustValuesInParallel:
                    ShowJustValuesinParallel();
                    break;
            }
        }

        private void UpdateDatabasePath()
        {
            if (Settings.Instance.DataRepositoryConnectionString != null)
            {
                DatabasePath = SQLiteHelper.GetSQLiteFileName(Settings.Instance.DataRepositoryConnectionString);
            }
        }

        private void dataGridViewNavigator1_PageChanged(object sender, PageChangedEventArgs e)
        {
            dataViewSeries.DataSource = e.DataTable;
        }

        private void ShowAllFieldsinSequence()
        {
            dataGridViewNavigator1.Initialize(new FieldsInSequenceGetter(_seriesSelector.CheckedIDList));
        }

        private void ShowJustValuesinParallel()
        {
            dataGridViewNavigator1.Initialize(new ValuesInParallelGetter(_seriesSelector.CheckedIDList));
            
            // Update columns headers
            var dataSeriesRepo = RepositoryFactory.Instance.Get<IDataSeriesRepository>();
            var columnDateTime = dataViewSeries.Columns["DateTime"];
            Debug.Assert(columnDateTime != null);
            columnDateTime.HeaderText = "DateTime" + Environment.NewLine + "Unit";
            foreach (var id in _seriesSelector.CheckedIDList)
            {
                var seriesNameTable = dataSeriesRepo.GetUnitSiteVarForFirstSeries(id);
                var row1 = seriesNameTable.Rows[0];
                var unitsName = Convert.ToString(row1[0]);
                var siteName = Convert.ToString(row1[1]);
                var variableName = Convert.ToString(row1[2]);

                var columnD_id = dataViewSeries.Columns["D" + id];
                Debug.Assert(columnD_id != null);
                columnD_id.HeaderText = siteName + " * " + id + Environment.NewLine +
                                        variableName + Environment.NewLine +
                                        unitsName;
            }
        }

        private void seriesSelector_Refreshed(object sender, EventArgs e)
        {
            UpdateViewMode();
            UpdateDatabasePath();
        }

        private void cTableView_Load(object sender, EventArgs e)
        {
            dataViewSeries.ColumnHeadersVisible = true;
            dataViewSeries.ColumnHeadersBorderStyle = ProperColumnHeadersBorderStyle;
           
            ViewMode = TableViewMode.SequenceView;
            UpdateDatabasePath();
        }

        /// <summary>
        /// Remove the column header border in the Aero theme in Vista,
        /// but keep it for other themes such as standard and classic.
        /// </summary>
        private static DataGridViewHeaderBorderStyle ProperColumnHeadersBorderStyle
        {
            get
            {
                return (SystemFonts.MessageBoxFont.Name == "Segoe UI")
                           ? DataGridViewHeaderBorderStyle.None
                           : DataGridViewHeaderBorderStyle.Raised;
            }
        }

        #endregion

        private class ValuesInParallelGetter : IPagedTableGetter
        {
            private readonly IDataValuesRepository _dataValuesRepository;
            private readonly IList<int> _selectedIds;

            public ValuesInParallelGetter(IEnumerable<int> selectedIds)
            {
                _dataValuesRepository = RepositoryFactory.Instance.Get<IDataValuesRepository>();
                _selectedIds = selectedIds.Select(s => s).ToList();
            }

            public DataTable GetTable(int valuesPerPage, int currentPage)
            {
                return _dataValuesRepository.GetTableForJustValuesInParallel(_selectedIds, valuesPerPage, currentPage);
            }

            public long GetTotalCount()
            {
                return _dataValuesRepository.GetCountForJustValuesInParallel(_selectedIds);
            }
        }

        private class FieldsInSequenceGetter : IPagedTableGetter
        {
            private readonly IDataValuesRepository _dataValuesRepository;
            private readonly IList<int> _selectedIds;

            public FieldsInSequenceGetter(IEnumerable<int> selectedIds)
            {
                _dataValuesRepository = RepositoryFactory.Instance.Get<IDataValuesRepository>();
                _selectedIds = selectedIds.Select(s => s).ToList();
            }

            public DataTable GetTable(int valuesPerPage, int currentPage)
            {
                return _dataValuesRepository.GetTableForAllFieldsInSequence(_selectedIds, valuesPerPage, currentPage);
            }

            public long GetTotalCount()
            {
                return _dataValuesRepository.GetCountForAllFieldsInSequence(_selectedIds);
            }
        }
    }

    public enum TableViewMode
    {
        [Description("Show All Fields in Sequence")]
        SequenceView,
        [Description("Show Just Values in Parallel")]
        JustValuesInParallel
    }
}
