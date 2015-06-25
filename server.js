var redis = require('redis');
var client = redis.createClient();
var cassandra = require('cassandra-driver');
//var async = require('async');
var fs = require('fs');
var isOk = false;
var reply1 = "";


 
client.on('connect', function() {
});



client.lrange('logkey', 0,-1,function(err, replies) {
    	replies.forEach(function (reply){
	    setReply(reply,handleReply);
         })
});


function setReply(value,callback){
	callback(null,value);
}

function handleReply(err, result){
	
	client.lrange(result, 0, -1, function(err, items) {
   		var array = [];
   		array.push(new Date().getTime());
   		items.forEach(function (item){
			array.push(item);
		})
   		validate(array,handleResult);
	});




}

function handleResult(err,result){
	if(err != null){
	 
		return;
	}
	else{
		writeFile(result);
		saveDb(result);	
	}
	
	client.del('logkey', function(err, reply) {
	});

	client.del(result,function(err,reply){
	});
}

function validate(value,callback)
{
	value.forEach(function (item){
		if(item == ""){
		   return;
		}
		
		
        })
	callback(null,value);

}

function writeFile(value)
{
	var date1 = value[0];
	if(typeof value[3] !== 'undefined'){
	var res = value[4].split(",");
        var parsedTag = "";
        for(i=0;i<res.length;i++){
                parsedTag = parsedTag+ " " + res[i].replace(":","").trim();
        }
	fs.appendFile(value[3], new Date(parseInt(date1)) + "\t" + value[1] + "\t" +parsedTag.trim() + "\t" + value[2] + "\n" , function(err) {
	});
	}

}
   
function saveDb(value){
	if(typeof value[3] !== 'undefined'){
		var res = value[4].split(",");
		var parsedTag = "";
		for(i=0;i<res.length;i++){
			parsedTag = parsedTag+ " " + res[i].replace(":","").trim(); 
		}

		var cassandraClient = new cassandra.Client({contactPoints: ['127.0.0.1'], keyspace: 'demo'});
		cassandraClient.execute("INSERT INTO logs (lognum,dated,tags, level, message) VALUES ("+value[5]+",'" + value[0] + "','"+parsedTag.trim()+"','"+value[1]+"', '"+value[2]+"')", function (err, result) {
        	});
	}
	
}

