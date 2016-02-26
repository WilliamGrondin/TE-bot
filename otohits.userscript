// ==UserScript==
// @name       Otohits
// @version    1
// @description  Start Otohits.
// @match      http://www.otohits.net
// @match      http://www.otohits.net/account/login*
// @match      http://www.otohits.net/account/wfautosurf*
// @match      http://www.otohits.net/account/dashboard*
// @author     Realist88
// @require    http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js
// @require    https://gist.github.com/raw/2625891/waitForKeyElements.js
// @grant       GM_addStyle
// ==/UserScript==

$(document).ready(function () {

    if (window.location.pathname=="/")
        home();
    if (window.location.pathname=="/account/login")
        login();
    if (window.location.pathname=="/account/dashboard")
        autosurf();
    
});


function home () {
setTimeout(function () {
window.location.replace("http://www.otohits.net/account/login");
    }, 20000);
}

function login () {
    setTimeout(function () {
$("input[name=Email]").val("user-email");
$("input[name=Password]").val("user-password");
$("input[type=submit]").click();
    }, 100);
}

function autosurf () {
    setTimeout(function () {
var el = $( "body > div.content > div.header > h1" ).text();
if (el == "DASHBOARD") {
   window.location.replace("http://www.otohits.net/account/wfautosurf");
} else if (el == "TABLEAU DE BORD") {
   window.location.replace("http://www.otohits.net/account/wfautosurf");
}
        }, 100);
}
waitForKeyElements ("#Start", triggerMostButtons);
function triggerMostButtons (jNode) {
    triggerMouseEvent (jNode[0], "mouseover");
    triggerMouseEvent (jNode[0], "mousedown");
    triggerMouseEvent (jNode[0], "click");
    triggerMouseEvent (jNode[0], "mouseup");
}
function triggerMouseEvent  (node, eventType) {
    var clickEvent  = document.createEvent ('MouseEvents');
    clickEvent.initEvent (eventType, true, true);
    node.dispatchEvent (clickEvent);
}
