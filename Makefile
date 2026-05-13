compile:
	@typst compile --font-path ./assets/fonts/ ./main.typ

watch:
	@typst watch --font-path ./assets/fonts/ ./main.typ
