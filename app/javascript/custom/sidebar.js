/* global bootstrap: false */
console.log('HAHA1')
;(() => {
	'use strict'
	console.log('HAHA2')
	const tooltipTriggerList = Array.from(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
	tooltipTriggerList.forEach((tooltipTriggerEl) => {
		new bootstrap.Tooltip(tooltipTriggerEl)
	})
})()

document.addEventListener("DOMContentLoaded", function() {
	const slideSidebar = document.getElementById("slideSidebar");
	const listToggle = document.getElementById("listToggle");
	const postSlideSidebar = document.getElementById("postSlideSidebar");
	const postListToggle = document.getElementById("postListToggle");
	const detailSlideSidebar = document.getElementById("detailSlideSidebar");
	const detailViewButtons = document.querySelectorAll(".detail-view");
  
	listToggle.addEventListener("click", function(event) {
	  event.preventDefault(); // デフォルトのリンク動作を防ぐ
	  slideSidebar.classList.toggle("show");
	});
  
	postListToggle.addEventListener("click", function(event) {
	  event.preventDefault(); // デフォルトのリンク動作を防ぐ
	  postSlideSidebar.classList.toggle("show");
	});
  
	detailViewButtons.forEach(button => {
	  button.addEventListener("click", function(event) {
		event.preventDefault(); // デフォルトのリンク動作を防ぐ
		detailSlideSidebar.classList.toggle("show");
	  });
	});
  });
  