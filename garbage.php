<?php
require_once ('config.php');

switch($_GET['function']) {
	case 'insert_garbage':
    	insertGarbage($conn);
    	break;
    case 'insert_tehsil':
    	insertTehsil($conn);
    	break;
    case 'insert_uc':
    	insertUc($conn);
    	break;
    case 'all_uc':
    	getAllUC($conn);
    	break;
    case 'all_tehsil':
    	getAllTehsil($conn);
    	break;
    case 'all_garbage':
    	getAllGarbage($conn);
    	break;

    default: 
     	$response["status"] = 'failed';
	    $response["message"] = 'No fucntion called';
	    echo json_encode($response);
}

// Insert garbage collector 

function insertGarbage($conn){
	$timeStamp = time();
	$sql = "INSERT INTO `GARBAGE`(`GARBAGE_CODE`, `LATITUDE`, `LONGITUDE`, `TEHSIL_ID`, `UC_ID`)   
        values('" . $_POST['garbage_code'] . "','" . $_POST['latitude'] . "','" . $_POST['longitude'] . "','" . $_POST['tehsil_id'] . "','" . $_POST['uc_id'] . "')";
	$query = mysqli_query($conn, $sql);
	if ($query)
	{
	    $response["status"] = 'success';
	    $response["message"] = 'Garbage added sucessfully.';
	    echo json_encode($response);
	}
	else
	{
	    $response["status"] = 'failed';
	    $response["message"] = 'Error in query';
	    echo json_encode($response);
	}
}


// Insert Tehsil  

function insertTehsil($conn){
    $sql = "insert into `tehsil` (`TEHSIL_NAME`,`TEHSIL_CODE`) values('" . $_POST['tehsil_name'] . "','" . $_POST['tehsil_code'] . "')";
	$query = mysqli_query($conn, $sql);
	if ($query)
	{
	    $response["status"] = 'success';
	    $response["message"] = 'Tehisl added sucessfully.';
	    echo json_encode($response);
	}
	else
	{
	    $response["status"] = 'failed';
	    $response["message"] = 'Error in query';
	    echo json_encode($response);
	}
}

// Insert UC  

function insertUc($conn){
	$sql = "INSERT INTO `UC`(`UC_NAME`, `UC_CODE`)  
        values('" . $_POST['uc_name'] . "','" . $_POST['uc_code'] . "')";
	$query = mysqli_query($conn, $sql);
	if ($query)
	{
	    $response["status"] = 'success';
	    $response["message"] = 'UC added sucessfully.';
	    echo json_encode($response);
	}
	else
	{
	    $response["status"] = 'failed';
	    $response["message"] = 'Error in query';
	    echo json_encode($response);
	}
}

// Get All UC

function getAllUC($conn){
	$result = "SELECT * FROM UC;";
	$query = mysqli_query($conn,$result);
	if ($query->num_rows > 0) {
		$response["data"] = array();
		while ($row = mysqli_fetch_assoc($query)) {
		$UC["id"] = $row["id"];
		$UC["uc_name"] = $row["uc_name"];
		$UC["uc_code"] = $row["uc_code"];
		array_push($response["data"] , $UC); 
		}
		$response["status"] = "success";
	 	echo json_encode($response);
	}else{
		$response["status"] = 'failed';
	    $response["message"] = 'No record found';
	    echo json_encode($response);
	}
}

 
// Get All Tehsils

function getAllTehsil($conn){
	$result = "SELECT * FROM TEHSIL;";
	$query = mysqli_query($conn,$result);
	if ($query->num_rows > 0) {
		$response["data"] = array();
		while ($row = mysqli_fetch_assoc($query)) {
		$TEHSIL["id"] = $row["id"];
		$TEHSIL["tehsil_name"] = $row["tehsil_name"];
		$TEHSIL["tehsil_code"] = $row["tehsil_code"];
		array_push($response["data"] , $TEHSIL); 
		}
		$response["status"] = "success";
	 	echo json_encode($response);
	}else{
		$response["status"] = 'failed';
	    $response["message"] = 'No record found';
	    echo json_encode($response);
	}
}


// Get All Garbages

function getAllGarbage($conn){
	$result = "SELECT * FROM GARBAGE g JOIN TEHSIL t on g.tehsil_id=t.id JOIN UC u on g.uc_id=u.id;";
	$query = mysqli_query($conn,$result);
	if ($query->num_rows > 0) {
		$response["garbage"] = array();
		while ($row = mysqli_fetch_assoc($query)) {
			$GARBAGE["id"] = $row["id"];
			$GARBAGE["garbage_code"] = $row["garbage_code"];
			$GARBAGE["latitude"] = $row["latitude"];
		    $GARBAGE["longitude"] = $row["longitude"];
			// $GARBAGE["tehsil_id"] = $row["tehsil_id"];
			// $GARBAGE["uc_id"] = $row["uc_id"];
			$GARBAGE["created_at"] = $row["created_at"];
			$TEHSIL["tehsil_id"] = $row["tehsil_id"];
			$TEHSIL["tehsil_name"] = $row["tehsil_name"];
			$TEHSIL["tehsil_code"] = $row["tehsil_code"];
			$GARBAGE["tehsil"] = $TEHSIL;
			$UC["uc_id"] = $row["uc_id"];
			$UC["uc_name"] = $row["uc_name"];
			$UC["uc_code"] = $row["uc_code"];
			$GARBAGE["uc"] = $UC;
			array_push($response["garbage"] , $GARBAGE); 
		}

		$response["status"] = "success";
	 	echo json_encode($response);
	}else{
		$response["status"] = 'failed';
	    $response["message"] = 'No record found';
	    echo json_encode($response);
	}
}


?>