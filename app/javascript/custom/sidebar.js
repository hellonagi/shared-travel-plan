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
  
	listToggle.addEventListener("click", function(event) {
	  event.preventDefault(); // デフォルトのリンク動作を防ぐ
	  slideSidebar.classList.toggle("show");
	});
  });
  