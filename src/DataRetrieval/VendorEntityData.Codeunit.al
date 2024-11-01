namespace PC.This.EntityData;

using PC.This.EntityData.Queries;
using System.Utilities;

codeunit 50125 "Vendor Entity Data" implements IDataRetrieval
{
    Access = Internal;
    InherentEntitlements = X;
    InherentPermissions = X;

    procedure RetrieveData(var EntityData: Codeunit "Entity Data")
    var
        TempBlob: Codeunit "Temp Blob";
        VendorData: Query "Vendor Data";
        OutStream: OutStream;
    begin
        if not VendorData.Open() then
            exit;

        TempBlob.CreateOutStream(OutStream, TextEncoding::UTF8);
        if VendorData.SaveAsJson(OutStream) then
            EntityData.SetEntityData(TempBlob);

        VendorData.Close();
    end;

}
