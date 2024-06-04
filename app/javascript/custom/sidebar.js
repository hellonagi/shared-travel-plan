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
