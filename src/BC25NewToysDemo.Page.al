namespace PC.This;

page 50121 "BC25 New Toys Demo"
{
    ApplicationArea = All;
    Caption = 'BC25 New Toys Demo';
    PageType = Card;

    layout
    {
        area(Content)
        {
            grid(MainGrid)
            {
                ShowCaption = false;
                group(DateTimeFunctions)
                {
                    Caption = 'DateTime Functions';

                    field(ShowDateTimeFunctions; this.ShowDateTimeFunctionsLbl)
                    {
                        Caption = 'Show DateTime Functions';
                        ToolTip = 'Show the DateTime functions';
                        Editable = false;
                        ShowCaption = false;

                        trigger OnDrillDown()
                        begin
                            Page.Run(Page::"PC Time Machine")
                        end;
                    }
                }
                group(This)
                {
                    Caption = 'This';

                    field(ShowThis; this.ShowThisLbl)
                    {
                        Caption = 'Show This';
                        ToolTip = 'Show the "this" keyword';
                        Editable = false;
                        ShowCaption = false;

                        trigger OnDrillDown()
                        begin
                            Page.Run(Page::"PC Data Center");
                        end;
                    }
                }
            }
        }
    }

    var
        ShowDateTimeFunctionsLbl: Label 'Show DateTime Functions';
        ShowThisLbl: Label 'Show This';
}
