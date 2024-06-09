async function initSearch() {
	const { AdvancedMarkerView } = await google.maps.importLibrary('marker')
	const { PinView } = await google.maps.importLibrary('marker')
	window.listMarkers = {}

	const searchInput = document.getElementById('searchInput')
	const resultsContainer = document.getElementById('resultsContainer')
	const detailSlideSidebar = document.getElementById('detailSlideSidebar')
	const todos = $('#td').data('td-id')
	todos.forEach((todo) => {
		const todoElement = document.getElementById(`card-${todo.id}`)

		todo.list.forEach((li) => {
			const position = { lat: li.latitude, lng: li.longitude }
			const pinView = new PinView({
				scale: 1,
			})
			const markerView = new AdvancedMarkerView({
				map: window.map,
				position: position,
				title: li.details,
				content: pinView.element,
			})
			window.listMarkers[li.id] = { markerView, pinView }
			todoElement.addEventListener('mouseover', () => {
				pinView.scale = 1.5
			})
			todoElement.addEventListener('mouseout', () => {
				pinView.scale = 1
			})
		})
	})

	const detailTitle = document.getElementById('detail-title')
	const detailDescription = document.getElementById('detail-description')
	const detailAuthor = document.getElementById('detail-author')
	const detailCards = document.getElementById('detail-cards')
	// const detailLatitude = document.getElementById('detail-latitude')
	// const detailLongitude = document.getElementById('detail-longitude')
	// const detailDetails = document.getElementById('detail-details')

	function filterData(input, data) {
		const lowercasedInput = input.toLowerCase()
		return data.filter(
			(item) =>
				item.title.toLowerCase().includes(lowercasedInput) || item.description.toLowerCase().includes(lowercasedInput)
		)
	}

	function displayResults(results) {
		todos.forEach((todo) => {
			const todoElement = document.getElementById(`card-${todo.id}`)
			if (todoElement) {
				todoElement.classList.add('d-none')
			}

			todo.list.forEach((li) => {
				window.listMarkers[li.id].markerView.map = null
			})
		})

		results.forEach((result) => {
			const resultElement = document.getElementById(`card-${result.id}`)
			if (resultElement) {
				resultElement.classList.remove('d-none')

				result.list.forEach((li) => {
					window.listMarkers[li.id].markerView.map = window.map
				})
			}
		})
	}

	// 初期データ表示
	displayResults(todos)

	// 入力イベントのリスナー
	searchInput.addEventListener('input', function () {
		const input = this.value
		const filteredResults = filterData(input, todos)
		displayResults(filteredResults)
	})

	// イベントデリゲーションで詳細表示ボタンにイベントリスナーを設定
	resultsContainer.addEventListener('click', function (event) {
		const card = event.target.closest('.card-view')
		if (card) {
			event.preventDefault()
			detailSlideSidebar.classList.toggle('show')

			const todo = todos.find((t) => t.id == card.id.split('-')[1])
			if (todo) {
				detailTitle.textContent = todo.title
				detailAuthor.textContent = todo.author
				detailDescription.textContent = todo.description

				detailCards.innerHTML = ''
				todo.list.forEach((li) => {
					const div = document.createElement('div')
					const pinView = window.listMarkers[li.id].pinView
					div.addEventListener('mouseover', () => {
						pinView.scale = 1.5
					})
					div.addEventListener('mouseout', () => {
						pinView.scale = 1
					})

					const img = $(`#img-${li.id}`).data(`img-${li.id}`)
					div.id = `detail-card-${li.id}`
					div.className = 'card'
					div.dataset.id = li.id
					div.innerHTML = `
						${htmlDecode(img)}
						<div class="card-body">
							<p id="detail" class="card-text">${li.details}</p>
						</div>
					`
					detailCards.appendChild(div)
				})
			}
		}
	})

	function htmlDecode(input) {
		var e = document.createElement('div')
		e.innerHTML = input
		return e.childNodes.length === 0 ? '' : e.childNodes[0].nodeValue
	}
}

initSearch()
document.addEventListener('turbo:link', initSearch)
