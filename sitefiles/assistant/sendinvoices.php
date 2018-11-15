<html>
    <head>
        <title>
            Welcome to the new FAME!
        </title>
    </head>
<body>
<h1>FAME: Artist Management Enterprises</h1>

<h2>Verify recent performances and send invoices</h2>

<?php
// database connection file is one folder up, use ../
include '../dbconn.php';

$query = "SELECT PerformanceID, PerformanceDate, Venue
    FROM PERFORMANCE
    WHERE PerformanceDate < CURRENT_DATE
    AND Status != 'Cancelled'
    AND InvoiceStatus != 'Paid';";

$result = mysqli_query($conn,$query);

if (mysqli_error($conn)) 
    {die("MySQL error: ".mysqli_error($conn));}
    
// IF the query returned any results...
if (mysqli_num_rows($result) > 0) {
    echo "<p>All events that still need to be invoiced:</p>";
    
    // First create a table, with column headings
    echo "<table>";
    echo "<tr><th>Performance ID</th><th>Performance Date</th><th>Venue ID</th><th>Click button to take action</th></tr>";
    
    // Then loop through the output of the query, creating a row
    // in the HTML table for each row in $result
    while($row = mysqli_fetch_assoc($result)) {
        echo "<tr><td>".$row["PerformanceID"]."</td><td>".
            $row["PerformanceDate"]."</td><td>".
            $row["Venue"]."</td></tr>";
    }
    // After you're done adding the rows, end the table.
    echo "</table>";
} // end of what we do IF the query returned results
// OTHERWISE tell the user there were no results
else {    echo "No invoices need to be generated at this time.";   }


// Always remember to close the connection to the database when you're done!
mysqli_close($conn);
?>


</body>
</html>