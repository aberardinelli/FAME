<html>
    <head>
        <title>
            Welcome to the new FAME!
        </title>
    </head>
<body>
<h1>FAME: Artist Management Enterprises</h1>

<h2> Add new artist manager </h2>

<?php
include '../dbconn.php';

// All strings that come from user input need to be
// "escaped" first - they need to be prepared to be input into 
// the database to guard the database against any attacks.
$ESClastname = mysqli_real_escape_string($conn, $_POST['LastName']);
$ESCfirstname = mysqli_real_escape_string($conn, $_POST['FirstName']);
$ESCemail = mysqli_real_escape_string($conn, $_POST['Email']);

// Since phone number wasn't required, set to NULL if left blank
if (strlen(trim($_POST['Phone'])) == 0) {
	$phonenumber="NULL"; }
else {
    $phonenumber = $_POST['Phone'];}
    
$query = "INSERT INTO MANAGER (FirstName, LastName, Email, PhoneNumber)
    VALUES ('$ESCfirstname', '$ESClastname', '$ESCemail', $phonenumber);";

mysqli_query($conn,$query);

if (mysqli_error($conn)) 
	{die("MySQL error: ".mysqli_error($conn));}

echo "<p>Manager added successfully. </p>";
?>


<p><a href="../home_owner.html">Click here to return to Owner Home Page.</a></p>


</body>
</html>