'use strict';

var Hourse = function(){
}

Hourse.addElement = function(){
    var template = document.getElementById("hourse-template");
    var content = template.content;
    var container = document.getElementById("hourses-container")
    container.appendChild(document.importNode(content, true));
}

document.addEventListener("DOMContentLoaded", function(){
    Hourse.addElement();
}, false);