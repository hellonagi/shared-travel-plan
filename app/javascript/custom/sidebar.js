/* global bootstrap: false */
;(() => {
	'use strict'
	const tooltipTriggerList = Array.from(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
	tooltipTriggerList.forEach((tooltipTriggerEl) => {
		new bootstrap.Tooltip(tooltipTriggerEl)
	})
})()

document.addEventListener('DOMContentLoaded', function () {
	const slideSidebar = document.getElementById('slideSidebar')
	const listToggle = document.getElementById('listToggle')
	const postSlideSidebar = document.getElementById('postSlideSidebar')
	const postListToggle = document.getElementsByClassName('post-list-toggle')
	const detailSlideSidebar = document.getElementById('detailSlideSidebar')
	const detailViewButtons = document.getElementsByClassName('detail-view')

	// console.log(listToggle)
	// console.log(postListToggle)
	// console.log(detailViewButtons)

	function hideAllSidebars() {
		slideSidebar.classList.remove('show')
		postSlideSidebar.classList.remove('show')
		detailSlideSidebar.classList.remove('show')
	}

	// 左メニューのリスト一覧をクリックしたときに発火
	listToggle.addEventListener('click', function (event) {
		event.preventDefault() // デフォルトのリンク動作を防ぐ
		hideAllSidebars()
		slideSidebar.classList.toggle('show')
	})

	// 投稿をクリックしたときに発火
	Array.from(postListToggle).forEach((button) => {
		button.addEventListener('click', function (event) {
			event.preventDefault() // デフォルトのリンク動作を防ぐ
			hideAllSidebars()
			postSlideSidebar.classList.toggle('show')
		})
	})

	// 詳細を見るをクリックしたときに発火
	Array.from(detailViewButtons).forEach((button) => {
		button.addEventListener('click', function (event) {
			event.preventDefault() // デフォルトのリンク動作を防ぐ
			detailSlideSidebar.classList.toggle('show')
		})
	})
})
