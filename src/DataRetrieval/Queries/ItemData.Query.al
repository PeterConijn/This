namespace PC.This.EntityData.Queries;

using Microsoft.Inventory.Item;

query 50120 "Item Data"
{
    Caption = 'Item Data';
    QueryType = Normal;

    elements
    {
        dataitem(Item; Item)
        {
            column(SystemId; SystemId)
            {
            }
            column(No; "No.")
            {
            }
            column(Description; Description)
            {
            }
            column(UnitCost; "Unit Cost")
            {
            }
            column(UnitPrice; "Unit Price")
            {
            }
            column(BaseUnitofMeasure; "Base Unit of Measure")
            {
            }
            column(SafetyStockQuantity; "Safety Stock Quantity")
            {
            }
            column(SalesUnitofMeasure; "Sales Unit of Measure")
            {
            }
        }
    }
}
