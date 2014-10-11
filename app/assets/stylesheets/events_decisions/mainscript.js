function oneF(){
	var r = confirm("Hello");
	var elem = document.getElementById("one");
	elem.parentNode.removeChild(elem);

}
function twoF(){
	var r = confirm("Hello");
	var elem = document.getElementById("two");
	elem.parentNode.removeChild(elem);


}
function threeF(){
	var r = confirm("Hello");
	var elem = document.getElementById("three");
	elem.parentNode.removeChild(elem);


}
function fourF(){
	var r = confirm("Hello");
	var elem = document.getElementById("four");
	elem.parentNode.removeChild(elem);


}
function fiveF(){
	var r = confirm("Hello");
	var elem = document.getElementById("five");
	elem.parentNode.removeChild(elem);
}

$("#tab-full-container").easytabs({
  animate: true,
  animationSpeed: 1000,
  defaultTab: "span#tab-2",
  panelActiveClass: "active-content-div",
  tabActiveClass: "selected-tab",
  tabs: "> div > span",
  updateHash: false,
  cycle: 2000
});
