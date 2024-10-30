namespace PC.This.EntityData;

using System.Utilities;
using System.Reflection;

codeunit 50122 "Entity Data"
{
    Access = Public;
    InherentEntitlements = X;
    InherentPermissions = X;

    var
        EntityData: JsonArray;

    /// <summary>
    /// Retrieve the data for the entity.
    /// </summary>
    /// <returns>A JSON object containing the entity data.</returns>
    procedure GetEntityData(): Text
    var
        StringBuilder: TextBuilder;
        JObject: JsonObject;
        JToken: JsonToken;
        JKeys: List of [Text];
        JKey: Text;
    begin
        foreach JToken in this.EntityData do begin
            JObject := JToken.AsObject();
            JKeys := JObject.Keys();

            foreach JKey in JKeys do begin
                JObject.Get(JKey, JToken);
                StringBuilder.AppendLine(JKey + ': ' + JToken.AsValue().AsText() + '; </br>');
            end;
            StringBuilder.AppendLine('</br>');
        end;

        exit(StringBuilder.ToText());
    end;

    internal procedure SetEntityData(var TempBlob: Codeunit "Temp Blob")
    var
        JArray: JsonArray;
        InStream: InStream;
    begin
        Clear(this.EntityData);

        TempBlob.CreateInStream(InStream);
        JArray.ReadFrom(InStream);

        this.EntityData := JArray;
    end;
}
