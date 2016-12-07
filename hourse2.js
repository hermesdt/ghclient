var Hourse = function(){
}

Hourse.animations = ['animation1', 'animation2'];

Hourse.addElement = function(){
    // clone and add new element to the DOM
    var template = document.getElementById("hourse-template");
    var content = template.content;
    var container = document.getElementById("hourses-container")
    container.appendChild(document.importNode(content, true));

    // add animation class to this new element
    var child = container.children[container.children.length - 1];
    var index = parseInt(Math.random() * Hourse.animations.length);
    child.classList.add(Hourse.animations[index]);

    // scroll to bottom
    window.scrollTo(0,document.body.scrollHeight);
}

document.addEventListener("DOMContentLoaded", function(){
    Hourse.addElement();
}, false);