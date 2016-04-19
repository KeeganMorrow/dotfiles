from System.Drawing import Color, ColorTranslator, Font
from System.Linq import Enumerable
from Windawesome import ILayout, TileLayout, FullScreenLayout, FloatingLayout, IPlugin, Workspace
from Windawesome import Bar, LayoutWidget, WorkspacesWidget, ApplicationTabsWidget, SystemTrayWidget, CpuMonitorWidget, RamMonitorWidget, LaptopBatteryMonitorWidget, LanguageBarWidget, CurrentlyPlayingWidget, SeparatorWidget
from Windawesome import LoggerPlugin, ShortcutsManager, InputLanguageChangerPlugin
from Windawesome.NativeMethods import MOD
from System import Tuple
from System.Windows.Forms import Keys

def onLayoutLabelClick():
	if windawesome.CurrentWorkspace.Layout.LayoutName() == "Full Screen":
		windawesome.CurrentWorkspace.ChangeLayout(FloatingLayout())
	elif windawesome.CurrentWorkspace.Layout.LayoutName() == "Floating":
		windawesome.CurrentWorkspace.ChangeLayout(TileLayout())
	else:
		windawesome.CurrentWorkspace.ChangeLayout(FullScreenLayout())

config.WindowBorderWidth = 1
config.WindowPaddedBorderWidth = 0

config.CheckForUpdates = False

colorgreen = ColorTranslator.FromHtml("#AFFF00")
colordullgreen = ColorTranslator.FromHtml("#88AD37")
colorwhite = ColorTranslator.FromHtml("#e0e0e0")
colorblue = ColorTranslator.FromHtml("#00afff")
colordullblue = ColorTranslator.FromHtml("#3F728A")
colorbackground = ColorTranslator.FromHtml("#181818")

workspacesWidgetForegroundColors = [colorblue for i in range(0, 10)]
workspacesWidgetBackgroundColors = [colorbackground for i in range(0, 10)]

config.Bars = Enumerable.ToArray[Bar]([
	Bar(windawesome.monitors[0],
		[
			WorkspacesWidget(
				normalForegroundColor = workspacesWidgetForegroundColors,
				normalBackgroundColor = workspacesWidgetBackgroundColors,
				highlightedForegroundColor = colorgreen,
				highlightedBackgroundColor = colorbackground,
				highlightedInactiveForegroundColor = colorwhite,
				highlightedInactiveBackgroundColor = colorbackground,
				flashingForegroundColor = Color.Black
			),
			LayoutWidget(
				foregroundColor = colorgreen,
				backgroundColor = colorbackground,
				onClick = onLayoutLabelClick
			),
			SeparatorWidget(
				foregroundColor = colordullblue,
				backgroundColor = colorbackground
			),
		],

		[
			SystemTrayWidget(),
			SeparatorWidget(
				foregroundColor = colordullblue,
				backgroundColor = colorbackground
			),
			DateTimeWidget("ddd, d-MMM", "", "", colorbackground, colorblue),
			SeparatorWidget(
				foregroundColor = colordullblue,
				backgroundColor = colorbackground
			),
			DateTimeWidget("HH:mm tt", "", "", colorbackground, colorgreen),
		],

		[
			ApplicationTabsWidget(
				normalForegroundColor = colorblue,
				normalBackgroundColor = colorbackground,
				highlightedForegroundColor = colorgreen,
				highlightedBackgroundColor = colorbackground,
			)
		],

		backgroundColor = colorbackground,
		font = Font("Consolas", 11)
	),
	Bar(windawesome.monitors[1],
		[
			WorkspacesWidget(
				normalForegroundColor = workspacesWidgetForegroundColors,
				normalBackgroundColor = workspacesWidgetBackgroundColors,
				highlightedForegroundColor = colorgreen,
				highlightedBackgroundColor = colorbackground,
				highlightedInactiveForegroundColor = colordullblue,
				highlightedInactiveBackgroundColor = colorbackground,
				flashingForegroundColor = Color.Black
			),
			LayoutWidget(
				foregroundColor = colorgreen,
				backgroundColor = colorbackground,
				onClick = onLayoutLabelClick
			),
			SeparatorWidget(
				foregroundColor = colordullblue,
				backgroundColor = colorbackground
			),
		],

		[
			SeparatorWidget(
				foregroundColor = colordullblue,
				backgroundColor = colorbackground
			),
			SystemTrayWidget(),
			SeparatorWidget(
				foregroundColor = colordullblue,
				backgroundColor = colorbackground
			),
			DateTimeWidget("ddd, d-MMM", "", "", colorbackground, colorblue),
			SeparatorWidget(
				foregroundColor = colordullblue,
				backgroundColor = colorbackground
			),
			DateTimeWidget("HH:mm tt", "", "", colorbackground, colorgreen),
		],

		[
			ApplicationTabsWidget(
				normalForegroundColor = colorblue,
				normalBackgroundColor = colorbackground,
				highlightedForegroundColor = colorgreen,
				highlightedBackgroundColor = colorbackground,
			)
		],

		backgroundColor = colorbackground,
		font = Font("Consolas", 11)
	),
])

config.Workspaces = Enumerable.ToArray[Workspace]([
	Workspace(windawesome.monitors[0], TileLayout(), [config.Bars[0]]),
	Workspace(windawesome.monitors[0], TileLayout(), [config.Bars[0]]),
	Workspace(windawesome.monitors[0], TileLayout(), [config.Bars[0]]),
	Workspace(windawesome.monitors[0], TileLayout(), [config.Bars[0]]),
	Workspace(windawesome.monitors[1], TileLayout(), [config.Bars[1]]),
	Workspace(windawesome.monitors[1], TileLayout(), [config.Bars[1]]),
	Workspace(windawesome.monitors[1], TileLayout(), [config.Bars[1]]),
	Workspace(windawesome.monitors[1], TileLayout(), [config.Bars[1]]),
	Workspace(windawesome.monitors[1], TileLayout(), [config.Bars[1]]),
])

config.StartingWorkspaces = [config.Workspaces[0], config.Workspaces[4]]

config.Plugins = [
	#LoggerPlugin(logWorkspaceSwitching = True, logWindowMinimization = True, logWindowRestoration = True,
	#	logActivation = True),
	ShortcutsManager(),
]
