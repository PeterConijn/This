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
        CustomerData: Query "Customer Data";
        OutStream: OutStream;
    begin
        if not CustomerData.Open() then
            exit;

        TempBlob.CreateOutStream(OutStream, TextEncoding::UTF8);
        if CustomerData.SaveAsJson(OutStream) then
            EntityData.SetEntityData(TempBlob);

        CustomerData.Close();
    end;

}
