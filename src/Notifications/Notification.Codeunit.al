namespace PC.This.Notifications;

codeunit 50120 "Notification"
{
    Access = Public;
    InherentEntitlements = X;
    InherentPermissions = X;

    var
        SendNotification: Codeunit "Send Notification";
        EntityNo: Code[20];
        NameOrDescription: Text;
        SystemId: Guid;
        TableName: Text;

    trigger OnRun()
    begin
        Send(); // Local procedures *do* need the 'this' keyword. The rule, AA0248, is normally disabled, but can be enabled in a custom ruleset
    end;

    internal procedure SetTableName(NewTableName: Text);
    begin
        this.TableName := NewTableName;
    end;

    internal procedure SetNo(NewNo: Code[20])
    begin
        this.EntityNo := NewNo;
    end;

    internal procedure SetNameOrDescription(NewNameOrDescription: Text)
    begin
        this.NameOrDescription := NewNameOrDescription;
    end;

    internal procedure SetSystemId(NewSystemId: Guid)
    begin
        this.SystemId := NewSystemId;
    end;

    internal procedure GetTableName(): Text
    begin
        exit(this.TableName);
    end;

    internal procedure GetNo(): Code[20]
    begin
        exit(this.EntityNo);
    end;

    internal procedure GetNameOrDescription(): Text
    begin
        exit(this.NameOrDescription);
    end;

    internal procedure GetSystemId(): Guid
    begin
        exit(this.SystemId);
    end;

    internal procedure GetNotificationId(): Guid
    begin
        exit('5f6fa6ef-6bd4-4d74-81b6-8fd7473650b8');
    end;

    local procedure Send()
    begin
        this.SendNotification.SendNotification(this);
    end;
}