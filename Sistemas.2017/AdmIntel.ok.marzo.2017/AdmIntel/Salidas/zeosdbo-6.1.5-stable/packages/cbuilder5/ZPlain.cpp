//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
USERES("ZPlain.res");
USEPACKAGE("vcl50.bpi");
USEPACKAGE("ZCore.bpi");
USEUNIT("..\..\src\plain\ZPlainPostgreSqlDriver.pas");
USEUNIT("..\..\src\plain\ZPlainAdo.pas");
USEUNIT("..\..\src\plain\ZPlainAdoDriver.pas");
USEUNIT("..\..\src\plain\ZPlainDb2.pas");
USEUNIT("..\..\src\plain\ZPlainDb2Driver.pas");
USEUNIT("..\..\src\plain\ZPlainDbLibDriver.pas");
USEUNIT("..\..\src\plain\ZPlainDbLibMsSql7.pas");
USEUNIT("..\..\src\plain\ZPlainDbLibSybaseAse125.pas");
USEUNIT("..\..\src\plain\ZPlainDriver.pas");
USEUNIT("..\..\src\plain\ZPlainFirebird10.pas");
USEUNIT("..\..\src\plain\ZPlainFirebird15.pas");
USEUNIT("..\..\src\plain\ZPlainInterbase5.pas");
USEUNIT("..\..\src\plain\ZPlainInterbase6.pas");
USEUNIT("..\..\src\plain\ZPlainInterbaseDriver.pas");
USEUNIT("..\..\src\plain\ZPlainLoader.pas");
USEUNIT("..\..\src\plain\ZPlainMySql40.pas");
USEUNIT("..\..\src\plain\ZPlainMySql320.pas");
USEUNIT("..\..\src\plain\ZPlainMySql323.pas");
USEUNIT("..\..\src\plain\ZPlainMySqlDriver.pas");
USEUNIT("..\..\src\plain\ZPlainOracle.pas");
USEUNIT("..\..\src\plain\ZPlainPostgreSql65.pas");
USEUNIT("..\..\src\plain\ZPlainPostgreSql72.pas");
USEUNIT("..\..\src\plain\ZPlainPostgreSql73.pas");
//---------------------------------------------------------------------------
#pragma package(smart_init)
//---------------------------------------------------------------------------

//   Package source.
//---------------------------------------------------------------------------

#pragma argsused
int WINAPI DllEntryPoint(HINSTANCE hinst, unsigned long reason, void*)
{
        return 1;
}
//---------------------------------------------------------------------------
