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

                group(PlainTextGroup)
                {
                    ShowCaption = false;
                    field(GetItemData; this.GetItemDataLbl)
                    {
                        Caption = 'Get Item Data (Text)';
                        ToolTip = 'Get the item data in text format';
                        Editable = false;
                        ShowCaption = false;

                        trigger OnDrillDown()
                        var
                            ItemEntityData: Codeunit "Item Entity Data";
                        begin
                            this.UpdateEntityData(ItemEntityData, this.TextOutputFormat::PlainText);
                        end;
                    }
                    field(GetCustomerData; this.GetCustomerDataLbl)
                    {
                        Caption = 'Get Customer Data (Text)';
                        ToolTip = 'Retrieve the customer data in text format';
                        Editable = false;
                        ShowCaption = false;

                        trigger OnDrillDown()
                        var
                            CustomerEntityData: Codeunit "Customer Entity Data";
                        begin
                            this.UpdateEntityData(CustomerEntityData, this.TextOutputFormat::PlainText);
                        end;
                    }
                    field(GetVendorData; this.GetVendorDataLbl)
                    {
                        Caption = 'Get Vendor Data (Text)';
                        ToolTip = 'Retrieve the vendor data in text format';
                        Editable = false;
                        ShowCaption = false;

                        trigger OnDrillDown()
                        var
                            VendorEntityData: Codeunit "Vendor Entity Data";
                        begin
                            this.UpdateEntityData(VendorEntityData, this.TextOutputFormat::PlainText);
                        end;
                    }
                }
                group(XmlDataRetrieval)
                {
                    ShowCaption = false;

                    field(GetItemDataAsXml; this.GetItemDataXmlLbl)
                    {
                        Caption = 'Get Item Data (XML)';
                        ToolTip = 'Get the item data in XML format';
                        Editable = false;
                        ShowCaption = false;

                        trigger OnDrillDown()
                        var
                            ItemEntityData: Codeunit "Item Entity Data";
                        begin
                            this.UpdateEntityData(ItemEntityData, this.TextOutputFormat::Xml);
                        end;
                    }
                    field(GetCustomerDataAsXml; this.GetCustomerDataXmlLbl)
                    {
                        Caption = 'Get Customer Data (XML)';
                        ToolTip = 'Retrieve the customer data in XML format';
                        Editable = false;
                        ShowCaption = false;

                        trigger OnDrillDown()
                        var
                            CustomerEntityData: Codeunit "Customer Entity Data";
                        begin
                            this.UpdateEntityData(CustomerEntityData, this.TextOutputFormat::Xml);
                        end;
                    }
                    field(GetVendorDataAsXml; this.GetVendorDataXmlLbl)
                    {
                        Caption = 'Get Vendor Data (XML)';
                        ToolTip = 'Retrieve the vendor data in XML format';
                        Editable = false;
                        ShowCaption = false;

                        trigger OnDrillDown()
                        var
                            VendorEntityData: Codeunit "Vendor Entity Data";
                        begin
                            this.UpdateEntityData(VendorEntityData, this.TextOutputFormat::Xml);
                        end;
                    }
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
                    Enabled = false;
                    ShowCaption = false;
                    MultiLine = true;
                    ExtendedDatatype = RichContent;
                }
            }
        }
    }

    local procedure UpdateEntityData(IDataRetrievalImplementation: Interface IDataRetrieval; OutputFormat: Option PlainText,Xml)
    var
        Result: Text;
    begin
        this.IDataRetrieval := IDataRetrievalImplementation;
        this.IDataRetrieval.RetrieveData(this.EntityData);

        if OutputFormat = OutputFormat::PlainText then
            Result := this.EntityData.GetEntityDataAsText()
        else
            Result := this.EntityData.GetEntityDataAsXmlText();

        this.EntityDataText := Result;
    end;

    var
        CreateAndSendNotification: Codeunit "Create and Send Notification";
        EntityData: Codeunit "Entity Data";
        IDataRetrieval: Interface IDataRetrieval;
        EntityDataText: Text;
        SendItemNotificationLbl: Label 'Send Item Notification';
        SendCustomerNotificationLbl: Label 'Send Customer Notification';
        SendVendorNotificationLbl: Label 'Send Vendor Notification';
        GetItemDataLbl: Label 'Get Item Data (Text)';
        GetCustomerDataLbl: Label 'Get Customer Data (Text)';
        GetVendorDataLbl: Label 'Get Vendor Data (Text)';
        GetItemDataXmlLbl: Label 'Get Item Data (Xml)';
        GetCustomerDataXmlLbl: Label 'Get Customer Data (Xml)';
        GetVendorDataXmlLbl: Label 'Get Vendor Data (Xml)';
        TextOutputFormat: Option PlainText,Xml;
}
