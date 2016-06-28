var httpRequest = null;

function getXMLHttpRequest(){
	return new XMLHttpRequest();
}

function sendRequest(method, url, params, callback){
	
	httpRequest = getXMLHttpRequest();
	
	var httpMethod = method? method : "GET";
	 
	if(httpMethod != "GET" && httpMethod != "POST"){
		 httpMethod = "GET";
	 }
	
	var httpUrl = url;
	var httpParams = (params==null || params =="")? null :params;
	
	if( httpMethod == "GET" && httpParams != null){
		httpUrl =httpUrl +"?"+httpParams;
	}
	
	
	httpRequest.open(httpMethod,httpUrl,true);
	httpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=euc-kr");
	httpRequest.onreadystatechange = callback;
	httpRequest.send(httpMethod =="POST"? httpParams:null);
}