document.addEventListener('turbo:load', function () {
	const searchInput = document.getElementById('searchInput')
	const resultsContainer = document.getElementById('resultsContainer')
	const detailSlideSidebar = document.getElementById('detailSlideSidebar')
	let todos = []

	// 初期データを取得
	todos = Array.from(resultsContainer.children).map((todoDiv) => {
		return {
			title: todoDiv.querySelector('.card-title').textContent.trim(),
			description: todoDiv.querySelector('.description-text').textContent.trim(),
			author: todoDiv.querySelector('.author-text').textContent.trim().replace('投稿者: ', ''),
			image: todoDiv.querySelector('img') ? todoDiv.querySelector('img').src : null,
		}
	})

	function filterData(input, data) {
		const lowercasedInput = input.toLowerCase()
		return data.filter(
			(item) =>
				item.title.toLowerCase().includes(lowercasedInput) || item.description.toLowerCase().includes(lowercasedInput)
		)
	}

	function displayResults(results) {
		resultsContainer.innerHTML = '' // 以前の結果をクリア
		results.forEach((todo) => {
			const div = document.createElement('div')
			div.className = 'col-12 g-2'
			div.innerHTML = `
        <div class="card shadow-sm">
          <a href="#" class="link-opacity-75-hover detail-view">
            <div class="row g-0">
              <div class="col-md-2">
                <img src="${todo.image}" alt="${todo.title}" class="img-fluid object-fit-cover preview-img" >
	
              </div>
              <div class="col-md-10">
                <div class="card-body">
                  <h5 class="card-title mb-0">${todo.title}</h5>
                  <p class="card-text author-text">投稿者: ${todo.author}</p>
                  <p class="card-text description-text">${todo.description}</p>
                </div>
              </div>
            </div>
          </a>
        </div>
      `
			resultsContainer.appendChild(div)
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
		if (event.target.closest('.detail-view')) {
			event.preventDefault()
			console.log('Detail view clicked')
			console.log(detailSlideSidebar)
			detailSlideSidebar.classList.toggle('show')
		}
	})
})
