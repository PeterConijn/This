namespace PC.This.EntityData;

codeunit 50128 "Convert Entity Data"
{
    Access = Internal;
    InherentEntitlements = X;
    InherentPermissions = X;

    procedure ConvertToText(EntityData: Codeunit "Entity Data"): Text
    var
        StringBuilder: TextBuilder;
        EntryKey: Text;
        ListIndex: Integer;
    begin
        for ListIndex := 1 to EntityData.Count() do begin
            StringBuilder.AppendLine(StrSubstNo('--- %1 (%2) ---', EntityData.GetEntityNo(ListIndex), EntityData.GetEntitySystemId(ListIndex)) + this.GetLineBreak());
            foreach EntryKey in EntityData.GetEntityDataEntry(ListIndex).Keys() do
                StringBuilder.AppendLine(StrSubstNo('%1: %2', EntryKey, EntityData.GetEntityDataEntry(ListIndex).Get(EntryKey)) + this.GetLineBreak());

            StringBuilder.AppendLine(this.GetLineBreak());
        end;

        exit(StringBuilder.ToText());
    end;

    procedure ConvertToXmlText(EntityData: Codeunit "Entity Data"): Text
    var
        ItemElementTok: Label '....[Entry No="%1" SystemId="%2"]', Locked = true;
        FieldElementTok: Label '........[%1]%2[/%1]', Locked = true;
        StringBuilder: TextBuilder;

        EntryKey: Text;
        ListIndex: Integer;
    begin
        // Note: The following code is a simplified version of the XML generation code, since richtext editors apparently cannot handle real XML.
        StringBuilder.AppendLine('[Entries]' + this.GetLineBreak());
        for ListIndex := 1 to EntityData.Count() do begin

            StringBuilder.AppendLine(StrSubstNo(ItemElementTok, EntityData.GetEntityNo(ListIndex), EntityData.GetEntitySystemId(ListIndex)) + this.GetLineBreak());

            foreach EntryKey in EntityData.GetEntityDataEntry(ListIndex).Keys() do
                if not (EntryKey in ['No', 'SystemId']) then
                    StringBuilder.AppendLine(StrSubstNo(FieldElementTok, EntryKey, EntityData.GetEntityDataEntry(ListIndex).Get(EntryKey)) + this.GetLineBreak());
            StringBuilder.AppendLine('....[/Entry]' + this.GetLineBreak());
        end;
        StringBuilder.AppendLine('[/Entries]' + this.GetLineBreak());

        exit(StringBuilder.ToText());
    end;

    local procedure GetLineBreak(): Text
    begin
        exit('</br>');
    end;
}
