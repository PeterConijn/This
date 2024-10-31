namespace PC.This;

using System.DateTime;

page 50122 "PC Time Machine"
{
    ApplicationArea = All;
    Caption = 'Time Machine';
    PageType = Card;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field(SourceDate; this.SourceDate)
                {
                    Caption = 'Date';
                    ToolTip = 'Specifies the date you want to dissect';
                    ShowMandatory = true;

                    trigger OnValidate()
                    begin
                        if this.SourceTime = 0T then
                            this.SourceTime := Time();
                    end;
                }
                field(SourceTime; this.SourceTime)
                {
                    Caption = 'Time';
                    ToolTip = 'Specifies the time you want to dissect';
                    ShowMandatory = true;
                }
            }
            group(Details)
            {
                Caption = 'Details';
                Editable = false;

                field(SourceDateTime; this.SourceDateTime)
                {
                    Caption = 'The DateTime';
                    ToolTip = 'The datetime based on your entry';
                }
                field(ParsedDate; this.ParsedDate)
                {
                    Caption = 'Parsed Date';
                    ToolTip = 'The date component of the source date and time';
                }
                field(ParsedTime; this.ParsedTime)
                {
                    Caption = 'Parsed Time';
                    ToolTip = 'The time component of the source date and time';
                }
                field(ParsedDay; this.ParsedDay)
                {
                    Caption = 'Parsed Day';
                    ToolTip = 'The day component of the parsed date';
                }
                field(ParsedMonth; this.ParsedMonth)
                {
                    Caption = 'Parsed Month';
                    ToolTip = 'The month component of the parsed date';
                }
                field(ParsedYear; this.ParsedYear)
                {
                    Caption = 'Parsed Year';
                    ToolTip = 'The year component of the parsed date';
                }
                field(ParsedWeek; this.ParsedWeek)
                {
                    Caption = 'Parsed Week';
                    ToolTip = 'The week number of the parsed date';
                }
                field(ParsedDayOfWeek; this.ParsedDayOfWeek)
                {
                    Caption = 'Parsed Day of Week';
                    ToolTip = 'The day of the week of the parsed date';
                }
                field(ParsedHours; this.ParsedHours)
                {
                    Caption = 'Parsed Hours';
                    ToolTip = 'The hour component of the parsed time';
                }
                field(ParsedMinutes; this.ParsedMinutes)
                {
                    Caption = 'Parsed Minutes';
                    ToolTip = 'The minute component of the parsed time';
                }
                field(ParsedSeconds; this.ParsedSeconds)
                {
                    Caption = 'Parsed Seconds';
                    ToolTip = 'The second component of the parsed time';
                }
                field(ParcedMilliseconds; this.ParcedMilliseconds)
                {
                    Caption = 'Parced Milliseconds';
                    ToolTip = 'The millisecond component of the parsed time';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Dissect)
            {
                Caption = 'Dissect Datetime';
                ToolTip = 'Dissect the date and time into its components';
                Image = Timesheet;

                trigger OnAction()
                begin
                    this.ParseDateTime();
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                Caption = 'Process';

                actionref(Dissect_Promoted; Dissect)
                {
                }
            }
        }
    }

    var
        SourceDateTime: DateTime;
        SourceDate: Date;
        SourceTime: Time;
        ParsedDate: Date;
        ParsedTime: Time;
        ParsedDay: Integer;
        ParsedMonth: Integer;
        ParsedYear: Integer;
        ParsedWeek: Integer;
        ParsedDayOfWeek: Enum "Recurrence - Day of Week";
        ParsedHours: Integer;
        ParsedMinutes: Integer;
        ParsedSeconds: Integer;
        ParcedMilliseconds: Integer;

    local procedure ParseDateTime()
    var
        MissingDateErr: Label 'Please specify a date';
        MissingTimeErr: Label 'Please specify a time';
    begin
        if this.SourceDate = 0D then
            Error(MissingDateErr);
        if this.SourceTime = 0T then
            Error(MissingTimeErr);

        this.SourceDateTime := CreateDateTime(this.SourceDate, this.SourceTime);

        this.ParsedDate := this.SourceDateTime.Date(); // DT2Date(this.SourceDateTime);
        this.ParsedTime := this.SourceDateTime.Time(); // DT2Time(this.SourceDateTime);

        this.ParsedDay := this.ParsedDate.Day(); // Date2DMY(this.ParsedDate, 1);
        this.ParsedMonth := this.ParsedDate.Month();
        this.ParsedYear := this.ParsedDate.Year();
        this.ParsedWeek := this.ParsedDate.WeekNo(); // Date2DWY(this.ParsedDate, 2);
        this.ParsedDayOfWeek := Enum::"Recurrence - Day of Week".FromInteger(this.ParsedDate.DayOfWeek()); // Date2DWY(this.ParsedDate, 1);

        this.ParsedHours := this.ParsedTime.Hour();
        this.ParsedMinutes := this.ParsedTime.Minute();
        this.ParsedSeconds := this.ParsedTime.Second();
        this.ParcedMilliseconds := this.ParsedTime.Millisecond();
    end;
}
