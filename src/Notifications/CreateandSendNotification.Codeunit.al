namespace PC.This.Notifications;

using Microsoft.Inventory.Item;
using Microsoft.Sales.Customer;
using Microsoft.Purchases.Vendor;

codeunit 50127 "Create and Send Notification"
{
    Access = Public;
    InherentEntitlements = X;
    InherentPermissions = X;

    EventSubscriberInstance = Manual;

    /// <summary>
    /// Sends a notification for an item.
    /// </summary>
    /// <param name="Item">The item record to send a notification about.</param>
    procedure Send(Item: Record Item)
    var
        CurrentItem: Record Item;
        Notification: Codeunit Notification;
    begin
        CurrentItem := Item;
        // this.CurrentItem := this.Item; // Local variables and parameters should not have the 'this' keyword

        Notification.SetTableName(Item.TableCaption());
        Notification.SetNo(Item."No.");
        Notification.SetNameOrDescription(Item.Description);
        Notification.SetSystemId(Item.SystemId);

        Notification.Send();
    end;

    /// <summary>
    /// Sends a notification for a customer.
    /// </summary>
    /// <param name="Customer">The customer record to send a notification about.</param>
    procedure Send(Customer: Record Customer)
    var
        Notification: Codeunit Notification;
    begin
        Notification.SetTableName(Customer.TableCaption());
        Notification.SetNo(Customer."No.");
        Notification.SetNameOrDescription(Customer.Name);
        Notification.SetSystemId(Customer.SystemId);

        Notification.Send();
    end;

    /// <summary>
    /// Sends a notification for a vendor.
    /// </summary>
    /// <param name="Vendor">The vendor record to send a notification about.</param>
    procedure Send(Vendor: Record Vendor)
    var
        Notification: Codeunit Notification;
    begin
        Notification.SetTableName(Vendor.TableCaption());
        Notification.SetNo(Vendor."No.");
        Notification.SetNameOrDescription(Vendor.Name);
        Notification.SetSystemId(Vendor.SystemId);

        BindSubscription(this); // You can bind and unbind a codeunit itself as a subscriber
        Notification.Send();
        UnbindSubscription(this);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Send Notification", OnBeforeSendNotification, '', false, false)]
    local procedure OnBeforeSendNotification(var NotificationToSend: Notification)
    begin
        NotificationToSend.AddAction('Check Color', Codeunit::"Check Color", 'CheckColor');
    end;
}
