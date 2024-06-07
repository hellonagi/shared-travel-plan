async function initMap() {
	console.log('AA2')

	let map

	// The location of Uluru
	const position = { lat: -25.344, lng: 131.031 }
	// Request needed libraries.
	//@ts-ignore
	const { Map } = await google.maps.importLibrary('maps')
	const { AdvancedMarkerView } = await google.maps.importLibrary('marker')

	// The map, centered at Uluru
	map = new Map(document.getElementById('map'), {
		zoom: 4,
		center: position,
		mapId: 'DEMO_MAP_ID',
		mapTypeControl: false,
	})

	// The marker, positioned at Uluru
	const marker = new AdvancedMarkerView({
		map: map,
		position: position,
		title: 'Uluru',
	})
}

initMap()
