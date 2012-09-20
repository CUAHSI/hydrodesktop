Option Strict On

Imports System.Drawing

Namespace Controls
    Public Class OneSeriesPlotInfo
        Private ReadOnly _parent As SeriesPlotInfo

        Public Sub New(ByVal parent As SeriesPlotInfo)
            _parent = parent
        End Sub

        Public Property DataTable As DataTable
        Public Property SiteName As String
        Public Property VariableName As String
        Public Property DataType As String
        Public Property VariableUnits As String
        Public ReadOnly Property PlotOptions As PlotOptions
            Get
                Return _parent.PlotOptions
            End Get
        End Property
        Public Property SeriesID As Integer
        Public Property LineColor As Color = Color.Black
        Public Property PointColor As Color = Color.Black
        Public Property Statistics() As SummaryStatistics
    End Class
End Namespace