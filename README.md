iOSExamples-StaticCells
=======================

This project is an example for implementing a UITableView that has static cells. This pattern is often used on options pages or for creating/editing model objects.

The gist is that you can create a static number of cells and store them as variables. You can then use the `tableView: cellForRowAtIndexPath` method to retrive the appropriate `UITableViewCell` variable. 

```objectivec
// Return the row for the corresponding section and row
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch(indexPath.section)
    {
        case 0:
        switch(indexPath.row)
        {
            case 0: return self.firstNameCell;  // section 0, row 0 is the first name
            case 1: return self.lastNameCell;   // section 0, row 1 is the last name
        }
        case 1:
        switch(indexPath.row)
        {
            case 0: return self.shareCell;      // section 1, row 0 is the share option
        }
    }
    return nil;
}
```

```swift
// Return the row for the corresponding section and row
override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    switch(indexPath.section) {
    case 0:
        switch(indexPath.row) {
        case 0: return self.firstNameCell   // section 0, row 0 is the first name
        case 1: return self.lastNameCell    // section 0, row 1 is the last name
        default: fatalError("Unknown row in section 0")
        }
    case 1:
        switch(indexPath.row) {
        case 0: return self.shareCell       // section 1, row 0 is the share option
        default: fatalError("Unknown row in section 1")
        }
    default: fatalError("Unknown section")
    }
}
```

This example is implemented in both Objective-C and Swift.  You can open the workspace to view both projects simultaneously.

For more information refer to the blog entry: http://derpturkey.com/create-a-static-uitableview-without-storyboards/
