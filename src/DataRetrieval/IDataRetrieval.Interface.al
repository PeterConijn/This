namespace PC.This.EntityData;

/// <summary>
/// Interface for data retrieval
/// </summary>
interface IDataRetrieval
{
    /// <summary>
    /// Retrieve data from a table
    /// </summary>
    /// <param name="EntityData">A codeunit containing the entity data</param>
    procedure RetrieveData(var EntityData: Codeunit "Entity Data")
}
