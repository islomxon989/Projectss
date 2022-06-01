
function continuousTest() {
    var x = document.getElementById('log');
    setInterval(function(){
    x.value += '\nContinuous Testing...';
    },500);
    ///i = 1;
    ///var x = document.getElementById('log');
    ///while(i){
        ///x.value += '\nContinuous Testing...';
    ///}
}



function singleTest() {
    var x = document.getElementById('log');
    setInterval(function(){
    x.value += '\nSingle Test...';
    },500);
}



function showMappings() {
    var x = document.getElementById('log');
    setInterval(function(){
    x.value += '\nMapping...';
    },500);
}



