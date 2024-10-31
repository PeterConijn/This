namespace PC.This;

using Microsoft.Inventory.Item;
using PC.This.Notifications;
using Microsoft.Purchases.Vendor;
using PC.This.EntityData;
using Microsoft.Sales.Customer;

page 50120 "PC Data Center"
{
    ApplicationArea = All;
    Caption = 'Personal Data Center';
    PageType = Card;
    UsageCategory = Tasks;

    layout
    {
        area(Content)
        {
            grid(SendGroup)
            {
                Caption = 'Send Notifications';
                GridLayout = Rows;

                group(EntityNotifications)
                {
                    ShowCaption = false;

                    field(SendItemNotification; this.SendItemNotificationLbl)
                    {
                        Caption = 'Send Item Notification';
                        ToolTip = 'Send a notification for an item';
                        Editable = false;
                        ShowCaption = false;

                        trigger OnDrillDown()
                        var
                            Item: Record Item;
                        begin
                            Item.FindSet();
                            Item.Next();
                            this.CreateAndSendNotification.Send(Item);
                        end;
                    }
                    field(SendCustomerNotification; this.SendCustomerNotificationLbl)
                    {
                        Caption = 'Send Customer Notification';
                        ToolTip = 'Send a notification for a customer';
                        Editable = false;
                        ShowCaption = false;

                        trigger OnDrillDown()
                        var
                            Customer: Record Customer;
                        begin
                            Customer.FindFirst();
                            this.CreateAndSendNotification.Send(Customer);
                        end;
                    }
                    field(SendVendorNotification; this.SendVendorNotificationLbl)
                    {
                        Caption = 'Send Vendor Notification';
                        ToolTip = 'Send a notification for a vendor';
                        Editable = false;
                        ShowCaption = false;

                        trigger OnDrillDown()
                        var
                            Vendor: Record Vendor;
                        begin
                            Vendor.FindFirst();
                            this.CreateAndSendNotification.Send(Vendor);
                        end;
                    }
                }
            }

            group(DataRetrieval)
            {
                ShowCaption = false;

                field(GetItemData; this.GetItemDataLbl)
                {
                    Caption = 'Send Item Notification';
                    ToolTip = 'Send a notification for an item';
                    Editable = false;
                    ShowCaption = false;

                    trigger OnDrillDown()
                    var
                        ItemEntityData: Codeunit "Item Entity Data";
                    begin
                        this.UpdateEntityData(ItemEntityData);
                    end;
                }
                field(GetCustomerData; this.GetCustomerDataLbl)
                {
                    Caption = 'Send Customer Notification';
                    ToolTip = 'Send a notification for a customer';
                    Editable = false;
                    ShowCaption = false;

                    trigger OnDrillDown()
                    var
                        CustomerEntityData: Codeunit "Customer Entity Data";
                    begin
                        this.UpdateEntityData(CustomerEntityData);
                    end;
                }
                field(GetVendorData; this.GetVendorDataLbl)
                {
                    Caption = 'Send Vendor Notification';
                    ToolTip = 'Send a notification for a vendor';
                    Editable = false;
                    ShowCaption = false;

                    trigger OnDrillDown()
                    var
                        VendorEntityData: Codeunit "Vendor Entity Data";
                    begin
                        this.UpdateEntityData(VendorEntityData);
                    end;
                }
            }
            group(EntityDataView)
            {
                Caption = 'Entity Data';

                field(EntityData; this.EntityDataText)
                {
                    Caption = 'Entity Data';
                    InstructionalText = 'The data for the entity';
                    ToolTip = 'The data for the entity';
                    Editable = false;
                    ShowCaption = false;
                    MultiLine = true;
                    ExtendedDatatype = RichContent;
                }
            }
        }
    }

    local procedure UpdateEntityData(IDataRetrievalImplementation: Interface IDataRetrieval)
    begin
        this.IDataRetrieval := IDataRetrievalImplementation;
        this.IDataRetrieval.RetrieveData(this.EntityData);

        this.EntityDataText := this.EntityData.GetEntityData();
    end;

    var
        CreateAndSendNotification: Codeunit "Create and Send Notification";
        EntityData: Codeunit "Entity Data";
        IDataRetrieval: Interface IDataRetrieval;
        EntityDataText: Text;
        SendItemNotificationLbl: Label 'Send Item Notification';
        SendCustomerNotificationLbl: Label 'Send Customer Notification';
        SendVendorNotificationLbl: Label 'Send Vendor Notification';
        GetItemDataLbl: Label 'Get Item Data';
        GetCustomerDataLbl: Label 'Get Customer Data';
        GetVendorDataLbl: Label 'Get Vendor Data';
}
