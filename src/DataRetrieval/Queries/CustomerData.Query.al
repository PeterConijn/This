namespace PC.This.EntityData.Queries;

using Microsoft.Sales.Customer;

query 50121 "Customer Data"
{
    Caption = 'Customer Data';
    QueryType = Normal;

    elements
    {
        dataitem(Customer; Customer)
        {
            column(SystemId; SystemId)
            {
            }
            column(No; "No.")
            {
            }
            column(Name; Name)
            {
            }
            column(BalanceLCY; "Balance (LCY)")
            {
            }
            column(BalanceDueLCY; "Balance Due (LCY)")
            {
            }
            column(NoofOrders; "No. of Orders")
            {
            }
            column(NoofInvoices; "No. of Invoices")
            {
            }
        }
    }
}
