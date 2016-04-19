from Windawesome import Windawesome, ProgramRule, State, OnWindowCreatedOrShownAction, OnWindowCreatedOnWorkspaceAction
from Windawesome.NativeMethods import WS, WS_EX

config.ProgramRules = [
	ProgramRule(
		className = "^TApplication$",
		displayName = "^Find and Run Robot$",
		isManaged = False
	),
	ProgramRule(
		className = "^TApplication$",
		rules = [ProgramRule.Rule(isFloating = True)]
	),
	ProgramRule(
		className = "^MozillaDialogClass$",
		rules = [ProgramRule.Rule(isFloating = True)]
	),
	# other

	ProgramRule(
		displayName = "^Windows 7 Manager - Junk File Cleaner$",
		isManaged = False
	),
	ProgramRule(
		displayName = "^Windows 7 Manager - Registry Cleaner$",
		isManaged = False
	),
	ProgramRule(
		displayName = ".*Windows 7 Manager.*",
		rules = [ProgramRule.Rule(workspace = 1)]
	),
	ProgramRule(
		className = "^MsiDialogCloseClass$",
		isManaged = False
	),
	ProgramRule(
		className = "^MsiDialogNoCloseClass$",
		isManaged = False
	),
	ProgramRule(
		className = "^\$\$\$Secure UAP Dummy Window Class For Interim Dialog$"
	),
	ProgramRule(
		className = "^#32770$", # all dialogs
		rules = [ProgramRule.Rule(isFloating = True)] # should be floating
	),
	ProgramRule(
		styleContains = WS.WS_POPUP,
		isManaged = False
	),
	ProgramRule(
		styleNotContains = WS.WS_MAXIMIZEBOX,
		rules = [ProgramRule.Rule(isFloating = True)]
	),
	ProgramRule() # an all-catching rule in the end to manage all other windows
]
