namespace PC.This.Notifications;

using Microsoft.Inventory.Item;
using Microsoft.Sales.Customer;
using Microsoft.Purchases.Vendor;

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

    procedure Send(Item: Record Item)
    var
        CurrentItem: Record Item;
    begin
        CurrentItem := Item; // Local variables and parameters do not require the 'this' keyword
        //this.CurrentItem := this.Item; // Local variables and parameters do not require the 'this' keyword

        this.TableName := Item.TableCaption();
        this.EntityNo := Item."No.";
        this.NameOrDescription := Item.Description;
        this.SystemId := Item.SystemId;

        Send(); // Local procedures *do* need the 'this' keyword
    end;

    procedure Send(Customer: Record Customer)
    begin
        this.TableName := Customer.TableCaption();
        this.EntityNo := Customer."No.";
        this.NameOrDescription := Customer.Name;
        this.SystemId := Customer.SystemId;

        Send();
    end;

    procedure Send(Vendor: Record Vendor)
    begin
        this.TableName := Vendor.TableCaption();
        this.EntityNo := Vendor."No.";
        this.NameOrDescription := Vendor.Name;
        this.SystemId := Vendor.SystemId;

        Send();
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