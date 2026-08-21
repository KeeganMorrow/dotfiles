return function()
	hl.monitor({
		output = "desc:Dell Inc. AW3423DWF JYS72S3",
		mode = "3440x1440@165",
		position = "0x0",
		scale = 1,
		bitdepth = 10,
		cm = "hdr",
		sdrbrightness = 1.0,
		sdrsaturation = 1.1,
		supports_wide_color = 1,
		supports_hdr = 1,
		sdr_min_luminance = 0.005,
		sdr_max_luminance = 300,
		min_luminance = 0,
		max_luminance = 1000,
		max_avg_luminance = 200,
	})

	hl.monitor({
		output = "HDMI-A-1",
		mode = "highres",
		position = "auto-up",
		scale = 1,
	})

	hl.monitor({
		output = "HEADLESS-2",
		disabled = true,
	})

	hl.config({
		render = {
			direct_scanout = 0,
			cm_auto_hdr = 1,
		},
	})
end
