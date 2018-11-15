<html>
    <head>
        <title>
            Welcome to the new FAME!
        </title>
    </head>
<body>
<h1>FAME: Artist Management Enterprises</h1>

<h2>View and Edit Artist Info / Contract Info</h2>

<?php
// database connection file is one folder up, use ../
include '../dbconn.php';

$query = "SELECT ArtistID, MAX(EndDate) AS End
    FROM CONTRACT 
    GROUP BY ArtistID
    ORDER BY End;";

$result = mysqli_query($conn,$query);

if (mysqli_error($conn)) 
    {die("MySQL error: ".mysqli_error($conn));}
    
// IF the query returned any results...
if (mysqli_num_rows($result) > 0) {
    echo "<p>All artist contract records:</p>";
    
    // First create a table, with column headings
    echo "<table>";
    echo "<tr><th>Artist ID</th><th>Contract End Date</th><th>Click button to take action</th></tr>";
    
    // Then loop through the output of the query, creating a row
    // in the HTML table for each row in $result
    while($row = mysqli_fetch_assoc($result)) {
        echo "<tr><td>".$row["ArtistID"]."</td><td>".
            $row["End"]."</td><td>".
            "Buttons go here</td></tr>";
    // ON TUESDAY BEFORE THANKSGIVING:
    // 1. ADD THE BUTTONS HERE
    // 2. How to make manager/assistant only see THEIR artist clients?
    // 3. (Optional) Conditional buttons based on status of contract
    }
    // After you're done adding the rows, end the table.
    echo "</table>";
} // end of what we do IF the query returned results
// OTHERWISE tell the user there were no results
else {    echo "No artist contracts in database.";   }


// Always remember to close the connection to the database when you're done!
mysqli_close($conn);
?>

<p><a href="../home_assistant.html">Click here to return to Assistant Home Page.</a></p>


</body>
</html>