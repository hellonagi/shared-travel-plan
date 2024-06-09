async function initMap() {
	let infoWindow
	window.map = null
	window.markers = []
	const position = { lat: 35.681236, lng: 139.767125 }

	//@ts-ignore
	const { Map } = await google.maps.importLibrary('maps')
	const { AdvancedMarkerView } = await google.maps.importLibrary('marker')
	const { PinView } = await google.maps.importLibrary('marker')

	window.map = new Map(document.getElementById('map'), {
		zoom: 6,
		center: position,
		mapId: 'DEMO_MAP_ID',
		mapTypeControl: false,
		streetViewControl: false,
		fullscreenControl: false,
		zoomControl: false,
	})

	infoWindow = new google.maps.InfoWindow()

	{
		;(() => {
			if (navigator.geolocation) {
				navigator.geolocation.getCurrentPosition(
					(position) => {
						const pos = {
							lat: position.coords.latitude,
							lng: position.coords.longitude,
						}

						window.map.setCenter(pos)
					},
					() => {
						handleLocationError(true, infoWindow, window.map.getCenter())
					}
				)
			} else {
				handleLocationError(false, infoWindow, window.map.getCenter())
			}
		})()
	}

	const searchButton = document.getElementById('search-button')
	searchButton.addEventListener('click', performSearch)

	function performSearch(event) {
		event.preventDefault()
		const query = document.getElementById('query').value
		const csrfToken = document.querySelector('meta[name="csrf-token"]').content

		fetch('/search', {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json',
				'X-CSRF-Token': csrfToken,
			},
			body: JSON.stringify({ query: query }),
		})
			.then((response) => response.json())
			.then((data) => {
				displayMarkers(data)
			})
			.catch((error) => console.log('Error:', error))
	}

	const fieldsContainer = document.querySelector('#todolists')
	fieldsContainer.addEventListener('click', (event) => {
		if (event.target.classList.contains('remove_fields')) {
			event.preventDefault()
			event.target.closest('.nested-fields').remove()
		}
	})

	function displayMarkers(data) {
		window.markers.forEach(({ markerView }) => (markerView.map = null))
		window.markers = []

		const resultsList = document.getElementById('search-result-list')
		resultsList.innerHTML = ''

		if (data.length === 0) {
			resultsList.innerHTML = '<li>一致する情報は見つかりませんでした。</li>'
			return
		}

		const bounds = new google.maps.LatLngBounds()

		data.forEach((place) => {
			const position = { lat: place.location.latitude, lng: place.location.longitude }
			const pinView = new PinView({
				scale: 1, // Default scale
			})
			const markerView = new AdvancedMarkerView({
				map: window.map,
				position: position,
				title: place.displayName.text,
				content: pinView.element,
			})

			window.markers.push({ markerView, pinView })
			bounds.extend(position)

			const listItem = document.createElement('span')
			listItem.className = 'list-group-item list-group-item-action py-3 lh-sm'

			const listItemContent = `
				<div class="d-flex w-100 align-items-center justify-content-between">
					<strong class="mb-1">${place.displayName.text}</strong>
				</div>
				<div class="col-12 mb-1 small">${place.formattedAddress}</div>
      `

			listItem.innerHTML = listItemContent
			resultsList.appendChild(listItem)

			listItem.addEventListener('mouseover', () => {
				pinView.scale = 1.5
			})
			listItem.addEventListener('mouseout', () => {
				pinView.scale = 1
			})
			// Add click event to list item to center map on marker
			listItem.addEventListener('click', () => {
				addTodolistItem(place)
			})
		})

		window.map.fitBounds(bounds)
	}

	function addTodolistItem(place) {
		const fieldsContainer = document.querySelector('#todo_lists')

		const placeholderCard = fieldsContainer.querySelector('.placeholder-card')
		if (placeholderCard) {
			placeholderCard.remove()
		}

		const newId = new Date().getTime()
		const newFieldsHtml = `
      <div class="nested-fields card mb-2">
        <div class="card-body">
          <h5 class="card-title fs-6">${place.displayName.text}</h5>
          <h6 class="card-subtitle small mb-2 text-muted">${place.formattedAddress}</h6>

          <input type="hidden" name="todo[todo_lists_attributes][${newId}][latitude]" id="todo_todo_lists_attributes_${newId}_latitude" value="${place.location.latitude}" readonly class="form-control">

        	<input type="hidden" name="todo[todo_lists_attributes][${newId}][longitude]" id="todo_todo_lists_attributes_${newId}_longitude" value="${place.location.longitude}" readonly class="form-control">

          <fieldset class="form-group">
            <label class="form-label small" for="todo_todo_lists_attributes_${newId}_details">詳細</label>
            <textarea rows="3" class="form-control" name="todo[todo_lists_attributes][${newId}][details]" id="todo_todo_lists_attributes_${newId}_details"></textarea>
          </fieldset>

					<fieldset class="form-group mt-2">
        		<label class="form-label small" for="todo_todo_lists_attributes_${newId}_image">画像アップロード</label>
        		<input type="file" class="form-control-file" name="todo[todo_lists_attributes][${newId}][image]" id="todo_todo_lists_attributes_${newId}_image" accept="image/*">
      		</fieldset>

          <span class="remove_fields btn btn-sm btn-outline-danger mt-2">削除</span>
        </div>
      </div>
    `

		fieldsContainer.insertAdjacentHTML('beforeend', newFieldsHtml)
		// Attach event to the remove button of newly added item
		fieldsContainer.querySelector('.nested-fields:last-child .remove_fields').addEventListener('click', (e) => {
			e.preventDefault()
			e.target.closest('.nested-fields').remove()

			if (fieldsContainer.children.length === 0) {
				addPlaceholderCard(fieldsContainer)
			}
		})
	}

	function addPlaceholderCard(container) {
		const placeholderHtml = `
			<div class="card mb-2 placeholder-card">
				<div class="card-body">
					<p class="card-text">リストがありません。</p>
				</div>
			</div>
		`
		container.insertAdjacentHTML('beforeend', placeholderHtml)
	}

	function handleLocationError(browserHasGeolocation, infoWindow, pos) {
		infoWindow.setPosition(pos)
		infoWindow.setContent(
			browserHasGeolocation
				? 'Error: The Geolocation service failed.'
				: "Error: Your browser doesn't support geolocation."
		)
		infoWindow.open(window.map)
	}
}

initMap()
