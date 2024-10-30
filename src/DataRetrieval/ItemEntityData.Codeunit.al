namespace PC.This.EntityData;

using PC.This.EntityData.Queries;
using System.Utilities;

codeunit 50123 "Item Entity Data" implements IDataRetrieval
{
    Access = Internal;
    InherentEntitlements = X;
    InherentPermissions = X;

    procedure RetrieveData(var EntityData: Codeunit "Entity Data")
    var
        TempBlob: Codeunit "Temp Blob";
        ItemData: Query "Item Data";
        OutStream: OutStream;
    begin
        if not ItemData.Open() then
            exit;

        TempBlob.CreateOutStream(OutStream, TextEncoding::UTF8);
        if ItemData.SaveAsJson(OutStream) then
            EntityData.SetEntityData(TempBlob);

        ItemData.Close();
    end;
}
