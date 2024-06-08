async function initMap() {
	let map, infoWindow

	// The location of Uluru
	const position = { lat: 35.681236, lng: 139.767125 }
	// Request needed libraries.
	//@ts-ignore
	const { Map } = await google.maps.importLibrary('maps')
	const { AdvancedMarkerView } = await google.maps.importLibrary('marker')

	// The map, centered at Uluru
	map = new Map(document.getElementById('map'), {
		zoom: 6,
		center: position,
		mapId: 'DEMO_MAP_ID',
		mapTypeControl: false,
		streetViewControl: false,
	})

	infoWindow = new google.maps.InfoWindow()

	{
		;(() => {
			// Try HTML5 geolocation.
			if (navigator.geolocation) {
				navigator.geolocation.getCurrentPosition(
					(position) => {
						const pos = {
							lat: position.coords.latitude,
							lng: position.coords.longitude,
						}

						map.setCenter(pos)
					},
					() => {
						handleLocationError(true, infoWindow, map.getCenter())
					}
				)
			} else {
				// Browser doesn't support Geolocation
				handleLocationError(false, infoWindow, map.getCenter())
			}
		})()
	}

	// The marker, positioned at Uluru
	// const marker = new AdvancedMarkerView({
	// 	map: map,
	// 	position: position,
	// 	title: 'Uluru',
	// })
}

function handleLocationError(browserHasGeolocation, infoWindow, pos) {
	infoWindow.setPosition(pos)
	infoWindow.setContent(
		browserHasGeolocation
			? 'Error: The Geolocation service failed.'
			: "Error: Your browser doesn't support geolocation."
	)
	infoWindow.open(map)
}

initMap()
