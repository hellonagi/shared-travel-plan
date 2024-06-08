/* global bootstrap: false */
;(() => {
	'use strict'
	const tooltipTriggerList = Array.from(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
	tooltipTriggerList.forEach((tooltipTriggerEl) => {
		new bootstrap.Tooltip(tooltipTriggerEl)
	})
})()

document.addEventListener('DOMContentLoaded', function () {
	console.log('AA')
	const slideSidebar = document.getElementById('slideSidebar')
	const listToggle = document.getElementById('listToggle')
	const postSlideSidebar = document.getElementById('postSlideSidebar')
	const postListToggle = document.getElementsByClassName('post-list-toggle')
	const detailSlideSidebar = document.getElementById('detailSlideSidebar')
	const detailViewButtons = document.getElementsByClassName('detail-view')
	console.log(detailViewButtons)

	// 左メニューのリスト一覧をクリックしたときに発火
	listToggle.addEventListener('click', function (event) {
		event.preventDefault() // デフォルトのリンク動作を防ぐ
		slideSidebar.classList.toggle('show')
	})

	// 投稿をクリックしたときに発火
	Array.from(postListToggle).forEach((button) => {
		button.addEventListener('click', function (event) {
			event.preventDefault() // デフォルトのリンク動作を防ぐ
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

document.addEventListener("DOMContentLoaded", function() {
	const fileInput = document.getElementById("listImage");
	const previewContainer = document.createElement("div");
	fileInput.parentNode.appendChild(previewContainer);
  
	fileInput.addEventListener("change", function() {
	  previewContainer.innerHTML = ""; // 以前のプレビューをクリア
	  const files = fileInput.files;
  
	  Array.from(files).forEach(file => {
		const reader = new FileReader();
		reader.onload = function(e) {
		  const img = document.createElement("img");
		  img.src = e.target.result;
		  img.className = "img-fluid mt-2";
		  img.style.maxWidth = "150px";
		  img.style.marginRight = "10px";
		  previewContainer.appendChild(img);
		};
		reader.readAsDataURL(file);
	  });
	});
  });
  
