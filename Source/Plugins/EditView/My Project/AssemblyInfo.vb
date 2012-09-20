﻿Imports System
Imports System.Reflection
Imports System.Runtime.InteropServices

' It is necessary to add the DotSpatial.Plugins namespace to correctly
' recognize plugin attributes
Imports DotSpatial.Controls

' General Information about an assembly is controlled through the following 
' set of attributes. Change these attribute values to modify the information
' associated with an assembly.

' Review the values of the assembly attributes

<Assembly: AssemblyTitle("Edit View")> 
<Assembly: AssemblyDescription("")> 
<Assembly: AssemblyCompany("Utah State University")> 
<Assembly: AssemblyProduct("Graph View")> 
<Assembly: AssemblyCopyright("Copyright ©  2010")> 
<Assembly: AssemblyTrademark("")> 

<Assembly: ComVisible(False)>

'The following GUID is for the ID of the typelib if this project is exposed to COM
<Assembly: Guid("a6747beb-6539-46da-8a49-8cde6e54ef6d")> 

' Version information for an assembly consists of the following four values:
'
'      Major Version
'      Minor Version 
'      Build Number
'      Revision
'
' You can specify all the values or you can default the Build and Revision Numbers 
' by using the '*' as shown below:
' <Assembly: AssemblyVersion("1.0.*")> 

<Assembly: AssemblyVersion("1.0.0.0")> 
<Assembly: AssemblyFileVersion("1.0.0.0")> 

' It is necessary to set the PluginAssembly attribute so that the assembly is
' properly recognized by the HydroDesktop main application as a plugin
<Assembly: PluginAssembly()> 