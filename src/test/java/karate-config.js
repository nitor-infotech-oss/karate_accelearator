function fn() {    
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
	BaseUrl: 'http://localhost:8080/',
	dataPath: 'examples/data/dev/'
  }
  if (env == 'dev') {
    // customize
    config.BaseUrl = 'http://localhost:8080/';
    config.dataPath = 'examples/env/dev/data/';
  }
  else if (env == 'qa') {
      config.BaseUrl = '<devUrl>';
      config.dataPath = 'examples/env/qa/data/';
  }
    //define the connection time out and read timeout in milli seconds so that the code does not wait if the server do not respond till mentioned milli seconds
  karate.configure('connectTimeout',5000);
  karate.configure('readTimeout', 5000);
  return config;
}