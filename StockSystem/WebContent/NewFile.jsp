<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>

	var mysql = require('mysql');
	var connection = mysql.createConnection({
	    host: 'localhost',
	    post: 3306,
	    user: 'root',
	    password: 'tkdrl123',
	    database: 'kopo09'
	});
	connection.connect();
	connection.query('select itemid from stock',function(err,rows,fields){
		if(!err){
			console.log(rows);
			console.log(fields);
			
		}else{
			console.log('query error:'+err);
		}
	});
	connection.end();
	


</script>
<img src = "bar.jpg"  width=100 height=100 />
</body>
</html>