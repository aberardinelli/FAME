<html>
<head>
	<title> Dr. Sample, the Veterinarian </title>
</head>

<body>


<h1 style="text-align:center;"> Dr. Sample's Office Records System </h1>

<h2 style="text-align:center;"> New Patient and New Owner </h2>

<?php
$server='localhost';
$username='root';
$password='';
$dbname='mis350test';

// Create connection to a database server.
$conn = mysqli_connect($server, $username, $password, $dbname);

// Always check your connection before you try to do anything else!
if (!$conn) {die( "Connection failed: " . mysqli_connect_error());}

// All strings that come from user input need to be
// "escaped" first - they need to be prepared to be input into 
// the database to guard the database against any attacks.
$ESClastname = mysqli_real_escape_string($conn, $_POST['lastname']);
$ESCfirstname = mysqli_real_escape_string($conn, $_POST['firstname']);

// Since phone number wasn't required, set to NULL if left blank
if (strlen(trim($_POST['phone'])) == 0) {
	$phonenumber="NULL"; }
else {
	$phonenumber = $_POST['phone'];}

// Since email wasn't required, set to NULL if left blank
if (strlen(trim($_POST['email'])) == 0) {
	$ESCemail="NULL"; }
else {
	$ESCemail = "'".mysqli_real_escape_string($conn, $_POST['email'])."'";}

$ESCpetname = mysqli_real_escape_string($conn, $_POST['petname']);

$pettype = $_POST['type'];
	// If user selected Other, check the textbox to see if it was specified.
	if ($pettype == 'Other' && (strlen(trim($_POST['othertype'])) > 0))
		{$pettype = mysqli_real_escape_string($conn, $_POST['othertype']);}

// Since breed wasn't required, set to NULL if left blank
if (strlen(trim($_POST['breed'])) == 0) {
	$ESCbreed="NULL"; }
else {
	$ESCbreed = "'".mysqli_real_escape_string($conn, $_POST['breed'])."'";}

// If date was left blank, set to NULL.  Otherwise, convert to proper date format for MySQL database YYYY-MM-DD
if (strlen(trim($_POST['petDOB'])) == 0) {
	$insertDOB="NULL";}
else {
	$insertDOB = "'".$_POST['petDOB']."'";}

$query = "INSERT INTO PET_OWNER (OwnerLastName, OwnerFirstName, OwnerPhone,OwnerEmail) VALUES ('$ESClastname','$ESCfirstname',$phonenumber,$ESCemail);";

mysqli_query($conn,$query);

if (mysqli_error($conn)) 
	{die("MySQL error: ".mysqli_error($conn));}

echo "<p>Owner added successfully. </p>";
	
$ownerID = mysqli_insert_id($conn);

$query2 = "INSERT INTO PET (PetName, PetType, PetBreed, PetDOB, OwnerID) VALUES ('$ESCpetname','$pettype',$ESCbreed,$insertDOB,$ownerID);";

mysqli_query($conn,$query2);

if (mysqli_error($conn)) 
	{die("MySQL error: ".mysqli_error($conn));}

echo "<p>Patient added successfully. </p>";

// Always remember to close the connection to the database when you're done!
mysqli_close($conn);

?>


<a href="index.html">Return to main menu</a>

</body>
</html>
