//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop
USERES("ZDbc.res");
USEPACKAGE("vcl40.bpi");
USEPACKAGE("ZParseSql.bpi");
USEPACKAGE("ZCore.bpi");
USEUNIT("..\..\src\dbc\ZDbcUtils.pas");
USEUNIT("..\..\src\dbc\ZDbcCache.pas");
USEUNIT("..\..\src\dbc\ZDbcCachedResultSet.pas");
USEUNIT("..\..\src\dbc\ZDbcConnection.pas");
USEUNIT("..\..\src\dbc\ZDbcDbLib.pas");
USEUNIT("..\..\src\dbc\ZDbcDbLibMsSqlMetadata.pas");
USEUNIT("..\..\src\dbc\ZDbcDbLibResultSet.pas");
USEUNIT("..\..\src\dbc\ZDbcDbLibStatement.pas");
USEUNIT("..\..\src\dbc\ZDbcDbLibSybaseMetadata.pas");
USEUNIT("..\..\src\dbc\ZDbcDbLibUtils.pas");
USEUNIT("..\..\src\dbc\ZDbcGenericResolver.pas");
USEUNIT("..\..\src\dbc\ZDbcInterbase6.pas");
USEUNIT("..\..\src\dbc\ZDbcInterbase6Metadata.pas");
USEUNIT("..\..\src\dbc\ZDbcInterbase6ResultSet.pas");
USEUNIT("..\..\src\dbc\ZDbcInterbase6Statement.pas");
USEUNIT("..\..\src\dbc\ZDbcInterbase6Utils.pas");
USEUNIT("..\..\src\dbc\ZDbcIntfs.pas");
USEUNIT("..\..\src\dbc\ZDbcLogging.pas");
USEUNIT("..\..\src\dbc\ZDbcMetadata.pas");
USEUNIT("..\..\src\dbc\ZDbcMySql.pas");
USEUNIT("..\..\src\dbc\ZDbcMySqlMetadata.pas");
USEUNIT("..\..\src\dbc\ZDbcMySqlResultSet.pas");
USEUNIT("..\..\src\dbc\ZDbcMySqlStatement.pas");
USEUNIT("..\..\src\dbc\ZDbcMySqlUtils.pas");
USEUNIT("..\..\src\dbc\ZDbcPostgreSql.pas");
USEUNIT("..\..\src\dbc\ZDbcPostgreSqlMetadata.pas");
USEUNIT("..\..\src\dbc\ZDbcPostgreSqlResultSet.pas");
USEUNIT("..\..\src\dbc\ZDbcPostgreSqlStatement.pas");
USEUNIT("..\..\src\dbc\ZDbcPostgreSqlUtils.pas");
USEUNIT("..\..\src\dbc\ZDbcResultSet.pas");
USEUNIT("..\..\src\dbc\ZDbcResultSetMetadata.pas");
USEUNIT("..\..\src\dbc\ZDbcStatement.pas");
USEPACKAGE("ZPlain.bpi");
USEPACKAGE("vcldb40.bpi");
USEUNIT("..\..\src\dbc\ZDbcAdoUtils.pas");
USEUNIT("..\..\src\dbc\ZDbcAdoMetaData.pas");
USEUNIT("..\..\src\dbc\ZDbcAdoResultSet.pas");
USEUNIT("..\..\src\dbc\ZDbcAdoStatement.pas");
USEUNIT("..\..\src\dbc\ZDbcAdo.pas");
//---------------------------------------------------------------------------
#pragma package(smart_init)
//---------------------------------------------------------------------------
//   Package source.
//---------------------------------------------------------------------------
int WINAPI DllEntryPoint(HINSTANCE hinst, unsigned long reason, void*)
{
        return 1;
}
//---------------------------------------------------------------------------
