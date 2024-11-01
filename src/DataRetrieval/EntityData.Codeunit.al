namespace PC.This.EntityData;

using System.Utilities;
using System.Reflection;

codeunit 50122 "Entity Data"
{
    Access = Public;
    InherentEntitlements = X;
    InherentPermissions = X;

    var
        ConvertEntityData: Codeunit "Convert Entity Data";
        EntityData: List of [Dictionary of [Text, Text]];
        JEntityData: JsonArray;

    /// <summary>
    /// Retrieve the data for the entity as a key/value formatted text.
    /// </summary>
    /// <returns>The entity data as text.</returns>
    procedure GetEntityDataAsText(): Text
    begin
        this.ParseData();

        exit(this.ConvertEntityData.ConvertToText(this));
    end;

    /// <summary>
    /// Retrieve the data for the entity as an xml formatted text.
    /// </summary>
    /// <returns>The entity data as an xml formatted text.</returns>
    procedure GetEntityDataAsXmlText(): Text
    begin
        this.ParseData();

        exit(this.ConvertEntityData.ConvertToXmlText(this));
    end;

    internal procedure GetEntityTableName(Index: Integer): Text
    var
        EntityDataEntry: Dictionary of [Text, Text];
    begin
        EntityDataEntry := this.GetListEntry(Index);
        exit(EntityDataEntry.Get('TableName'));
    end;

    internal procedure GetEntityNo(Index: Integer): Text
    var
        EntityDataEntry: Dictionary of [Text, Text];
    begin
        EntityDataEntry := this.GetListEntry(Index);
        exit(EntityDataEntry.Get('No'));
    end;

    internal procedure GetEntitySystemId(Index: Integer): Text
    var
        EntityDataEntry: Dictionary of [Text, Text];
    begin
        EntityDataEntry := this.GetListEntry(Index);
        exit(EntityDataEntry.Get('SystemId'));
    end;

    internal procedure Count(): Integer
    begin
        exit(this.EntityData.Count());
    end;

    internal procedure GetEntityDataEntry(Index: Integer): Dictionary of [Text, Text]
    begin
        exit(this.GetListEntry(Index));
    end;

    internal procedure SetEntityData(var TempBlob: Codeunit "Temp Blob")
    var
        JArray: JsonArray;
        InStream: InStream;
    begin
        Clear(this.JEntityData);

        TempBlob.CreateInStream(InStream);
        JArray.ReadFrom(InStream);

        this.JEntityData := JArray;
    end;

    local procedure GetListEntry(Index: Integer): Dictionary of [Text, Text];
    begin
        exit(this.EntityData.Get(Index));
    end;

    local procedure ParseData()
    var
        JObject: JsonObject;
        JToken: JsonToken;
        EntityDataEntry: Dictionary of [Text, Text];
        JKeys: List of [Text];
        JKey: Text;
    begin
        foreach JToken in this.JEntityData do begin
            JObject := JToken.AsObject();
            JKeys := JObject.Keys();

            Clear(EntityDataEntry);
            foreach JKey in JKeys do begin
                JObject.Get(JKey, JToken);
                EntityDataEntry.Add(JKey, JToken.AsValue().AsText());
            end;

            this.EntityData.Add(EntityDataEntry);
        end;
    end;
}
