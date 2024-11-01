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
        this.SendNotification.SendNotification(this);
    end;

    procedure Send()
    var
        IsHandled: Boolean;
    begin
        OnBeforeSend(this, IsHandled); // Local procedures and events also need a "this" keyword
        if not this.Run() then
            Error(GetLastErrorText());
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

    [IntegrationEvent(false, false)]
    local procedure OnBeforeSend(Notification: Codeunit Notification; var IsHandled: Boolean)
    begin
    end;
}