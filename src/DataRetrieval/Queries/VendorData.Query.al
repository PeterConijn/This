namespace PC.This.EntityData.Queries;

using Microsoft.Purchases.Vendor;

query 50122 "Vendor Data"
{
    Caption = 'Vendor Data';
    QueryType = Normal;

    elements
    {
        dataitem(Vendor; Vendor)
        {
            column(SystemId; SystemId)
            {
            }
            column(Name; Name)
            {
            }
            column(AmtRcdNotInvoicedLCY; "Amt. Rcd. Not Invoiced (LCY)")
            {
            }
            column(BalanceLCY; "Balance (LCY)")
            {
            }
            column(BalanceDueLCY; "Balance Due (LCY)")
            {
            }
            column(CrMemoAmountsLCY; "Cr. Memo Amounts (LCY)")
            {
            }
            column(CreditAmountLCY; "Credit Amount (LCY)")
            {
            }
            column(NetChangeLCY; "Net Change (LCY)")
            {
            }
        }
    }
}
