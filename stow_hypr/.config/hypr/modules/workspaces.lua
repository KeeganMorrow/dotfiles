return function()
	hl.workspace_rule({ workspace = "1", monitor = "desc:Dell Inc. AW3423DWF JYS72S3", default = true })

	for i = 2, 5 do
		hl.workspace_rule({ workspace = tostring(i), monitor = "desc:Dell Inc. AW3423DWF JYS72S3" })
	end

	for i = 6, 10 do
		hl.workspace_rule({ workspace = tostring(i), monitor = "HDMI-A-1" })
	end
end
