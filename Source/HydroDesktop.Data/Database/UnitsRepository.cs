using System;
using System.Data;
using HydroDesktop.Interfaces;
using HydroDesktop.Interfaces.ObjectModel;

namespace HydroDesktop.Database
{
    /// <summary>
    /// Repository for <see cref="Unit"/>
    /// </summary>
    class UnitsRepository : BaseRepository<Unit>, IUnitsRepository
    {
        #region Constructors
        
        public UnitsRepository(DatabaseTypes dbType, string connectionString) : base(dbType, connectionString)
        {
        }

        public UnitsRepository(IHydroDbOperations db)
            : base(db)
        {
        }

        #endregion

        #region Public methods
        
        public Unit GetByID(long id)
        {
            var dt = DbOperations.LoadTable(TableName, "Select * FROM Units where UnitsID=" + id);
            if (dt == null || dt.Rows.Count == 0)
                return null;

            var res = DataRowToEntity(dt.Rows[0]);
            return res;
        }
     
        #endregion

        #region Private methods

        protected override Unit DataRowToEntity(DataRow row)
        {
            var res = new Unit
            {
                Id = Convert.ToInt64(row["UnitsID"]),
                Abbreviation = Convert.ToString(row["UnitsAbbreviation"]),
                Name = Convert.ToString(row["UnitsName"]),
                UnitsType = Convert.ToString(row["UnitsType"]),
            };
            return res;
        }

        #endregion

        public override string TableName
        {
            get { return "Units"; }
        }
    }
}