<?xml version='1.0' encoding='UTF-8'?>
<Project Type="Project" LVVersion="18008000">
	<Property Name="CCSymbols" Type="Str"></Property>
	<Property Name="NI.LV.All.SourceOnly" Type="Bool">true</Property>
	<Property Name="NI.Project.Description" Type="Str"></Property>
	<Item Name="My Computer" Type="My Computer">
		<Property Name="server.app.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.control.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.tcp.enabled" Type="Bool">false</Property>
		<Property Name="server.tcp.port" Type="Int">0</Property>
		<Property Name="server.tcp.serviceName" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.tcp.serviceName.default" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.vi.callsEnabled" Type="Bool">true</Property>
		<Property Name="server.vi.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="specify.custom.address" Type="Bool">false</Property>
		<Item Name="Dependencies" Type="Dependencies"/>
		<Item Name="Build Specifications" Type="Build"/>
	</Item>
	<Item Name="RT CompactRIO Target 2" Type="RT CompactRIO">
		<Property Name="alias.name" Type="Str">RT CompactRIO Target 2</Property>
		<Property Name="alias.value" Type="Str">m2-crio-simulator.ls.lsst.org</Property>
		<Property Name="CCSymbols" Type="Str">TARGET_TYPE,RT;OS,Linux;CPU,x64;DeviceCode,77B9;</Property>
		<Property Name="crio.ControllerPID" Type="Str">77B9</Property>
		<Property Name="host.ResponsivenessCheckEnabled" Type="Bool">true</Property>
		<Property Name="host.ResponsivenessCheckPingDelay" Type="UInt">5000</Property>
		<Property Name="host.ResponsivenessCheckPingTimeout" Type="UInt">1000</Property>
		<Property Name="host.TargetCPUID" Type="UInt">9</Property>
		<Property Name="host.TargetOSID" Type="UInt">19</Property>
		<Property Name="host.TargetUIEnabled" Type="Bool">true</Property>
		<Property Name="target.cleanupVisa" Type="Bool">false</Property>
		<Property Name="target.FPProtocolGlobals_ControlTimeLimit" Type="Int">300</Property>
		<Property Name="target.getDefault-&gt;WebServer.Port" Type="Int">80</Property>
		<Property Name="target.getDefault-&gt;WebServer.Timeout" Type="Int">60</Property>
		<Property Name="target.IOScan.Faults" Type="Str"></Property>
		<Property Name="target.IOScan.NetVarPeriod" Type="UInt">100</Property>
		<Property Name="target.IOScan.NetWatchdogEnabled" Type="Bool">false</Property>
		<Property Name="target.IOScan.Period" Type="UInt">10000</Property>
		<Property Name="target.IOScan.PowerupMode" Type="UInt">0</Property>
		<Property Name="target.IOScan.Priority" Type="UInt">0</Property>
		<Property Name="target.IOScan.ReportModeConflict" Type="Bool">true</Property>
		<Property Name="target.IsRemotePanelSupported" Type="Bool">true</Property>
		<Property Name="target.RTCPULoadMonitoringEnabled" Type="Bool">true</Property>
		<Property Name="target.RTDebugWebServerHTTPPort" Type="Int">8001</Property>
		<Property Name="target.RTTarget.ApplicationPath" Type="Path">/c/ni-rt/startup/startup.rtexe</Property>
		<Property Name="target.RTTarget.EnableFileSharing" Type="Bool">true</Property>
		<Property Name="target.RTTarget.IPAccess" Type="Str">+*</Property>
		<Property Name="target.RTTarget.LaunchAppAtBoot" Type="Bool">false</Property>
		<Property Name="target.RTTarget.VIPath" Type="Path">/home/lvuser/natinst/bin</Property>
		<Property Name="target.server.app.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="target.server.control.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="target.server.tcp.access" Type="Str">+*</Property>
		<Property Name="target.server.tcp.enabled" Type="Bool">false</Property>
		<Property Name="target.server.tcp.paranoid" Type="Bool">true</Property>
		<Property Name="target.server.tcp.port" Type="Int">3363</Property>
		<Property Name="target.server.tcp.serviceName" Type="Str">Main Application Instance/VI Server</Property>
		<Property Name="target.server.tcp.serviceName.default" Type="Str">Main Application Instance/VI Server</Property>
		<Property Name="target.server.vi.access" Type="Str">+*</Property>
		<Property Name="target.server.vi.callsEnabled" Type="Bool">true</Property>
		<Property Name="target.server.vi.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="target.WebServer.Config" Type="Str">Listen 8000

NI.ServerName default
DocumentRoot "$LVSERVER_DOCROOT"
TypesConfig "$LVSERVER_CONFIGROOT/mime.types"
DirectoryIndex index.htm
WorkerLimit 10
InactivityTimeout 60

LoadModulePath "$LVSERVER_MODULEPATHS"
LoadModule LVAuth lvauthmodule
LoadModule LVRFP lvrfpmodule

#
# Pipeline Definition
#

SetConnector netConnector

AddHandler LVAuth
AddHandler LVRFP

AddHandler fileHandler ""

AddOutputFilter chunkFilter


</Property>
		<Property Name="target.WebServer.Enabled" Type="Bool">false</Property>
		<Property Name="target.WebServer.LogEnabled" Type="Bool">false</Property>
		<Property Name="target.WebServer.LogPath" Type="Path">/c/ni-rt/system/www/www.log</Property>
		<Property Name="target.WebServer.Port" Type="Int">80</Property>
		<Property Name="target.WebServer.RootPath" Type="Path">/c/ni-rt/system/www</Property>
		<Property Name="target.WebServer.TcpAccess" Type="Str">c+*</Property>
		<Property Name="target.WebServer.Timeout" Type="Int">60</Property>
		<Property Name="target.WebServer.ViAccess" Type="Str">+*</Property>
		<Property Name="target.webservices.SecurityAPIKey" Type="Str">PqVr/ifkAQh+lVrdPIykXlFvg12GhhQFR8H9cUhphgg=:pTe9HRlQuMfJxAG6QCGq7UvoUpJzAzWGKy5SbZ+roSU=</Property>
		<Property Name="target.webservices.ValidTimestampWindow" Type="Int">15</Property>
		<Item Name="Chassis" Type="cRIO Chassis">
			<Property Name="crio.ProgrammingMode" Type="Str">fpga</Property>
			<Property Name="crio.ResourceID" Type="Str">RIO0</Property>
			<Property Name="crio.Type" Type="Str">cRIO-9038</Property>
			<Property Name="NI.SortType" Type="Int">3</Property>
			<Item Name="Real-Time Scan Resources" Type="Module Container">
				<Property Name="crio.ModuleContainerType" Type="Str">crio.RSIModuleContainer</Property>
			</Item>
			<Item Name="FPGA Target 2" Type="FPGA Target">
				<Property Name="AutoRun" Type="Bool">false</Property>
				<Property Name="configString.guid" Type="Str">{004B015F-BE3A-441B-B9C6-F3226AF7FF55}NumberOfSyncRegistersForReadInProject=0;resource=/USER Push Button;0;ReadMethodType=bool{011CDAAA-6ECE-4222-90A3-DBD693F92013}resource=/crio_Mod5/DI20;0;ReadMethodType=bool{0179D7B1-7BCB-4BE7-94A6-A7D96C3BEF0F}[crioConfig.Begin]crio.Calibration=1,crio.Location=Slot 5,crio.Type=NI 9426,cRIOModule.EnableDECoM=false,cRIOModule.EnableInputFifo=false,cRIOModule.EnableOutputFifo=false,cRIOModule.RsiAttributes=[crioConfig.End]{02AEF48C-7A6C-43EC-AB5D-EC756154DD41}ArbitrationForOutputData=NeverArbitrate;resource=/crio_Mod4/CH4;0;ReadMethodType=bool;WriteMethodType=bool{05A7CE30-1353-4090-99BF-C07D56D95AEC}ArbitrationForOutputData=NeverArbitrate;resource=/crio_Mod4/CH7:0;0;ReadMethodType=u8;WriteMethodType=u8{0606F5CC-2477-4CD0-AFA8-2F027971C991}resource=/crio_Mod5/DI23:16;0;ReadMethodType=u8{069AC6DB-E0DE-4944-B957-6B92B707BDDD}resource=/System Reset;0;ReadMethodType=bool;WriteMethodType=bool{0BA9CDA5-6431-4356-A561-11B17E41E94B}resource=/crio_Mod5/DI21;0;ReadMethodType=bool{122F3007-250B-4AAC-975B-D48D82054D39}ArbitrationForOutputData=NeverArbitrate;resource=/crio_Mod4/CH2;0;ReadMethodType=bool;WriteMethodType=bool{13BD2FE3-95F4-4D46-855D-2A554F68E2CA}resource=/crio_Mod5/DI14;0;ReadMethodType=bool{13C93633-0EE3-4668-ABA3-D74B217BBD04}resource=/crio_Mod5/DI6;0;ReadMethodType=bool{1B8F309F-8547-48EF-8BE5-14A89DDF95A2}resource=/crio_Mod5/DI17;0;ReadMethodType=bool{1E4E5F1B-2562-42DD-B9AD-781814F4C6D4}cRIO Subresource{21404C9E-5843-4F7B-94E3-E636C4BE9F7D}resource=/USER FPGA LED;0;ReadMethodType=u8;WriteMethodType=u8{23519F2C-B81E-47AD-9698-FDE417D0AD18}[crioConfig.Begin]crio.Calibration=1,crio.Location=Slot 3,crio.Type=NI 9221,cRIOModule.EnableDECoM=false,cRIOModule.EnableInputFifo=false,cRIOModule.EnableOutputFifo=false,cRIOModule.MinConvTime=1.250000E+0,cRIOModule.RsiAttributes=[crioConfig.End]{24F26E20-3688-49F7-8319-28E1CD40702C}resource=/Sleep;0;ReadMethodType=bool;WriteMethodType=bool{29E451A3-5381-4368-B92C-24314B90BB5E}resource=/crio_Mod5/DI5;0;ReadMethodType=bool{2B2121ED-DE2B-4C44-82C0-D42C76462025}resource=/crio_Mod2/AI2;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_5.ctl{2FF5C653-C4E1-45CE-9CBB-55D8C011032A}[crioConfig.Begin]crio.Calibration=1,crio.Location=Slot 4,crio.Type=NI 9485,cRIOModule.DIO3_0InitialDir=0,cRIOModule.DIO7_4InitialDir=0,cRIOModule.EnableDECoM=false,cRIOModule.EnableInputFifo=false,cRIOModule.EnableOutputFifo=false,cRIOModule.NumSyncRegs=11111111,cRIOModule.RsiAttributes=[crioConfig.End]{322D966C-3C83-48F6-BF92-870C7C01BE8E}resource=/crio_Mod5/DI13;0;ReadMethodType=bool{33DEE929-F54D-47FF-B275-5326EC9343C9}resource=/crio_Mod5/DI31:0;0;ReadMethodType=u32{3B8272D0-3AF4-45F6-B481-E8CC81B91B4D}cRIO Subresource{3BD197E4-5DA3-457D-AAE6-7C7C6F16B2B9}resource=/crio_Mod5/DI29;0;ReadMethodType=bool{3C0A0440-3080-40CA-8F01-A3DBB978D178}resource=/crio_Mod2/AI7;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_5.ctl{3EA3B44D-FAB8-4334-B28D-C4A370157CE0}resource=/crio_Mod5/DI18;0;ReadMethodType=bool{3ECB3FB5-3111-431E-937D-263F0290CD77}resource=/crio_Mod2/AI1;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_5.ctl{3ED3A7EF-0C49-484D-9731-1D3817495863}cRIO Subresource{41E06D8C-C2C9-4CBD-A3F7-5A11F9E02685}ArbitrationForOutputData=NeverArbitrate;resource=/crio_Mod4/CH0;0;ReadMethodType=bool;WriteMethodType=bool{43DE3956-4121-4E93-831B-D15A2B5D5A03}resource=/crio_Mod5/DI25;0;ReadMethodType=bool{482DB2AF-221A-4D72-AE3B-6B8F50C9B5D6}resource=/crio_Mod5/DI30;0;ReadMethodType=bool{48AA5A54-1071-4231-BE33-863666ACC3A2}ArbitrationForOutputData=NeverArbitrate;resource=/crio_Mod4/CH1;0;ReadMethodType=bool;WriteMethodType=bool{4FE1A194-E1B8-4BAF-B92B-F2A5AD4296DC}resource=/crio_Mod2/AI4;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_5.ctl{532F3D11-F078-4465-B596-FDB505FF1B61}resource=/crio_Mod3/AI6;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_7.ctl{540A36B6-867C-4AB4-A0EB-B53AE78E71D1}resource=/crio_Mod5/DI9;0;ReadMethodType=bool{54ED4B9F-C57F-4FF5-A256-3A9F252EF46D}resource=/crio_Mod5/DI22;0;ReadMethodType=bool{5A447B9F-F44F-4FCF-910B-D72817B358BB}resource=/crio_Mod3/AI3;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_7.ctl{5D0DFBAD-225F-42E1-ABB8-5C7636D527F2}resource=/crio_Mod3/AI5;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_7.ctl{5D9A6700-C9FF-44F3-BBAA-A1EF715BC488}resource=/crio_Mod5/DI11;0;ReadMethodType=bool{5E2C3556-3578-432C-BB5B-8DB75CBDDF2D}ResourceName=40 MHz Onboard Clock;TopSignalConnect=Clk40;ClockSignalName=Clk40;MinFreq=40000000.000000;MaxFreq=40000000.000000;VariableFreq=0;NomFreq=40000000.000000;PeakPeriodJitter=250.000000;MinDutyCycle=50.000000;MaxDutyCycle=50.000000;Accuracy=100.000000;RunTime=0;SpreadSpectrum=0;GenericDataHash=D41D8CD98F00B204E9800998ECF8427E;{61FAC051-47B1-4E65-AC52-F6184FD7FCDD}resource=/crio_Mod3/AI1;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_7.ctl{65BC2C95-CD7D-4945-952A-7D5356957210}resource=/crio_Mod2/AI5;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_5.ctl{6B24A271-DF1E-44D2-8525-526C55C2FF93}resource=/crio_Mod5/DI31:24;0;ReadMethodType=u8{6FA2617A-278A-4D8C-A5E5-944FDD9381B8}[crioConfig.Begin]crio.Calibration=1,crio.Location=Slot 2,crio.Type=NI 9201,cRIOModule.EnableDECoM=false,cRIOModule.EnableInputFifo=false,cRIOModule.EnableOutputFifo=false,cRIOModule.MinConvTime=2.000000E+0,cRIOModule.RsiAttributes=[crioConfig.End]{71A559B7-611B-496C-A37B-C0B933B03AC0}[crioConfig.Begin]crio.Calibration=1,crio.Location=Slot 1,crio.Type=NI 9871,cRIOModule.EnableDECoM=false,cRIOModule.EnableInputFifo=false,cRIOModule.EnableOutputFifo=false,cRIOModule.kBaudRateDivider1=384,cRIOModule.kBaudRateDivider2=384,cRIOModule.kBaudRateDivider3=384,cRIOModule.kBaudRateDivider4=384,cRIOModule.kBaudRatePrescaler1=1,cRIOModule.kBaudRatePrescaler2=1,cRIOModule.kBaudRatePrescaler3=1,cRIOModule.kBaudRatePrescaler4=1,cRIOModule.kDataBits1=4,cRIOModule.kDataBits2=4,cRIOModule.kDataBits3=4,cRIOModule.kDataBits4=4,cRIOModule.kDesiredBaudRate1=9.600000E+3,cRIOModule.kDesiredBaudRate2=9.600000E+3,cRIOModule.kDesiredBaudRate3=9.600000E+3,cRIOModule.kDesiredBaudRate4=9.600000E+3,cRIOModule.kFlowControl1=1,cRIOModule.kFlowControl2=1,cRIOModule.kFlowControl3=1,cRIOModule.kFlowControl4=1,cRIOModule.kParity1=1,cRIOModule.kParity2=1,cRIOModule.kParity3=1,cRIOModule.kParity4=1,cRIOModule.kStopBits1=1,cRIOModule.kStopBits2=1,cRIOModule.kStopBits3=1,cRIOModule.kStopBits4=1,cRIOModule.kXcvrMode1="00",cRIOModule.kXcvrMode2="00",cRIOModule.kXcvrMode3="00",cRIOModule.kXcvrMode4="00",cRIOModule.RsiAttributes=[crioConfig.End]{7F505C2B-5E6E-4FCF-944A-AA21330887E5}resource=/crio_Mod3/AI7;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_7.ctl{80238802-C192-4E80-99E9-E97803CFA788}resource=/crio_Mod5/DI3;0;ReadMethodType=bool{84CA8ACD-5B18-40A3-AD21-A6FB62147FF5}resource=/crio_Mod3/AI0;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_7.ctl{8895F794-DBDC-40A0-BF89-0B8A8B57A9D2}resource=/crio_Mod5/DI12;0;ReadMethodType=bool{8EAE2827-DFDA-4092-8529-AF9C9B3E4528}resource=/crio_Mod5/DI19;0;ReadMethodType=bool{8F9ECEE1-2551-49B1-9BE6-3EAE014318DE}resource=/crio_Mod2/AI6;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_5.ctl{9FDF491C-D0A6-41CC-A2B0-F441CF2CA7D1}resource=/crio_Mod5/DI27;0;ReadMethodType=bool{AA6673C6-4ABD-48D0-BD1E-EF54CBB99C35}resource=/crio_Mod3/AI2;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_7.ctl{B1E2D4A6-4827-453E-83DF-D3C3B63B6BE5}resource=/crio_Mod5/DI2;0;ReadMethodType=bool{B37B2629-1A16-4588-907F-B9C34A8A8DC8}resource=/crio_Mod5/DI15:8;0;ReadMethodType=u8{BA212D44-C636-4EE2-82F0-BA5C737F8157}resource=/Chassis Temperature;0;ReadMethodType=i16{C09D68FA-3426-4F14-9067-BCC94EB61C1A}resource=/crio_Mod5/DI0;0;ReadMethodType=bool{C1182316-E7F5-403D-BABD-0AC51C8493F9}resource=/crio_Mod5/DI10;0;ReadMethodType=bool{C3EDA74C-E2CB-4264-A202-D373C3CEBA37}resource=/crio_Mod5/DI7:0;0;ReadMethodType=u8{C599E521-1442-443E-B86B-C5B9ED7C5A91}resource=/crio_Mod5/DI7;0;ReadMethodType=bool{C5ECBCBF-2152-4CC6-849E-927DE1F289DA}resource=/crio_Mod5/DI24;0;ReadMethodType=bool{C601E21A-1CFD-48AA-A19B-BE182C209644}resource=/crio_Mod5/DI23;0;ReadMethodType=bool{C6355A02-63A6-49D3-8BD3-1C516C98626B}resource=/crio_Mod5/DI31;0;ReadMethodType=bool{C652400E-4C17-4870-932C-8BFAC34CC234}resource=/crio_Mod3/AI4;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_7.ctl{D3D02AB5-9CD2-49AC-A20C-42FF0F7535DD}ArbitrationForOutputData=NeverArbitrate;resource=/crio_Mod4/CH6;0;ReadMethodType=bool;WriteMethodType=bool{D82B914C-1D93-4B2D-A04A-EFBCC7A10DEE}ArbitrationForOutputData=NeverArbitrate;resource=/crio_Mod4/CH5;0;ReadMethodType=bool;WriteMethodType=bool{D82D578D-FD5B-4649-9081-F8D85082C6D2}resource=/crio_Mod2/AI3;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_5.ctl{DCCA2B3E-A8FD-4F88-BF5F-CC6ECA80E366}resource=/Scan Clock;0;ReadMethodType=bool{E12B60C3-5CD6-4CFF-91AC-06F9B560C2B5}ArbitrationForOutputData=NeverArbitrate;resource=/crio_Mod4/CH7;0;ReadMethodType=bool;WriteMethodType=bool{E1F40C41-50F6-4434-9C62-D3C3308F1044}resource=/crio_Mod2/AI0;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_5.ctl{E37572E0-256D-42FB-A2C8-5D19E8984D9F}resource=/crio_Mod5/DI28;0;ReadMethodType=bool{E7F0DCB0-83CF-48DC-AD07-3893FD9F3DF6}resource=/crio_Mod5/DI4;0;ReadMethodType=bool{EC7E1687-DB65-4D36-87F3-331D2F943DE0}resource=/crio_Mod5/DI15;0;ReadMethodType=bool{F0DFA0C2-77F5-4F76-B746-73E7E8A7B591}resource=/crio_Mod5/DI26;0;ReadMethodType=bool{F234D700-8414-4E8D-9FC3-BE3DFFF098A1}cRIO Subresource{F531DD71-0028-4A99-9587-618455202243}resource=/crio_Mod5/DI8;0;ReadMethodType=bool{F76EFE46-3FDD-43D2-B1F8-33797D1EFC31}resource=/crio_Mod5/DI16;0;ReadMethodType=bool{F7CE8479-41A7-48A8-AB41-56EF379362B2}ArbitrationForOutputData=NeverArbitrate;resource=/crio_Mod4/CH3;0;ReadMethodType=bool;WriteMethodType=bool{FDE2FDE3-9F8F-4997-97DC-ECF51A365D6F}resource=/crio_Mod5/DI1;0;ReadMethodType=boolcRIO-9038/Clk40/falsefalseFPGA_EXECUTION_MODEFPGA_TARGETFPGA_TARGET_CLASSCRIO_9038FPGA_TARGET_FAMILYKINTEX7TARGET_TYPEFPGA/[rSeriesConfig.Begin][rSeriesConfig.End]</Property>
				<Property Name="configString.name" Type="Str">40 MHz Onboard ClockResourceName=40 MHz Onboard Clock;TopSignalConnect=Clk40;ClockSignalName=Clk40;MinFreq=40000000.000000;MaxFreq=40000000.000000;VariableFreq=0;NomFreq=40000000.000000;PeakPeriodJitter=250.000000;MinDutyCycle=50.000000;MaxDutyCycle=50.000000;Accuracy=100.000000;RunTime=0;SpreadSpectrum=0;GenericDataHash=D41D8CD98F00B204E9800998ECF8427E;Chassis Temperatureresource=/Chassis Temperature;0;ReadMethodType=i16cRIO-9038/Clk40/falsefalseFPGA_EXECUTION_MODEFPGA_TARGETFPGA_TARGET_CLASSCRIO_9038FPGA_TARGET_FAMILYKINTEX7TARGET_TYPEFPGA/[rSeriesConfig.Begin][rSeriesConfig.End]Mod1[crioConfig.Begin]crio.Calibration=1,crio.Location=Slot 1,crio.Type=NI 9871,cRIOModule.EnableDECoM=false,cRIOModule.EnableInputFifo=false,cRIOModule.EnableOutputFifo=false,cRIOModule.kBaudRateDivider1=384,cRIOModule.kBaudRateDivider2=384,cRIOModule.kBaudRateDivider3=384,cRIOModule.kBaudRateDivider4=384,cRIOModule.kBaudRatePrescaler1=1,cRIOModule.kBaudRatePrescaler2=1,cRIOModule.kBaudRatePrescaler3=1,cRIOModule.kBaudRatePrescaler4=1,cRIOModule.kDataBits1=4,cRIOModule.kDataBits2=4,cRIOModule.kDataBits3=4,cRIOModule.kDataBits4=4,cRIOModule.kDesiredBaudRate1=9.600000E+3,cRIOModule.kDesiredBaudRate2=9.600000E+3,cRIOModule.kDesiredBaudRate3=9.600000E+3,cRIOModule.kDesiredBaudRate4=9.600000E+3,cRIOModule.kFlowControl1=1,cRIOModule.kFlowControl2=1,cRIOModule.kFlowControl3=1,cRIOModule.kFlowControl4=1,cRIOModule.kParity1=1,cRIOModule.kParity2=1,cRIOModule.kParity3=1,cRIOModule.kParity4=1,cRIOModule.kStopBits1=1,cRIOModule.kStopBits2=1,cRIOModule.kStopBits3=1,cRIOModule.kStopBits4=1,cRIOModule.kXcvrMode1="00",cRIOModule.kXcvrMode2="00",cRIOModule.kXcvrMode3="00",cRIOModule.kXcvrMode4="00",cRIOModule.RsiAttributes=[crioConfig.End]Mod2/AI0resource=/crio_Mod2/AI0;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_5.ctlMod2/AI1resource=/crio_Mod2/AI1;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_5.ctlMod2/AI2resource=/crio_Mod2/AI2;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_5.ctlMod2/AI3resource=/crio_Mod2/AI3;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_5.ctlMod2/AI4resource=/crio_Mod2/AI4;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_5.ctlMod2/AI5resource=/crio_Mod2/AI5;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_5.ctlMod2/AI6resource=/crio_Mod2/AI6;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_5.ctlMod2/AI7resource=/crio_Mod2/AI7;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_5.ctlMod2[crioConfig.Begin]crio.Calibration=1,crio.Location=Slot 2,crio.Type=NI 9201,cRIOModule.EnableDECoM=false,cRIOModule.EnableInputFifo=false,cRIOModule.EnableOutputFifo=false,cRIOModule.MinConvTime=2.000000E+0,cRIOModule.RsiAttributes=[crioConfig.End]Mod3/AI0resource=/crio_Mod3/AI0;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_7.ctlMod3/AI1resource=/crio_Mod3/AI1;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_7.ctlMod3/AI2resource=/crio_Mod3/AI2;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_7.ctlMod3/AI3resource=/crio_Mod3/AI3;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_7.ctlMod3/AI4resource=/crio_Mod3/AI4;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_7.ctlMod3/AI5resource=/crio_Mod3/AI5;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_7.ctlMod3/AI6resource=/crio_Mod3/AI6;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_7.ctlMod3/AI7resource=/crio_Mod3/AI7;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_7.ctlMod3[crioConfig.Begin]crio.Calibration=1,crio.Location=Slot 3,crio.Type=NI 9221,cRIOModule.EnableDECoM=false,cRIOModule.EnableInputFifo=false,cRIOModule.EnableOutputFifo=false,cRIOModule.MinConvTime=1.250000E+0,cRIOModule.RsiAttributes=[crioConfig.End]Mod4/CH0ArbitrationForOutputData=NeverArbitrate;resource=/crio_Mod4/CH0;0;ReadMethodType=bool;WriteMethodType=boolMod4/CH1ArbitrationForOutputData=NeverArbitrate;resource=/crio_Mod4/CH1;0;ReadMethodType=bool;WriteMethodType=boolMod4/CH2ArbitrationForOutputData=NeverArbitrate;resource=/crio_Mod4/CH2;0;ReadMethodType=bool;WriteMethodType=boolMod4/CH3ArbitrationForOutputData=NeverArbitrate;resource=/crio_Mod4/CH3;0;ReadMethodType=bool;WriteMethodType=boolMod4/CH4ArbitrationForOutputData=NeverArbitrate;resource=/crio_Mod4/CH4;0;ReadMethodType=bool;WriteMethodType=boolMod4/CH5ArbitrationForOutputData=NeverArbitrate;resource=/crio_Mod4/CH5;0;ReadMethodType=bool;WriteMethodType=boolMod4/CH6ArbitrationForOutputData=NeverArbitrate;resource=/crio_Mod4/CH6;0;ReadMethodType=bool;WriteMethodType=boolMod4/CH7:0ArbitrationForOutputData=NeverArbitrate;resource=/crio_Mod4/CH7:0;0;ReadMethodType=u8;WriteMethodType=u8Mod4/CH7ArbitrationForOutputData=NeverArbitrate;resource=/crio_Mod4/CH7;0;ReadMethodType=bool;WriteMethodType=boolMod4[crioConfig.Begin]crio.Calibration=1,crio.Location=Slot 4,crio.Type=NI 9485,cRIOModule.DIO3_0InitialDir=0,cRIOModule.DIO7_4InitialDir=0,cRIOModule.EnableDECoM=false,cRIOModule.EnableInputFifo=false,cRIOModule.EnableOutputFifo=false,cRIOModule.NumSyncRegs=11111111,cRIOModule.RsiAttributes=[crioConfig.End]Mod5/DI0resource=/crio_Mod5/DI0;0;ReadMethodType=boolMod5/DI10resource=/crio_Mod5/DI10;0;ReadMethodType=boolMod5/DI11resource=/crio_Mod5/DI11;0;ReadMethodType=boolMod5/DI12resource=/crio_Mod5/DI12;0;ReadMethodType=boolMod5/DI13resource=/crio_Mod5/DI13;0;ReadMethodType=boolMod5/DI14resource=/crio_Mod5/DI14;0;ReadMethodType=boolMod5/DI15:8resource=/crio_Mod5/DI15:8;0;ReadMethodType=u8Mod5/DI15resource=/crio_Mod5/DI15;0;ReadMethodType=boolMod5/DI16resource=/crio_Mod5/DI16;0;ReadMethodType=boolMod5/DI17resource=/crio_Mod5/DI17;0;ReadMethodType=boolMod5/DI18resource=/crio_Mod5/DI18;0;ReadMethodType=boolMod5/DI19resource=/crio_Mod5/DI19;0;ReadMethodType=boolMod5/DI1resource=/crio_Mod5/DI1;0;ReadMethodType=boolMod5/DI20resource=/crio_Mod5/DI20;0;ReadMethodType=boolMod5/DI21resource=/crio_Mod5/DI21;0;ReadMethodType=boolMod5/DI22resource=/crio_Mod5/DI22;0;ReadMethodType=boolMod5/DI23:16resource=/crio_Mod5/DI23:16;0;ReadMethodType=u8Mod5/DI23resource=/crio_Mod5/DI23;0;ReadMethodType=boolMod5/DI24resource=/crio_Mod5/DI24;0;ReadMethodType=boolMod5/DI25resource=/crio_Mod5/DI25;0;ReadMethodType=boolMod5/DI26resource=/crio_Mod5/DI26;0;ReadMethodType=boolMod5/DI27resource=/crio_Mod5/DI27;0;ReadMethodType=boolMod5/DI28resource=/crio_Mod5/DI28;0;ReadMethodType=boolMod5/DI29resource=/crio_Mod5/DI29;0;ReadMethodType=boolMod5/DI2resource=/crio_Mod5/DI2;0;ReadMethodType=boolMod5/DI30resource=/crio_Mod5/DI30;0;ReadMethodType=boolMod5/DI31:0resource=/crio_Mod5/DI31:0;0;ReadMethodType=u32Mod5/DI31:24resource=/crio_Mod5/DI31:24;0;ReadMethodType=u8Mod5/DI31resource=/crio_Mod5/DI31;0;ReadMethodType=boolMod5/DI3resource=/crio_Mod5/DI3;0;ReadMethodType=boolMod5/DI4resource=/crio_Mod5/DI4;0;ReadMethodType=boolMod5/DI5resource=/crio_Mod5/DI5;0;ReadMethodType=boolMod5/DI6resource=/crio_Mod5/DI6;0;ReadMethodType=boolMod5/DI7:0resource=/crio_Mod5/DI7:0;0;ReadMethodType=u8Mod5/DI7resource=/crio_Mod5/DI7;0;ReadMethodType=boolMod5/DI8resource=/crio_Mod5/DI8;0;ReadMethodType=boolMod5/DI9resource=/crio_Mod5/DI9;0;ReadMethodType=boolMod5[crioConfig.Begin]crio.Calibration=1,crio.Location=Slot 5,crio.Type=NI 9426,cRIOModule.EnableDECoM=false,cRIOModule.EnableInputFifo=false,cRIOModule.EnableOutputFifo=false,cRIOModule.RsiAttributes=[crioConfig.End]Port1cRIO SubresourcePort2cRIO SubresourcePort3cRIO SubresourcePort4cRIO SubresourceScan Clockresource=/Scan Clock;0;ReadMethodType=boolSleepresource=/Sleep;0;ReadMethodType=bool;WriteMethodType=boolSystem Resetresource=/System Reset;0;ReadMethodType=bool;WriteMethodType=boolUSER FPGA LEDresource=/USER FPGA LED;0;ReadMethodType=u8;WriteMethodType=u8USER Push ButtonNumberOfSyncRegistersForReadInProject=0;resource=/USER Push Button;0;ReadMethodType=bool</Property>
				<Property Name="NI.LV.FPGA.CompileConfigString" Type="Str">cRIO-9038/Clk40/falsefalseFPGA_EXECUTION_MODEFPGA_TARGETFPGA_TARGET_CLASSCRIO_9038FPGA_TARGET_FAMILYKINTEX7TARGET_TYPEFPGA</Property>
				<Property Name="NI.LV.FPGA.Version" Type="Int">6</Property>
				<Property Name="Resource Name" Type="Str">RIO0</Property>
				<Property Name="Target Class" Type="Str">cRIO-9038</Property>
				<Property Name="Top-Level Timing Source" Type="Str">40 MHz Onboard Clock</Property>
				<Property Name="Top-Level Timing Source Is Default" Type="Bool">true</Property>
				<Item Name="Chassis I/O" Type="Folder">
					<Item Name="Chassis Temperature" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/Chassis Temperature</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{BA212D44-C636-4EE2-82F0-BA5C737F8157}</Property>
					</Item>
					<Item Name="Sleep" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/Sleep</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{24F26E20-3688-49F7-8319-28E1CD40702C}</Property>
					</Item>
					<Item Name="System Reset" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/System Reset</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{069AC6DB-E0DE-4944-B957-6B92B707BDDD}</Property>
					</Item>
					<Item Name="USER FPGA LED" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/USER FPGA LED</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{21404C9E-5843-4F7B-94E3-E636C4BE9F7D}</Property>
					</Item>
					<Item Name="USER Push Button" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="NumberOfSyncRegistersForReadInProject">
   <Value>0</Value>
   </Attribute>
   <Attribute name="resource">
   <Value>/USER Push Button</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{004B015F-BE3A-441B-B9C6-F3226AF7FF55}</Property>
					</Item>
					<Item Name="Scan Clock" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/Scan Clock</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{DCCA2B3E-A8FD-4F88-BF5F-CC6ECA80E366}</Property>
					</Item>
				</Item>
				<Item Name="Mod2" Type="Folder">
					<Item Name="Mod2/AI0" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod2/AI0</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{E1F40C41-50F6-4434-9C62-D3C3308F1044}</Property>
					</Item>
					<Item Name="Mod2/AI1" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod2/AI1</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{3ECB3FB5-3111-431E-937D-263F0290CD77}</Property>
					</Item>
					<Item Name="Mod2/AI2" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod2/AI2</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{2B2121ED-DE2B-4C44-82C0-D42C76462025}</Property>
					</Item>
					<Item Name="Mod2/AI3" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod2/AI3</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{D82D578D-FD5B-4649-9081-F8D85082C6D2}</Property>
					</Item>
					<Item Name="Mod2/AI4" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod2/AI4</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{4FE1A194-E1B8-4BAF-B92B-F2A5AD4296DC}</Property>
					</Item>
					<Item Name="Mod2/AI5" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod2/AI5</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{65BC2C95-CD7D-4945-952A-7D5356957210}</Property>
					</Item>
					<Item Name="Mod2/AI6" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod2/AI6</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{8F9ECEE1-2551-49B1-9BE6-3EAE014318DE}</Property>
					</Item>
					<Item Name="Mod2/AI7" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod2/AI7</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{3C0A0440-3080-40CA-8F01-A3DBB978D178}</Property>
					</Item>
				</Item>
				<Item Name="Mod3" Type="Folder">
					<Item Name="Mod3/AI0" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod3/AI0</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{84CA8ACD-5B18-40A3-AD21-A6FB62147FF5}</Property>
					</Item>
					<Item Name="Mod3/AI1" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod3/AI1</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{61FAC051-47B1-4E65-AC52-F6184FD7FCDD}</Property>
					</Item>
					<Item Name="Mod3/AI2" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod3/AI2</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{AA6673C6-4ABD-48D0-BD1E-EF54CBB99C35}</Property>
					</Item>
					<Item Name="Mod3/AI3" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod3/AI3</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{5A447B9F-F44F-4FCF-910B-D72817B358BB}</Property>
					</Item>
					<Item Name="Mod3/AI4" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod3/AI4</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{C652400E-4C17-4870-932C-8BFAC34CC234}</Property>
					</Item>
					<Item Name="Mod3/AI5" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod3/AI5</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{5D0DFBAD-225F-42E1-ABB8-5C7636D527F2}</Property>
					</Item>
					<Item Name="Mod3/AI6" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod3/AI6</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{532F3D11-F078-4465-B596-FDB505FF1B61}</Property>
					</Item>
					<Item Name="Mod3/AI7" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod3/AI7</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{7F505C2B-5E6E-4FCF-944A-AA21330887E5}</Property>
					</Item>
				</Item>
				<Item Name="Mod4" Type="Folder">
					<Item Name="Mod4/CH0" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="ArbitrationForOutputData">
   <Value>NeverArbitrate</Value>
   </Attribute>
   <Attribute name="resource">
   <Value>/crio_Mod4/CH0</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{41E06D8C-C2C9-4CBD-A3F7-5A11F9E02685}</Property>
					</Item>
					<Item Name="Mod4/CH1" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="ArbitrationForOutputData">
   <Value>NeverArbitrate</Value>
   </Attribute>
   <Attribute name="resource">
   <Value>/crio_Mod4/CH1</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{48AA5A54-1071-4231-BE33-863666ACC3A2}</Property>
					</Item>
					<Item Name="Mod4/CH2" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="ArbitrationForOutputData">
   <Value>NeverArbitrate</Value>
   </Attribute>
   <Attribute name="resource">
   <Value>/crio_Mod4/CH2</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{122F3007-250B-4AAC-975B-D48D82054D39}</Property>
					</Item>
					<Item Name="Mod4/CH3" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="ArbitrationForOutputData">
   <Value>NeverArbitrate</Value>
   </Attribute>
   <Attribute name="resource">
   <Value>/crio_Mod4/CH3</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{F7CE8479-41A7-48A8-AB41-56EF379362B2}</Property>
					</Item>
					<Item Name="Mod4/CH4" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="ArbitrationForOutputData">
   <Value>NeverArbitrate</Value>
   </Attribute>
   <Attribute name="resource">
   <Value>/crio_Mod4/CH4</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{02AEF48C-7A6C-43EC-AB5D-EC756154DD41}</Property>
					</Item>
					<Item Name="Mod4/CH5" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="ArbitrationForOutputData">
   <Value>NeverArbitrate</Value>
   </Attribute>
   <Attribute name="resource">
   <Value>/crio_Mod4/CH5</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{D82B914C-1D93-4B2D-A04A-EFBCC7A10DEE}</Property>
					</Item>
					<Item Name="Mod4/CH6" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="ArbitrationForOutputData">
   <Value>NeverArbitrate</Value>
   </Attribute>
   <Attribute name="resource">
   <Value>/crio_Mod4/CH6</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{D3D02AB5-9CD2-49AC-A20C-42FF0F7535DD}</Property>
					</Item>
					<Item Name="Mod4/CH7" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="ArbitrationForOutputData">
   <Value>NeverArbitrate</Value>
   </Attribute>
   <Attribute name="resource">
   <Value>/crio_Mod4/CH7</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{E12B60C3-5CD6-4CFF-91AC-06F9B560C2B5}</Property>
					</Item>
					<Item Name="Mod4/CH7:0" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="ArbitrationForOutputData">
   <Value>NeverArbitrate</Value>
   </Attribute>
   <Attribute name="resource">
   <Value>/crio_Mod4/CH7:0</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{05A7CE30-1353-4090-99BF-C07D56D95AEC}</Property>
					</Item>
				</Item>
				<Item Name="Mod5" Type="Folder">
					<Item Name="Mod5/DI0" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod5/DI0</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{C09D68FA-3426-4F14-9067-BCC94EB61C1A}</Property>
					</Item>
					<Item Name="Mod5/DI1" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod5/DI1</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{FDE2FDE3-9F8F-4997-97DC-ECF51A365D6F}</Property>
					</Item>
					<Item Name="Mod5/DI2" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod5/DI2</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{B1E2D4A6-4827-453E-83DF-D3C3B63B6BE5}</Property>
					</Item>
					<Item Name="Mod5/DI3" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod5/DI3</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{80238802-C192-4E80-99E9-E97803CFA788}</Property>
					</Item>
					<Item Name="Mod5/DI4" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod5/DI4</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{E7F0DCB0-83CF-48DC-AD07-3893FD9F3DF6}</Property>
					</Item>
					<Item Name="Mod5/DI5" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod5/DI5</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{29E451A3-5381-4368-B92C-24314B90BB5E}</Property>
					</Item>
					<Item Name="Mod5/DI6" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod5/DI6</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{13C93633-0EE3-4668-ABA3-D74B217BBD04}</Property>
					</Item>
					<Item Name="Mod5/DI7" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod5/DI7</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{C599E521-1442-443E-B86B-C5B9ED7C5A91}</Property>
					</Item>
					<Item Name="Mod5/DI8" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod5/DI8</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{F531DD71-0028-4A99-9587-618455202243}</Property>
					</Item>
					<Item Name="Mod5/DI9" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod5/DI9</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{540A36B6-867C-4AB4-A0EB-B53AE78E71D1}</Property>
					</Item>
					<Item Name="Mod5/DI10" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod5/DI10</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{C1182316-E7F5-403D-BABD-0AC51C8493F9}</Property>
					</Item>
					<Item Name="Mod5/DI11" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod5/DI11</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{5D9A6700-C9FF-44F3-BBAA-A1EF715BC488}</Property>
					</Item>
					<Item Name="Mod5/DI12" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod5/DI12</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{8895F794-DBDC-40A0-BF89-0B8A8B57A9D2}</Property>
					</Item>
					<Item Name="Mod5/DI13" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod5/DI13</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{322D966C-3C83-48F6-BF92-870C7C01BE8E}</Property>
					</Item>
					<Item Name="Mod5/DI14" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod5/DI14</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{13BD2FE3-95F4-4D46-855D-2A554F68E2CA}</Property>
					</Item>
					<Item Name="Mod5/DI15" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod5/DI15</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{EC7E1687-DB65-4D36-87F3-331D2F943DE0}</Property>
					</Item>
					<Item Name="Mod5/DI16" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod5/DI16</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{F76EFE46-3FDD-43D2-B1F8-33797D1EFC31}</Property>
					</Item>
					<Item Name="Mod5/DI17" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod5/DI17</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{1B8F309F-8547-48EF-8BE5-14A89DDF95A2}</Property>
					</Item>
					<Item Name="Mod5/DI18" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod5/DI18</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{3EA3B44D-FAB8-4334-B28D-C4A370157CE0}</Property>
					</Item>
					<Item Name="Mod5/DI19" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod5/DI19</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{8EAE2827-DFDA-4092-8529-AF9C9B3E4528}</Property>
					</Item>
					<Item Name="Mod5/DI20" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod5/DI20</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{011CDAAA-6ECE-4222-90A3-DBD693F92013}</Property>
					</Item>
					<Item Name="Mod5/DI21" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod5/DI21</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{0BA9CDA5-6431-4356-A561-11B17E41E94B}</Property>
					</Item>
					<Item Name="Mod5/DI22" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod5/DI22</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{54ED4B9F-C57F-4FF5-A256-3A9F252EF46D}</Property>
					</Item>
					<Item Name="Mod5/DI23" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod5/DI23</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{C601E21A-1CFD-48AA-A19B-BE182C209644}</Property>
					</Item>
					<Item Name="Mod5/DI24" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod5/DI24</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{C5ECBCBF-2152-4CC6-849E-927DE1F289DA}</Property>
					</Item>
					<Item Name="Mod5/DI25" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod5/DI25</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{43DE3956-4121-4E93-831B-D15A2B5D5A03}</Property>
					</Item>
					<Item Name="Mod5/DI26" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod5/DI26</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{F0DFA0C2-77F5-4F76-B746-73E7E8A7B591}</Property>
					</Item>
					<Item Name="Mod5/DI27" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod5/DI27</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{9FDF491C-D0A6-41CC-A2B0-F441CF2CA7D1}</Property>
					</Item>
					<Item Name="Mod5/DI28" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod5/DI28</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{E37572E0-256D-42FB-A2C8-5D19E8984D9F}</Property>
					</Item>
					<Item Name="Mod5/DI29" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod5/DI29</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{3BD197E4-5DA3-457D-AAE6-7C7C6F16B2B9}</Property>
					</Item>
					<Item Name="Mod5/DI30" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod5/DI30</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{482DB2AF-221A-4D72-AE3B-6B8F50C9B5D6}</Property>
					</Item>
					<Item Name="Mod5/DI31" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod5/DI31</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{C6355A02-63A6-49D3-8BD3-1C516C98626B}</Property>
					</Item>
					<Item Name="Mod5/DI7:0" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod5/DI7:0</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{C3EDA74C-E2CB-4264-A202-D373C3CEBA37}</Property>
					</Item>
					<Item Name="Mod5/DI15:8" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod5/DI15:8</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{B37B2629-1A16-4588-907F-B9C34A8A8DC8}</Property>
					</Item>
					<Item Name="Mod5/DI23:16" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod5/DI23:16</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{0606F5CC-2477-4CD0-AFA8-2F027971C991}</Property>
					</Item>
					<Item Name="Mod5/DI31:24" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod5/DI31:24</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{6B24A271-DF1E-44D2-8525-526C55C2FF93}</Property>
					</Item>
					<Item Name="Mod5/DI31:0" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/crio_Mod5/DI31:0</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{33DEE929-F54D-47FF-B275-5326EC9343C9}</Property>
					</Item>
				</Item>
				<Item Name="support" Type="Folder">
					<Item Name="switchRelays.vi" Type="VI" URL="../support/switchRelays.vi">
						<Property Name="configString.guid" Type="Str">{07BE36F4-6930-459F-964D-1A93E7FCCB5B}resource=/crio_Mod3/AI0;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_7.ctl{0A3BE2DD-F28B-463E-96AE-4FEA09D078C0}resource=/crio_Mod5/DI24;0;ReadMethodType=bool{0BE2840C-3B2F-4C7C-B442-F37CB0F9D90C}resource=/crio_Mod5/DI31:24;0;ReadMethodType=u8{0C6FB378-FDD8-4789-B0B2-8B50242789F5}NumberOfSyncRegistersForReadInProject=Auto;resource=/10 MHz Timebase;0;ReadMethodType=bool{103D94E5-3133-411A-9F9A-097915048529}resource=/crio_Mod5/DI1;0;ReadMethodType=bool{13F25249-1D8A-4285-A11B-C8A0821C1DF6}NumberOfSyncRegistersForReadInProject=0;resource=/USER Push Button;0;ReadMethodType=bool{1985A612-B715-4D35-9CCD-9F8D70F25EF1}NumberOfSyncRegistersForReadInProject=Auto;resource=/cRIO_Trig/cRIO_Trig6;0;ReadMethodType=bool{1A8DFCC5-C86C-4177-8D73-62F4BB343BD8}NumberOfSyncRegistersForReadInProject=Auto;resource=/cRIO_Trig/cRIO_Trig5;0;ReadMethodType=bool{1CC059A3-AE8B-457F-96F2-7FE550FF511F}NumberOfSyncRegistersForReadInProject=Auto;resource=/13.1072 MHz Timebase;0;ReadMethodType=bool{1D830AF2-6427-4042-9BD5-AF2CF2349285}resource=/crio_Mod5/DI10;0;ReadMethodType=bool{2690615A-B76D-4B99-98C4-2272C04BB52F}resource=/Sleep;0;ReadMethodType=bool;WriteMethodType=bool{2698245A-67EE-4105-80A3-6C3CD98DF63A}resource=/crio_Mod5/DI15:8;0;ReadMethodType=u8{29128A41-98F4-46D5-90A4-B10AD37F65D4}resource=/crio_Mod5/DI11;0;ReadMethodType=bool{30AE44D1-7B41-42D8-B854-D079D22C6335}resource=/crio_Mod5/DI30;0;ReadMethodType=bool{338F491D-298E-4694-BFDA-15009CD187E4}resource=/crio_Mod5/DI7;0;ReadMethodType=bool{34852955-19B5-49C1-9FC7-63B8056C2BB6}resource=/crio_Mod3/AI7;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_7.ctl{35397F0B-1C47-4CA1-940C-013FC6E2576E}NumberOfSyncRegistersForReadInProject=Auto;resource=/cRIO_Trig/cRIO_Trig7;0;ReadMethodType=bool{373155B4-CC43-4414-8084-BDF2D8CA7B83}resource=/Reset RT App;0;WriteMethodType=bool{377D8929-9604-438F-8320-4643A4EC9AEB}ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/cRIO_Trig/cRIO_Trig3;0;ReadMethodType=bool;WriteMethodType=bool{38E91B56-7102-41A6-9011-39CDAB19433E}NumberOfSyncRegistersForReadInProject=Auto;resource=/12.8 MHz Timebase;0;ReadMethodType=bool{398454E8-8D6E-47C3-8385-80AF429D0D39}ArbitrationForOutputData=NeverArbitrate;resource=/crio_Mod4/CH5;0;ReadMethodType=bool;WriteMethodType=bool{3CDDCA4E-82E6-4525-890E-FEFFDE65E8C4}resource=/crio_Mod5/DI20;0;ReadMethodType=bool{3D40F447-2927-4877-9508-1E1CE045CEBB}ArbitrationForOutputData=NeverArbitrate;resource=/crio_Mod4/CH4;0;ReadMethodType=bool;WriteMethodType=bool{3DA777AF-9760-4A21-AF0C-C6F7AAF23F73}resource=/crio_Mod5/DI19;0;ReadMethodType=bool{3DC1128B-55AD-4C76-9D27-D4C3864DCF94}NumberOfSyncRegistersForReadInProject=0;resource=/Time Synchronization/Offset from Time Reference Valid;0;ReadMethodType=bool{42A85D65-F76B-4CBD-9225-3665E29A597F}resource=/crio_Mod5/DI8;0;ReadMethodType=bool{44B148F1-A766-49E4-829C-EEFCB16D3855}resource=/crio_Mod5/DI3;0;ReadMethodType=bool{4555D928-F0AB-4322-ADC9-E550F184EB9C}resource=/Scan Clock;0;ReadMethodType=bool{458C6695-539F-4B26-AF92-685F60A7F4B5}ArbitrationForOutputData=NeverArbitrate;resource=/crio_Mod4/CH0;0;ReadMethodType=bool;WriteMethodType=bool{45A3DD2F-249F-4F8E-AC3A-7D63D6E76ADE}resource=/USER FPGA LED;0;ReadMethodType=u8;WriteMethodType=u8{48512B21-B3E3-458B-B0B7-786DA44649D5}NumberOfSyncRegistersForReadInProject=0;resource=/Time Synchronization/Time;0;ReadMethodType=u64{4D0B5847-0F0F-4B27-A098-B53BE96A55C4}resource=/crio_Mod3/AI4;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_7.ctl{4D1446D8-FC1C-4072-B3A7-174D932A134D}resource=/crio_Mod2/AI1;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_5.ctl{4E377ABD-6515-48B5-9621-0490D7B80A4D}cRIO Subresource{4E451828-A6ED-4720-AA14-023F718B3A0D}resource=/crio_Mod5/DI31;0;ReadMethodType=bool{5171CCD7-B8D9-41F1-9AC1-12D85F67DAD9}[crioConfig.Begin]crio.Calibration=1,crio.Location=Slot 3,crio.Type=NI 9221,cRIOModule.EnableDECoM=false,cRIOModule.EnableInputFifo=false,cRIOModule.EnableOutputFifo=false,cRIOModule.MinConvTime=1.250000E+0,cRIOModule.RsiAttributes=[crioConfig.End]{52CBDBDC-6AB6-4AF5-8CDB-2D2F95849834}[crioConfig.Begin]crio.Calibration=1,crio.Location=Slot 4,crio.Type=NI 9485,cRIOModule.DIO3_0InitialDir=0,cRIOModule.DIO7_4InitialDir=0,cRIOModule.EnableDECoM=false,cRIOModule.EnableInputFifo=false,cRIOModule.EnableOutputFifo=false,cRIOModule.NumSyncRegs=11111111,cRIOModule.RsiAttributes=[crioConfig.End]{5637EC4C-C072-41C4-911D-B1C93DB6FD00}resource=/crio_Mod5/DI4;0;ReadMethodType=bool{581DA688-A8FF-4075-BB32-2DB41B891B6B}resource=/crio_Mod5/DI21;0;ReadMethodType=bool{58E4BF50-781F-4AD8-BCFB-AC67ECA07AD6}resource=/crio_Mod2/AI2;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_5.ctl{5BB20251-0DCD-4DEB-AF9A-537AEA0B4910}resource=/crio_Mod5/DI2;0;ReadMethodType=bool{6007CA61-ED33-4745-8DF4-5B4E4A5533F1}resource=/crio_Mod2/AI0;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_5.ctl{622BA54D-DAA8-48BB-9505-16A084852FAB}resource=/crio_Mod3/AI3;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_7.ctl{65418DE8-B27D-4921-9979-5051602614CA}resource=/crio_Mod5/DI15;0;ReadMethodType=bool{6ADB5D2B-B0D2-4774-8DEC-E1410DB1F858}ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/cRIO_Trig/cRIO_Trig2;0;ReadMethodType=bool;WriteMethodType=bool{6D9F1E36-4D89-4170-87C9-3B4FD6D55F39}resource=/System Reset;0;ReadMethodType=bool;WriteMethodType=bool{6E35E8AD-03BD-4CFB-B503-9FA3FA3F5EF6}cRIO Subresource{6EBD048F-2539-4E95-8E88-6CD35DC57200}ArbitrationForOutputData=NeverArbitrate;resource=/crio_Mod4/CH2;0;ReadMethodType=bool;WriteMethodType=bool{6F8F8192-36AB-4796-9B64-351954E49582}resource=/crio_Mod3/AI1;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_7.ctl{71C308B5-36DE-49C9-AD97-94DE6CD5721B}NumberOfSyncRegistersForReadInProject=0;resource=/Time Synchronization/Time Synchronization Fault;0;ReadMethodType=bool{7B4B2389-568F-4B1A-9216-3541B5F91909}resource=/crio_Mod3/AI2;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_7.ctl{808DECA9-A90E-44F5-8A6E-2DDBED217363}resource=/crio_Mod5/DI18;0;ReadMethodType=bool{849AFF2A-DA0E-4D8B-AEA9-F9F06DC07D42}resource=/crio_Mod2/AI6;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_5.ctl{9121807E-77FE-46A2-911B-75B269A965E0}NumberOfSyncRegistersForReadInProject=Auto;resource=/System Watchdog Expired;0;ReadMethodType=bool{91651A4D-77F7-4243-B492-A4024F89E8FD}ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/cRIO_Trig/cRIO_Trig0;0;ReadMethodType=bool;WriteMethodType=bool{92C675CF-60D7-4903-8B79-A3A1FA537A29}resource=/Chassis Temperature;0;ReadMethodType=i16{93C55EA5-4E76-40F7-B81A-415CF9DF7064}ArbitrationForOutputData=NeverArbitrate;resource=/crio_Mod4/CH7:0;0;ReadMethodType=u8;WriteMethodType=u8{988165A4-371C-4F6E-B966-5171EDE6265E}resource=/crio_Mod5/DI25;0;ReadMethodType=bool{9CDCFB5C-7675-47D4-A992-416A6FC100BB}ArbitrationForOutputData=NeverArbitrate;resource=/crio_Mod4/CH7;0;ReadMethodType=bool;WriteMethodType=bool{A0F5DCBA-7F64-4D8A-8DD7-1168A6245C07}resource=/crio_Mod5/DI7:0;0;ReadMethodType=u8{A6DED70B-551E-4A5C-A87C-CF5077844840}[crioConfig.Begin]crio.Calibration=1,crio.Location=Slot 5,crio.Type=NI 9426,cRIOModule.EnableDECoM=false,cRIOModule.EnableInputFifo=false,cRIOModule.EnableOutputFifo=false,cRIOModule.RsiAttributes=[crioConfig.End]{AB49FCD8-644A-4C08-8205-F1DB6B9ECE8E}resource=/crio_Mod5/DI23;0;ReadMethodType=bool{AC537FE1-30FD-4C30-BB09-7566A118E2D3}resource=/crio_Mod5/DI17;0;ReadMethodType=bool{AEF602F2-F4F7-4475-8A42-F59798986D7B}cRIO Subresource{B4B9DC09-9BBA-4D35-ACE0-3BA780FD4E07}ArbitrationForOutputData=NeverArbitrate;resource=/crio_Mod4/CH6;0;ReadMethodType=bool;WriteMethodType=bool{B73977C5-5A63-421B-8F1A-AFF21216B501}resource=/crio_Mod5/DI31:0;0;ReadMethodType=u32{B845AED2-3D51-456A-A1CC-CE260D729537}ResourceName=40 MHz Onboard Clock;TopSignalConnect=Clk40;ClockSignalName=Clk40;MinFreq=40000000.000000;MaxFreq=40000000.000000;VariableFreq=0;NomFreq=40000000.000000;PeakPeriodJitter=250.000000;MinDutyCycle=50.000000;MaxDutyCycle=50.000000;Accuracy=100.000000;RunTime=0;SpreadSpectrum=0;GenericDataHash=D41D8CD98F00B204E9800998ECF8427E;{BAF27065-4CE8-4F3F-8E1D-7E47A798935B}resource=/crio_Mod5/DI6;0;ReadMethodType=bool{BB1282D5-70F8-4C33-B57E-BE81259266E3}[crioConfig.Begin]crio.Calibration=1,crio.Location=Slot 1,crio.Type=NI 9871,cRIOModule.EnableDECoM=false,cRIOModule.EnableInputFifo=false,cRIOModule.EnableOutputFifo=false,cRIOModule.kBaudRateDivider1=384,cRIOModule.kBaudRateDivider2=384,cRIOModule.kBaudRateDivider3=384,cRIOModule.kBaudRateDivider4=384,cRIOModule.kBaudRatePrescaler1=1,cRIOModule.kBaudRatePrescaler2=1,cRIOModule.kBaudRatePrescaler3=1,cRIOModule.kBaudRatePrescaler4=1,cRIOModule.kDataBits1=4,cRIOModule.kDataBits2=4,cRIOModule.kDataBits3=4,cRIOModule.kDataBits4=4,cRIOModule.kDesiredBaudRate1=9.600000E+3,cRIOModule.kDesiredBaudRate2=9.600000E+3,cRIOModule.kDesiredBaudRate3=9.600000E+3,cRIOModule.kDesiredBaudRate4=9.600000E+3,cRIOModule.kFlowControl1=1,cRIOModule.kFlowControl2=1,cRIOModule.kFlowControl3=1,cRIOModule.kFlowControl4=1,cRIOModule.kParity1=1,cRIOModule.kParity2=1,cRIOModule.kParity3=1,cRIOModule.kParity4=1,cRIOModule.kStopBits1=1,cRIOModule.kStopBits2=1,cRIOModule.kStopBits3=1,cRIOModule.kStopBits4=1,cRIOModule.kXcvrMode1="00",cRIOModule.kXcvrMode2="00",cRIOModule.kXcvrMode3="00",cRIOModule.kXcvrMode4="00",cRIOModule.RsiAttributes=[crioConfig.End]{BC792471-C18E-44E0-8296-D8300484E0FA}NumberOfSyncRegistersForReadInProject=Auto;resource=/cRIO_Trig/cRIO_Trig4;0;ReadMethodType=bool{C0820684-BFF6-48DB-9EA8-1367C06BF193}resource=/crio_Mod5/DI26;0;ReadMethodType=bool{C0BCB917-DDDB-4F7D-9349-6ACC713F84DD}resource=/crio_Mod5/DI27;0;ReadMethodType=bool{C4283DF2-33C1-4839-807A-F609CE2BAE40}ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/cRIO_Trig/cRIO_Trig1;0;ReadMethodType=bool;WriteMethodType=bool{C972C507-BEB0-4BB8-834D-DCCB19C130FA}NumberOfSyncRegistersForReadInProject=0;resource=/Time Synchronization/Time Source;0;ReadMethodType=Targets\NI\FPGA\RIO\CompactRIO\Sync\SyncSource.ctl{CBB36285-7164-4785-961C-9E101EE7ADBC}resource=/crio_Mod2/AI3;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_5.ctl{CE303A7D-4B78-4D85-B973-D780C7F00928}resource=/crio_Mod5/DI13;0;ReadMethodType=bool{D1B62B97-FDA6-4915-A512-97BBC59B83A2}ArbitrationForOutputData=NeverArbitrate;resource=/crio_Mod4/CH1;0;ReadMethodType=bool;WriteMethodType=bool{D2879FBE-429C-4B86-B8D1-3CF68ACA6B65}resource=/crio_Mod5/DI16;0;ReadMethodType=bool{D7795476-E26A-4025-81FF-7CB69D763592}resource=/crio_Mod2/AI7;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_5.ctl{D898E4D9-FA91-4A48-8981-B067E9FB928C}resource=/crio_Mod5/DI12;0;ReadMethodType=bool{DA2872AF-A41D-4F5E-B9EE-0E382FC7C70A}resource=/crio_Mod2/AI4;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_5.ctl{DCFC7AFC-7313-4A40-82FC-58E6486850C3}resource=/crio_Mod5/DI29;0;ReadMethodType=bool{E0DD7B0F-0D23-44D0-B094-B93D3C875F43}resource=/crio_Mod2/AI5;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_5.ctl{E1DEC011-324B-4DD2-9AA7-F5D11C6AB29C}resource=/crio_Mod5/DI9;0;ReadMethodType=bool{E39C84E2-B31F-40F7-8FDA-40F76EE77827}resource=/crio_Mod5/DI28;0;ReadMethodType=bool{E59F0A2C-83D2-40F8-8933-E13CF24231A2}resource=/crio_Mod3/AI6;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_7.ctl{E7E27111-1C21-4040-A19D-FF4570B41831}NumberOfSyncRegistersForReadInProject=0;resource=/Time Synchronization/Offset from Time Reference;0;ReadMethodType=i32{E9D00AE5-6DD9-4FA2-87C2-D540ECA7CAD4}resource=/crio_Mod3/AI5;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_7.ctl{ECB861CD-A7D2-4FC7-9230-CD15AB835DC9}resource=/crio_Mod5/DI23:16;0;ReadMethodType=u8{EE54E2FC-43A4-4989-9F09-3B0BF6D0373D}resource=/crio_Mod5/DI0;0;ReadMethodType=bool{F0CE3E4F-4282-47B7-976F-FD6F8FF01AC6}resource=/crio_Mod5/DI5;0;ReadMethodType=bool{F3F4C908-8BE9-4BB1-87CE-A9CBEE0654C0}[crioConfig.Begin]crio.Calibration=1,crio.Location=Slot 2,crio.Type=NI 9201,cRIOModule.EnableDECoM=false,cRIOModule.EnableInputFifo=false,cRIOModule.EnableOutputFifo=false,cRIOModule.MinConvTime=2.000000E+0,cRIOModule.RsiAttributes=[crioConfig.End]{F46D18E7-7BAD-4CAC-BB79-5930E2B27B51}resource=/crio_Mod5/DI14;0;ReadMethodType=bool{F4C9041B-732C-4D33-8B6D-F935CE4C12B7}cRIO Subresource{F71F9839-1784-4187-819B-D230A921FFC3}ArbitrationForOutputData=NeverArbitrate;resource=/crio_Mod4/CH3;0;ReadMethodType=bool;WriteMethodType=bool{F87BF149-2F0F-43B1-B332-232F1C5515D1}resource=/crio_Mod5/DI22;0;ReadMethodType=boolcRIO-9049/Clk40/falsefalseFPGA_EXECUTION_MODEFPGA_TARGETFPGA_TARGET_CLASSCRIO_9049FPGA_TARGET_FAMILYKINTEX7TARGET_TYPEFPGA/[rSeriesConfig.Begin][rSeriesConfig.End]</Property>
						<Property Name="configString.name" Type="Str">10 MHz TimebaseNumberOfSyncRegistersForReadInProject=Auto;resource=/10 MHz Timebase;0;ReadMethodType=bool12.8 MHz TimebaseNumberOfSyncRegistersForReadInProject=Auto;resource=/12.8 MHz Timebase;0;ReadMethodType=bool13.1072 MHz TimebaseNumberOfSyncRegistersForReadInProject=Auto;resource=/13.1072 MHz Timebase;0;ReadMethodType=bool40 MHz Onboard ClockResourceName=40 MHz Onboard Clock;TopSignalConnect=Clk40;ClockSignalName=Clk40;MinFreq=40000000.000000;MaxFreq=40000000.000000;VariableFreq=0;NomFreq=40000000.000000;PeakPeriodJitter=250.000000;MinDutyCycle=50.000000;MaxDutyCycle=50.000000;Accuracy=100.000000;RunTime=0;SpreadSpectrum=0;GenericDataHash=D41D8CD98F00B204E9800998ECF8427E;Chassis Temperatureresource=/Chassis Temperature;0;ReadMethodType=i16cRIO_Trig0ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/cRIO_Trig/cRIO_Trig0;0;ReadMethodType=bool;WriteMethodType=boolcRIO_Trig1ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/cRIO_Trig/cRIO_Trig1;0;ReadMethodType=bool;WriteMethodType=boolcRIO_Trig2ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/cRIO_Trig/cRIO_Trig2;0;ReadMethodType=bool;WriteMethodType=boolcRIO_Trig3ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/cRIO_Trig/cRIO_Trig3;0;ReadMethodType=bool;WriteMethodType=boolcRIO_Trig4NumberOfSyncRegistersForReadInProject=Auto;resource=/cRIO_Trig/cRIO_Trig4;0;ReadMethodType=boolcRIO_Trig5NumberOfSyncRegistersForReadInProject=Auto;resource=/cRIO_Trig/cRIO_Trig5;0;ReadMethodType=boolcRIO_Trig6NumberOfSyncRegistersForReadInProject=Auto;resource=/cRIO_Trig/cRIO_Trig6;0;ReadMethodType=boolcRIO_Trig7NumberOfSyncRegistersForReadInProject=Auto;resource=/cRIO_Trig/cRIO_Trig7;0;ReadMethodType=boolcRIO-9049/Clk40/falsefalseFPGA_EXECUTION_MODEFPGA_TARGETFPGA_TARGET_CLASSCRIO_9049FPGA_TARGET_FAMILYKINTEX7TARGET_TYPEFPGA/[rSeriesConfig.Begin][rSeriesConfig.End]Mod1[crioConfig.Begin]crio.Calibration=1,crio.Location=Slot 1,crio.Type=NI 9871,cRIOModule.EnableDECoM=false,cRIOModule.EnableInputFifo=false,cRIOModule.EnableOutputFifo=false,cRIOModule.kBaudRateDivider1=384,cRIOModule.kBaudRateDivider2=384,cRIOModule.kBaudRateDivider3=384,cRIOModule.kBaudRateDivider4=384,cRIOModule.kBaudRatePrescaler1=1,cRIOModule.kBaudRatePrescaler2=1,cRIOModule.kBaudRatePrescaler3=1,cRIOModule.kBaudRatePrescaler4=1,cRIOModule.kDataBits1=4,cRIOModule.kDataBits2=4,cRIOModule.kDataBits3=4,cRIOModule.kDataBits4=4,cRIOModule.kDesiredBaudRate1=9.600000E+3,cRIOModule.kDesiredBaudRate2=9.600000E+3,cRIOModule.kDesiredBaudRate3=9.600000E+3,cRIOModule.kDesiredBaudRate4=9.600000E+3,cRIOModule.kFlowControl1=1,cRIOModule.kFlowControl2=1,cRIOModule.kFlowControl3=1,cRIOModule.kFlowControl4=1,cRIOModule.kParity1=1,cRIOModule.kParity2=1,cRIOModule.kParity3=1,cRIOModule.kParity4=1,cRIOModule.kStopBits1=1,cRIOModule.kStopBits2=1,cRIOModule.kStopBits3=1,cRIOModule.kStopBits4=1,cRIOModule.kXcvrMode1="00",cRIOModule.kXcvrMode2="00",cRIOModule.kXcvrMode3="00",cRIOModule.kXcvrMode4="00",cRIOModule.RsiAttributes=[crioConfig.End]Mod2/AI0resource=/crio_Mod2/AI0;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_5.ctlMod2/AI1resource=/crio_Mod2/AI1;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_5.ctlMod2/AI2resource=/crio_Mod2/AI2;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_5.ctlMod2/AI3resource=/crio_Mod2/AI3;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_5.ctlMod2/AI4resource=/crio_Mod2/AI4;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_5.ctlMod2/AI5resource=/crio_Mod2/AI5;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_5.ctlMod2/AI6resource=/crio_Mod2/AI6;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_5.ctlMod2/AI7resource=/crio_Mod2/AI7;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_5.ctlMod2[crioConfig.Begin]crio.Calibration=1,crio.Location=Slot 2,crio.Type=NI 9201,cRIOModule.EnableDECoM=false,cRIOModule.EnableInputFifo=false,cRIOModule.EnableOutputFifo=false,cRIOModule.MinConvTime=2.000000E+0,cRIOModule.RsiAttributes=[crioConfig.End]Mod3/AI0resource=/crio_Mod3/AI0;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_7.ctlMod3/AI1resource=/crio_Mod3/AI1;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_7.ctlMod3/AI2resource=/crio_Mod3/AI2;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_7.ctlMod3/AI3resource=/crio_Mod3/AI3;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_7.ctlMod3/AI4resource=/crio_Mod3/AI4;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_7.ctlMod3/AI5resource=/crio_Mod3/AI5;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_7.ctlMod3/AI6resource=/crio_Mod3/AI6;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_7.ctlMod3/AI7resource=/crio_Mod3/AI7;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_7.ctlMod3[crioConfig.Begin]crio.Calibration=1,crio.Location=Slot 3,crio.Type=NI 9221,cRIOModule.EnableDECoM=false,cRIOModule.EnableInputFifo=false,cRIOModule.EnableOutputFifo=false,cRIOModule.MinConvTime=1.250000E+0,cRIOModule.RsiAttributes=[crioConfig.End]Mod4/CH0ArbitrationForOutputData=NeverArbitrate;resource=/crio_Mod4/CH0;0;ReadMethodType=bool;WriteMethodType=boolMod4/CH1ArbitrationForOutputData=NeverArbitrate;resource=/crio_Mod4/CH1;0;ReadMethodType=bool;WriteMethodType=boolMod4/CH2ArbitrationForOutputData=NeverArbitrate;resource=/crio_Mod4/CH2;0;ReadMethodType=bool;WriteMethodType=boolMod4/CH3ArbitrationForOutputData=NeverArbitrate;resource=/crio_Mod4/CH3;0;ReadMethodType=bool;WriteMethodType=boolMod4/CH4ArbitrationForOutputData=NeverArbitrate;resource=/crio_Mod4/CH4;0;ReadMethodType=bool;WriteMethodType=boolMod4/CH5ArbitrationForOutputData=NeverArbitrate;resource=/crio_Mod4/CH5;0;ReadMethodType=bool;WriteMethodType=boolMod4/CH6ArbitrationForOutputData=NeverArbitrate;resource=/crio_Mod4/CH6;0;ReadMethodType=bool;WriteMethodType=boolMod4/CH7:0ArbitrationForOutputData=NeverArbitrate;resource=/crio_Mod4/CH7:0;0;ReadMethodType=u8;WriteMethodType=u8Mod4/CH7ArbitrationForOutputData=NeverArbitrate;resource=/crio_Mod4/CH7;0;ReadMethodType=bool;WriteMethodType=boolMod4[crioConfig.Begin]crio.Calibration=1,crio.Location=Slot 4,crio.Type=NI 9485,cRIOModule.DIO3_0InitialDir=0,cRIOModule.DIO7_4InitialDir=0,cRIOModule.EnableDECoM=false,cRIOModule.EnableInputFifo=false,cRIOModule.EnableOutputFifo=false,cRIOModule.NumSyncRegs=11111111,cRIOModule.RsiAttributes=[crioConfig.End]Mod5/DI0resource=/crio_Mod5/DI0;0;ReadMethodType=boolMod5/DI10resource=/crio_Mod5/DI10;0;ReadMethodType=boolMod5/DI11resource=/crio_Mod5/DI11;0;ReadMethodType=boolMod5/DI12resource=/crio_Mod5/DI12;0;ReadMethodType=boolMod5/DI13resource=/crio_Mod5/DI13;0;ReadMethodType=boolMod5/DI14resource=/crio_Mod5/DI14;0;ReadMethodType=boolMod5/DI15:8resource=/crio_Mod5/DI15:8;0;ReadMethodType=u8Mod5/DI15resource=/crio_Mod5/DI15;0;ReadMethodType=boolMod5/DI16resource=/crio_Mod5/DI16;0;ReadMethodType=boolMod5/DI17resource=/crio_Mod5/DI17;0;ReadMethodType=boolMod5/DI18resource=/crio_Mod5/DI18;0;ReadMethodType=boolMod5/DI19resource=/crio_Mod5/DI19;0;ReadMethodType=boolMod5/DI1resource=/crio_Mod5/DI1;0;ReadMethodType=boolMod5/DI20resource=/crio_Mod5/DI20;0;ReadMethodType=boolMod5/DI21resource=/crio_Mod5/DI21;0;ReadMethodType=boolMod5/DI22resource=/crio_Mod5/DI22;0;ReadMethodType=boolMod5/DI23:16resource=/crio_Mod5/DI23:16;0;ReadMethodType=u8Mod5/DI23resource=/crio_Mod5/DI23;0;ReadMethodType=boolMod5/DI24resource=/crio_Mod5/DI24;0;ReadMethodType=boolMod5/DI25resource=/crio_Mod5/DI25;0;ReadMethodType=boolMod5/DI26resource=/crio_Mod5/DI26;0;ReadMethodType=boolMod5/DI27resource=/crio_Mod5/DI27;0;ReadMethodType=boolMod5/DI28resource=/crio_Mod5/DI28;0;ReadMethodType=boolMod5/DI29resource=/crio_Mod5/DI29;0;ReadMethodType=boolMod5/DI2resource=/crio_Mod5/DI2;0;ReadMethodType=boolMod5/DI30resource=/crio_Mod5/DI30;0;ReadMethodType=boolMod5/DI31:0resource=/crio_Mod5/DI31:0;0;ReadMethodType=u32Mod5/DI31:24resource=/crio_Mod5/DI31:24;0;ReadMethodType=u8Mod5/DI31resource=/crio_Mod5/DI31;0;ReadMethodType=boolMod5/DI3resource=/crio_Mod5/DI3;0;ReadMethodType=boolMod5/DI4resource=/crio_Mod5/DI4;0;ReadMethodType=boolMod5/DI5resource=/crio_Mod5/DI5;0;ReadMethodType=boolMod5/DI6resource=/crio_Mod5/DI6;0;ReadMethodType=boolMod5/DI7:0resource=/crio_Mod5/DI7:0;0;ReadMethodType=u8Mod5/DI7resource=/crio_Mod5/DI7;0;ReadMethodType=boolMod5/DI8resource=/crio_Mod5/DI8;0;ReadMethodType=boolMod5/DI9resource=/crio_Mod5/DI9;0;ReadMethodType=boolMod5[crioConfig.Begin]crio.Calibration=1,crio.Location=Slot 5,crio.Type=NI 9426,cRIOModule.EnableDECoM=false,cRIOModule.EnableInputFifo=false,cRIOModule.EnableOutputFifo=false,cRIOModule.RsiAttributes=[crioConfig.End]Offset from Time Reference ValidNumberOfSyncRegistersForReadInProject=0;resource=/Time Synchronization/Offset from Time Reference Valid;0;ReadMethodType=boolOffset from Time ReferenceNumberOfSyncRegistersForReadInProject=0;resource=/Time Synchronization/Offset from Time Reference;0;ReadMethodType=i32Port1cRIO SubresourcePort2cRIO SubresourcePort3cRIO SubresourcePort4cRIO SubresourceReset RT Appresource=/Reset RT App;0;WriteMethodType=boolScan Clockresource=/Scan Clock;0;ReadMethodType=boolSleepresource=/Sleep;0;ReadMethodType=bool;WriteMethodType=boolSystem Resetresource=/System Reset;0;ReadMethodType=bool;WriteMethodType=boolSystem Watchdog ExpiredNumberOfSyncRegistersForReadInProject=Auto;resource=/System Watchdog Expired;0;ReadMethodType=boolTime SourceNumberOfSyncRegistersForReadInProject=0;resource=/Time Synchronization/Time Source;0;ReadMethodType=Targets\NI\FPGA\RIO\CompactRIO\Sync\SyncSource.ctlTime Synchronization FaultNumberOfSyncRegistersForReadInProject=0;resource=/Time Synchronization/Time Synchronization Fault;0;ReadMethodType=boolTimeNumberOfSyncRegistersForReadInProject=0;resource=/Time Synchronization/Time;0;ReadMethodType=u64USER FPGA LEDresource=/USER FPGA LED;0;ReadMethodType=u8;WriteMethodType=u8USER Push ButtonNumberOfSyncRegistersForReadInProject=0;resource=/USER Push Button;0;ReadMethodType=bool</Property>
					</Item>
				</Item>
				<Item Name="40 MHz Onboard Clock" Type="FPGA Base Clock">
					<Property Name="FPGA.PersistentID" Type="Str">{5E2C3556-3578-432C-BB5B-8DB75CBDDF2D}</Property>
					<Property Name="NI.LV.FPGA.BaseTSConfig" Type="Str">ResourceName=40 MHz Onboard Clock;TopSignalConnect=Clk40;ClockSignalName=Clk40;MinFreq=40000000.000000;MaxFreq=40000000.000000;VariableFreq=0;NomFreq=40000000.000000;PeakPeriodJitter=250.000000;MinDutyCycle=50.000000;MaxDutyCycle=50.000000;Accuracy=100.000000;RunTime=0;SpreadSpectrum=0;GenericDataHash=D41D8CD98F00B204E9800998ECF8427E;</Property>
					<Property Name="NI.LV.FPGA.BaseTSConfig.Accuracy" Type="Dbl">100</Property>
					<Property Name="NI.LV.FPGA.BaseTSConfig.ClockSignalName" Type="Str">Clk40</Property>
					<Property Name="NI.LV.FPGA.BaseTSConfig.MaxDutyCycle" Type="Dbl">50</Property>
					<Property Name="NI.LV.FPGA.BaseTSConfig.MaxFrequency" Type="Dbl">40000000</Property>
					<Property Name="NI.LV.FPGA.BaseTSConfig.MinDutyCycle" Type="Dbl">50</Property>
					<Property Name="NI.LV.FPGA.BaseTSConfig.MinFrequency" Type="Dbl">40000000</Property>
					<Property Name="NI.LV.FPGA.BaseTSConfig.NominalFrequency" Type="Dbl">40000000</Property>
					<Property Name="NI.LV.FPGA.BaseTSConfig.PeakPeriodJitter" Type="Dbl">250</Property>
					<Property Name="NI.LV.FPGA.BaseTSConfig.ResourceName" Type="Str">40 MHz Onboard Clock</Property>
					<Property Name="NI.LV.FPGA.BaseTSConfig.SupportAndRequireRuntimeEnableDisable" Type="Bool">false</Property>
					<Property Name="NI.LV.FPGA.BaseTSConfig.TopSignalConnect" Type="Str">Clk40</Property>
					<Property Name="NI.LV.FPGA.BaseTSConfig.VariableFrequency" Type="Bool">false</Property>
					<Property Name="NI.LV.FPGA.Valid" Type="Bool">true</Property>
					<Property Name="NI.LV.FPGA.Version" Type="Int">5</Property>
				</Item>
				<Item Name="IP Builder" Type="IP Builder Target">
					<Item Name="Dependencies" Type="Dependencies"/>
					<Item Name="Build Specifications" Type="Build"/>
				</Item>
				<Item Name="Mod1" Type="RIO C Series Module">
					<Property Name="crio.Calibration" Type="Str">1</Property>
					<Property Name="crio.Location" Type="Str">Slot 1</Property>
					<Property Name="crio.RequiresValidation" Type="Bool">false</Property>
					<Property Name="crio.SDcounterSlaveChannelMask" Type="Str">0</Property>
					<Property Name="crio.SDCounterSlaveMasterSlot" Type="Str">0</Property>
					<Property Name="crio.SDInputFilter" Type="Str">128</Property>
					<Property Name="crio.SupportsDynamicRes" Type="Bool">false</Property>
					<Property Name="crio.Type" Type="Str">NI 9871</Property>
					<Property Name="cRIOModule.DigitalIOMode" Type="Str">0</Property>
					<Property Name="cRIOModule.EnableSpecialtyDigital" Type="Str">false</Property>
					<Property Name="cRIOModule.kBaudRateDivider1" Type="Str">384</Property>
					<Property Name="cRIOModule.kBaudRateDivider2" Type="Str">384</Property>
					<Property Name="cRIOModule.kBaudRateDivider3" Type="Str">384</Property>
					<Property Name="cRIOModule.kBaudRateDivider4" Type="Str">384</Property>
					<Property Name="cRIOModule.kBaudRatePrescaler1" Type="Str">1</Property>
					<Property Name="cRIOModule.kBaudRatePrescaler2" Type="Str">1</Property>
					<Property Name="cRIOModule.kBaudRatePrescaler3" Type="Str">1</Property>
					<Property Name="cRIOModule.kBaudRatePrescaler4" Type="Str">1</Property>
					<Property Name="cRIOModule.kDataBits1" Type="Str">4</Property>
					<Property Name="cRIOModule.kDataBits2" Type="Str">4</Property>
					<Property Name="cRIOModule.kDataBits3" Type="Str">4</Property>
					<Property Name="cRIOModule.kDataBits4" Type="Str">4</Property>
					<Property Name="cRIOModule.kDesiredBaudRate1" Type="Str">9.600000E+3</Property>
					<Property Name="cRIOModule.kDesiredBaudRate2" Type="Str">9.600000E+3</Property>
					<Property Name="cRIOModule.kDesiredBaudRate3" Type="Str">9.600000E+3</Property>
					<Property Name="cRIOModule.kDesiredBaudRate4" Type="Str">9.600000E+3</Property>
					<Property Name="cRIOModule.kFlowControl1" Type="Str">1</Property>
					<Property Name="cRIOModule.kFlowControl2" Type="Str">1</Property>
					<Property Name="cRIOModule.kFlowControl3" Type="Str">1</Property>
					<Property Name="cRIOModule.kFlowControl4" Type="Str">1</Property>
					<Property Name="cRIOModule.kParity1" Type="Str">1</Property>
					<Property Name="cRIOModule.kParity2" Type="Str">1</Property>
					<Property Name="cRIOModule.kParity3" Type="Str">1</Property>
					<Property Name="cRIOModule.kParity4" Type="Str">1</Property>
					<Property Name="cRIOModule.kStopBits1" Type="Str">1</Property>
					<Property Name="cRIOModule.kStopBits2" Type="Str">1</Property>
					<Property Name="cRIOModule.kStopBits3" Type="Str">1</Property>
					<Property Name="cRIOModule.kStopBits4" Type="Str">1</Property>
					<Property Name="cRIOModule.kXcvrMode1" Type="Str">"00"</Property>
					<Property Name="cRIOModule.kXcvrMode2" Type="Str">"00"</Property>
					<Property Name="cRIOModule.kXcvrMode3" Type="Str">"00"</Property>
					<Property Name="cRIOModule.kXcvrMode4" Type="Str">"00"</Property>
					<Property Name="FPGA.PersistentID" Type="Str">{71A559B7-611B-496C-A37B-C0B933B03AC0}</Property>
					<Item Name="Port1" Type="RIO Subresource">
						<Property Name="FPGA.PersistentID" Type="Str">{1E4E5F1B-2562-42DD-B9AD-781814F4C6D4}</Property>
					</Item>
					<Item Name="Port2" Type="RIO Subresource">
						<Property Name="FPGA.PersistentID" Type="Str">{3B8272D0-3AF4-45F6-B481-E8CC81B91B4D}</Property>
					</Item>
					<Item Name="Port3" Type="RIO Subresource">
						<Property Name="FPGA.PersistentID" Type="Str">{F234D700-8414-4E8D-9FC3-BE3DFFF098A1}</Property>
					</Item>
					<Item Name="Port4" Type="RIO Subresource">
						<Property Name="FPGA.PersistentID" Type="Str">{3ED3A7EF-0C49-484D-9731-1D3817495863}</Property>
					</Item>
				</Item>
				<Item Name="Mod2" Type="RIO C Series Module">
					<Property Name="crio.Calibration" Type="Str">1</Property>
					<Property Name="crio.Location" Type="Str">Slot 2</Property>
					<Property Name="crio.RequiresValidation" Type="Bool">false</Property>
					<Property Name="crio.SDcounterSlaveChannelMask" Type="Str">0</Property>
					<Property Name="crio.SDCounterSlaveMasterSlot" Type="Str">0</Property>
					<Property Name="crio.SDInputFilter" Type="Str">128</Property>
					<Property Name="crio.SupportsDynamicRes" Type="Bool">false</Property>
					<Property Name="crio.Type" Type="Str">NI 9201</Property>
					<Property Name="cRIOModule.DigitalIOMode" Type="Str">0</Property>
					<Property Name="cRIOModule.EnableSpecialtyDigital" Type="Str">false</Property>
					<Property Name="cRIOModule.MinConvTime" Type="Str">2.000000E+0</Property>
					<Property Name="FPGA.PersistentID" Type="Str">{6FA2617A-278A-4D8C-A5E5-944FDD9381B8}</Property>
				</Item>
				<Item Name="Mod3" Type="RIO C Series Module">
					<Property Name="crio.Calibration" Type="Str">1</Property>
					<Property Name="crio.Location" Type="Str">Slot 3</Property>
					<Property Name="crio.RequiresValidation" Type="Bool">false</Property>
					<Property Name="crio.SDcounterSlaveChannelMask" Type="Str">0</Property>
					<Property Name="crio.SDCounterSlaveMasterSlot" Type="Str">0</Property>
					<Property Name="crio.SDInputFilter" Type="Str">128</Property>
					<Property Name="crio.SupportsDynamicRes" Type="Bool">false</Property>
					<Property Name="crio.Type" Type="Str">NI 9221</Property>
					<Property Name="cRIOModule.DigitalIOMode" Type="Str">0</Property>
					<Property Name="cRIOModule.EnableSpecialtyDigital" Type="Str">false</Property>
					<Property Name="cRIOModule.MinConvTime" Type="Str">1.250000E+0</Property>
					<Property Name="FPGA.PersistentID" Type="Str">{23519F2C-B81E-47AD-9698-FDE417D0AD18}</Property>
				</Item>
				<Item Name="Mod4" Type="RIO C Series Module">
					<Property Name="crio.Calibration" Type="Str">1</Property>
					<Property Name="crio.Location" Type="Str">Slot 4</Property>
					<Property Name="crio.RequiresValidation" Type="Bool">false</Property>
					<Property Name="crio.SDcounterSlaveChannelMask" Type="Str">0</Property>
					<Property Name="crio.SDCounterSlaveMasterSlot" Type="Str">0</Property>
					<Property Name="crio.SDInputFilter" Type="Str">128</Property>
					<Property Name="crio.SupportsDynamicRes" Type="Bool">false</Property>
					<Property Name="crio.Type" Type="Str">NI 9485</Property>
					<Property Name="cRIOModule.DigitalIOMode" Type="Str">0</Property>
					<Property Name="cRIOModule.DIO3_0InitialDir" Type="Str">0</Property>
					<Property Name="cRIOModule.DIO7_4InitialDir" Type="Str">0</Property>
					<Property Name="cRIOModule.EnableSpecialtyDigital" Type="Str">false</Property>
					<Property Name="cRIOModule.NumSyncRegs" Type="Str">11111111</Property>
					<Property Name="FPGA.PersistentID" Type="Str">{2FF5C653-C4E1-45CE-9CBB-55D8C011032A}</Property>
				</Item>
				<Item Name="Mod5" Type="RIO C Series Module">
					<Property Name="crio.Calibration" Type="Str">1</Property>
					<Property Name="crio.Location" Type="Str">Slot 5</Property>
					<Property Name="crio.RequiresValidation" Type="Bool">false</Property>
					<Property Name="crio.SDcounterSlaveChannelMask" Type="Str">0</Property>
					<Property Name="crio.SDCounterSlaveMasterSlot" Type="Str">0</Property>
					<Property Name="crio.SDInputFilter" Type="Str">128</Property>
					<Property Name="crio.SupportsDynamicRes" Type="Bool">false</Property>
					<Property Name="crio.Type" Type="Str">NI 9426</Property>
					<Property Name="cRIOModule.DigitalIOMode" Type="Str">0</Property>
					<Property Name="cRIOModule.EnableSpecialtyDigital" Type="Str">false</Property>
					<Property Name="FPGA.PersistentID" Type="Str">{0179D7B1-7BCB-4BE7-94A6-A7D96C3BEF0F}</Property>
				</Item>
				<Item Name="mainFPGA.vi" Type="VI" URL="../mainFPGA.vi">
					<Property Name="BuildSpec" Type="Str">{23EBA8B8-A297-4028-83D3-E7BA26D94BF6}</Property>
					<Property Name="configString.guid" Type="Str">{07BE36F4-6930-459F-964D-1A93E7FCCB5B}resource=/crio_Mod3/AI0;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_7.ctl{0A3BE2DD-F28B-463E-96AE-4FEA09D078C0}resource=/crio_Mod5/DI24;0;ReadMethodType=bool{0BE2840C-3B2F-4C7C-B442-F37CB0F9D90C}resource=/crio_Mod5/DI31:24;0;ReadMethodType=u8{0C6FB378-FDD8-4789-B0B2-8B50242789F5}NumberOfSyncRegistersForReadInProject=Auto;resource=/10 MHz Timebase;0;ReadMethodType=bool{103D94E5-3133-411A-9F9A-097915048529}resource=/crio_Mod5/DI1;0;ReadMethodType=bool{13F25249-1D8A-4285-A11B-C8A0821C1DF6}NumberOfSyncRegistersForReadInProject=0;resource=/USER Push Button;0;ReadMethodType=bool{1985A612-B715-4D35-9CCD-9F8D70F25EF1}NumberOfSyncRegistersForReadInProject=Auto;resource=/cRIO_Trig/cRIO_Trig6;0;ReadMethodType=bool{1A8DFCC5-C86C-4177-8D73-62F4BB343BD8}NumberOfSyncRegistersForReadInProject=Auto;resource=/cRIO_Trig/cRIO_Trig5;0;ReadMethodType=bool{1CC059A3-AE8B-457F-96F2-7FE550FF511F}NumberOfSyncRegistersForReadInProject=Auto;resource=/13.1072 MHz Timebase;0;ReadMethodType=bool{1D830AF2-6427-4042-9BD5-AF2CF2349285}resource=/crio_Mod5/DI10;0;ReadMethodType=bool{2690615A-B76D-4B99-98C4-2272C04BB52F}resource=/Sleep;0;ReadMethodType=bool;WriteMethodType=bool{2698245A-67EE-4105-80A3-6C3CD98DF63A}resource=/crio_Mod5/DI15:8;0;ReadMethodType=u8{29128A41-98F4-46D5-90A4-B10AD37F65D4}resource=/crio_Mod5/DI11;0;ReadMethodType=bool{30AE44D1-7B41-42D8-B854-D079D22C6335}resource=/crio_Mod5/DI30;0;ReadMethodType=bool{338F491D-298E-4694-BFDA-15009CD187E4}resource=/crio_Mod5/DI7;0;ReadMethodType=bool{34852955-19B5-49C1-9FC7-63B8056C2BB6}resource=/crio_Mod3/AI7;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_7.ctl{35397F0B-1C47-4CA1-940C-013FC6E2576E}NumberOfSyncRegistersForReadInProject=Auto;resource=/cRIO_Trig/cRIO_Trig7;0;ReadMethodType=bool{373155B4-CC43-4414-8084-BDF2D8CA7B83}resource=/Reset RT App;0;WriteMethodType=bool{377D8929-9604-438F-8320-4643A4EC9AEB}ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/cRIO_Trig/cRIO_Trig3;0;ReadMethodType=bool;WriteMethodType=bool{38E91B56-7102-41A6-9011-39CDAB19433E}NumberOfSyncRegistersForReadInProject=Auto;resource=/12.8 MHz Timebase;0;ReadMethodType=bool{398454E8-8D6E-47C3-8385-80AF429D0D39}ArbitrationForOutputData=NeverArbitrate;resource=/crio_Mod4/CH5;0;ReadMethodType=bool;WriteMethodType=bool{3CDDCA4E-82E6-4525-890E-FEFFDE65E8C4}resource=/crio_Mod5/DI20;0;ReadMethodType=bool{3D40F447-2927-4877-9508-1E1CE045CEBB}ArbitrationForOutputData=NeverArbitrate;resource=/crio_Mod4/CH4;0;ReadMethodType=bool;WriteMethodType=bool{3DA777AF-9760-4A21-AF0C-C6F7AAF23F73}resource=/crio_Mod5/DI19;0;ReadMethodType=bool{3DC1128B-55AD-4C76-9D27-D4C3864DCF94}NumberOfSyncRegistersForReadInProject=0;resource=/Time Synchronization/Offset from Time Reference Valid;0;ReadMethodType=bool{42A85D65-F76B-4CBD-9225-3665E29A597F}resource=/crio_Mod5/DI8;0;ReadMethodType=bool{44B148F1-A766-49E4-829C-EEFCB16D3855}resource=/crio_Mod5/DI3;0;ReadMethodType=bool{4555D928-F0AB-4322-ADC9-E550F184EB9C}resource=/Scan Clock;0;ReadMethodType=bool{458C6695-539F-4B26-AF92-685F60A7F4B5}ArbitrationForOutputData=NeverArbitrate;resource=/crio_Mod4/CH0;0;ReadMethodType=bool;WriteMethodType=bool{45A3DD2F-249F-4F8E-AC3A-7D63D6E76ADE}resource=/USER FPGA LED;0;ReadMethodType=u8;WriteMethodType=u8{48512B21-B3E3-458B-B0B7-786DA44649D5}NumberOfSyncRegistersForReadInProject=0;resource=/Time Synchronization/Time;0;ReadMethodType=u64{4D0B5847-0F0F-4B27-A098-B53BE96A55C4}resource=/crio_Mod3/AI4;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_7.ctl{4D1446D8-FC1C-4072-B3A7-174D932A134D}resource=/crio_Mod2/AI1;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_5.ctl{4E377ABD-6515-48B5-9621-0490D7B80A4D}cRIO Subresource{4E451828-A6ED-4720-AA14-023F718B3A0D}resource=/crio_Mod5/DI31;0;ReadMethodType=bool{5171CCD7-B8D9-41F1-9AC1-12D85F67DAD9}[crioConfig.Begin]crio.Calibration=1,crio.Location=Slot 3,crio.Type=NI 9221,cRIOModule.EnableDECoM=false,cRIOModule.EnableInputFifo=false,cRIOModule.EnableOutputFifo=false,cRIOModule.MinConvTime=1.250000E+0,cRIOModule.RsiAttributes=[crioConfig.End]{52CBDBDC-6AB6-4AF5-8CDB-2D2F95849834}[crioConfig.Begin]crio.Calibration=1,crio.Location=Slot 4,crio.Type=NI 9485,cRIOModule.DIO3_0InitialDir=0,cRIOModule.DIO7_4InitialDir=0,cRIOModule.EnableDECoM=false,cRIOModule.EnableInputFifo=false,cRIOModule.EnableOutputFifo=false,cRIOModule.NumSyncRegs=11111111,cRIOModule.RsiAttributes=[crioConfig.End]{5637EC4C-C072-41C4-911D-B1C93DB6FD00}resource=/crio_Mod5/DI4;0;ReadMethodType=bool{581DA688-A8FF-4075-BB32-2DB41B891B6B}resource=/crio_Mod5/DI21;0;ReadMethodType=bool{58E4BF50-781F-4AD8-BCFB-AC67ECA07AD6}resource=/crio_Mod2/AI2;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_5.ctl{5BB20251-0DCD-4DEB-AF9A-537AEA0B4910}resource=/crio_Mod5/DI2;0;ReadMethodType=bool{6007CA61-ED33-4745-8DF4-5B4E4A5533F1}resource=/crio_Mod2/AI0;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_5.ctl{622BA54D-DAA8-48BB-9505-16A084852FAB}resource=/crio_Mod3/AI3;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_7.ctl{65418DE8-B27D-4921-9979-5051602614CA}resource=/crio_Mod5/DI15;0;ReadMethodType=bool{6ADB5D2B-B0D2-4774-8DEC-E1410DB1F858}ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/cRIO_Trig/cRIO_Trig2;0;ReadMethodType=bool;WriteMethodType=bool{6D9F1E36-4D89-4170-87C9-3B4FD6D55F39}resource=/System Reset;0;ReadMethodType=bool;WriteMethodType=bool{6E35E8AD-03BD-4CFB-B503-9FA3FA3F5EF6}cRIO Subresource{6EBD048F-2539-4E95-8E88-6CD35DC57200}ArbitrationForOutputData=NeverArbitrate;resource=/crio_Mod4/CH2;0;ReadMethodType=bool;WriteMethodType=bool{6F8F8192-36AB-4796-9B64-351954E49582}resource=/crio_Mod3/AI1;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_7.ctl{71C308B5-36DE-49C9-AD97-94DE6CD5721B}NumberOfSyncRegistersForReadInProject=0;resource=/Time Synchronization/Time Synchronization Fault;0;ReadMethodType=bool{7B4B2389-568F-4B1A-9216-3541B5F91909}resource=/crio_Mod3/AI2;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_7.ctl{808DECA9-A90E-44F5-8A6E-2DDBED217363}resource=/crio_Mod5/DI18;0;ReadMethodType=bool{849AFF2A-DA0E-4D8B-AEA9-F9F06DC07D42}resource=/crio_Mod2/AI6;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_5.ctl{9121807E-77FE-46A2-911B-75B269A965E0}NumberOfSyncRegistersForReadInProject=Auto;resource=/System Watchdog Expired;0;ReadMethodType=bool{91651A4D-77F7-4243-B492-A4024F89E8FD}ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/cRIO_Trig/cRIO_Trig0;0;ReadMethodType=bool;WriteMethodType=bool{92C675CF-60D7-4903-8B79-A3A1FA537A29}resource=/Chassis Temperature;0;ReadMethodType=i16{93C55EA5-4E76-40F7-B81A-415CF9DF7064}ArbitrationForOutputData=NeverArbitrate;resource=/crio_Mod4/CH7:0;0;ReadMethodType=u8;WriteMethodType=u8{988165A4-371C-4F6E-B966-5171EDE6265E}resource=/crio_Mod5/DI25;0;ReadMethodType=bool{9CDCFB5C-7675-47D4-A992-416A6FC100BB}ArbitrationForOutputData=NeverArbitrate;resource=/crio_Mod4/CH7;0;ReadMethodType=bool;WriteMethodType=bool{A0F5DCBA-7F64-4D8A-8DD7-1168A6245C07}resource=/crio_Mod5/DI7:0;0;ReadMethodType=u8{A6DED70B-551E-4A5C-A87C-CF5077844840}[crioConfig.Begin]crio.Calibration=1,crio.Location=Slot 5,crio.Type=NI 9426,cRIOModule.EnableDECoM=false,cRIOModule.EnableInputFifo=false,cRIOModule.EnableOutputFifo=false,cRIOModule.RsiAttributes=[crioConfig.End]{AB49FCD8-644A-4C08-8205-F1DB6B9ECE8E}resource=/crio_Mod5/DI23;0;ReadMethodType=bool{AC537FE1-30FD-4C30-BB09-7566A118E2D3}resource=/crio_Mod5/DI17;0;ReadMethodType=bool{AEF602F2-F4F7-4475-8A42-F59798986D7B}cRIO Subresource{B4B9DC09-9BBA-4D35-ACE0-3BA780FD4E07}ArbitrationForOutputData=NeverArbitrate;resource=/crio_Mod4/CH6;0;ReadMethodType=bool;WriteMethodType=bool{B73977C5-5A63-421B-8F1A-AFF21216B501}resource=/crio_Mod5/DI31:0;0;ReadMethodType=u32{B845AED2-3D51-456A-A1CC-CE260D729537}ResourceName=40 MHz Onboard Clock;TopSignalConnect=Clk40;ClockSignalName=Clk40;MinFreq=40000000.000000;MaxFreq=40000000.000000;VariableFreq=0;NomFreq=40000000.000000;PeakPeriodJitter=250.000000;MinDutyCycle=50.000000;MaxDutyCycle=50.000000;Accuracy=100.000000;RunTime=0;SpreadSpectrum=0;GenericDataHash=D41D8CD98F00B204E9800998ECF8427E;{BAF27065-4CE8-4F3F-8E1D-7E47A798935B}resource=/crio_Mod5/DI6;0;ReadMethodType=bool{BB1282D5-70F8-4C33-B57E-BE81259266E3}[crioConfig.Begin]crio.Calibration=1,crio.Location=Slot 1,crio.Type=NI 9871,cRIOModule.EnableDECoM=false,cRIOModule.EnableInputFifo=false,cRIOModule.EnableOutputFifo=false,cRIOModule.kBaudRateDivider1=384,cRIOModule.kBaudRateDivider2=384,cRIOModule.kBaudRateDivider3=384,cRIOModule.kBaudRateDivider4=384,cRIOModule.kBaudRatePrescaler1=1,cRIOModule.kBaudRatePrescaler2=1,cRIOModule.kBaudRatePrescaler3=1,cRIOModule.kBaudRatePrescaler4=1,cRIOModule.kDataBits1=4,cRIOModule.kDataBits2=4,cRIOModule.kDataBits3=4,cRIOModule.kDataBits4=4,cRIOModule.kDesiredBaudRate1=9.600000E+3,cRIOModule.kDesiredBaudRate2=9.600000E+3,cRIOModule.kDesiredBaudRate3=9.600000E+3,cRIOModule.kDesiredBaudRate4=9.600000E+3,cRIOModule.kFlowControl1=1,cRIOModule.kFlowControl2=1,cRIOModule.kFlowControl3=1,cRIOModule.kFlowControl4=1,cRIOModule.kParity1=1,cRIOModule.kParity2=1,cRIOModule.kParity3=1,cRIOModule.kParity4=1,cRIOModule.kStopBits1=1,cRIOModule.kStopBits2=1,cRIOModule.kStopBits3=1,cRIOModule.kStopBits4=1,cRIOModule.kXcvrMode1="00",cRIOModule.kXcvrMode2="00",cRIOModule.kXcvrMode3="00",cRIOModule.kXcvrMode4="00",cRIOModule.RsiAttributes=[crioConfig.End]{BC792471-C18E-44E0-8296-D8300484E0FA}NumberOfSyncRegistersForReadInProject=Auto;resource=/cRIO_Trig/cRIO_Trig4;0;ReadMethodType=bool{C0820684-BFF6-48DB-9EA8-1367C06BF193}resource=/crio_Mod5/DI26;0;ReadMethodType=bool{C0BCB917-DDDB-4F7D-9349-6ACC713F84DD}resource=/crio_Mod5/DI27;0;ReadMethodType=bool{C4283DF2-33C1-4839-807A-F609CE2BAE40}ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/cRIO_Trig/cRIO_Trig1;0;ReadMethodType=bool;WriteMethodType=bool{C972C507-BEB0-4BB8-834D-DCCB19C130FA}NumberOfSyncRegistersForReadInProject=0;resource=/Time Synchronization/Time Source;0;ReadMethodType=Targets\NI\FPGA\RIO\CompactRIO\Sync\SyncSource.ctl{CBB36285-7164-4785-961C-9E101EE7ADBC}resource=/crio_Mod2/AI3;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_5.ctl{CE303A7D-4B78-4D85-B973-D780C7F00928}resource=/crio_Mod5/DI13;0;ReadMethodType=bool{D1B62B97-FDA6-4915-A512-97BBC59B83A2}ArbitrationForOutputData=NeverArbitrate;resource=/crio_Mod4/CH1;0;ReadMethodType=bool;WriteMethodType=bool{D2879FBE-429C-4B86-B8D1-3CF68ACA6B65}resource=/crio_Mod5/DI16;0;ReadMethodType=bool{D7795476-E26A-4025-81FF-7CB69D763592}resource=/crio_Mod2/AI7;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_5.ctl{D898E4D9-FA91-4A48-8981-B067E9FB928C}resource=/crio_Mod5/DI12;0;ReadMethodType=bool{DA2872AF-A41D-4F5E-B9EE-0E382FC7C70A}resource=/crio_Mod2/AI4;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_5.ctl{DCFC7AFC-7313-4A40-82FC-58E6486850C3}resource=/crio_Mod5/DI29;0;ReadMethodType=bool{E0DD7B0F-0D23-44D0-B094-B93D3C875F43}resource=/crio_Mod2/AI5;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_5.ctl{E1DEC011-324B-4DD2-9AA7-F5D11C6AB29C}resource=/crio_Mod5/DI9;0;ReadMethodType=bool{E39C84E2-B31F-40F7-8FDA-40F76EE77827}resource=/crio_Mod5/DI28;0;ReadMethodType=bool{E59F0A2C-83D2-40F8-8933-E13CF24231A2}resource=/crio_Mod3/AI6;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_7.ctl{E7E27111-1C21-4040-A19D-FF4570B41831}NumberOfSyncRegistersForReadInProject=0;resource=/Time Synchronization/Offset from Time Reference;0;ReadMethodType=i32{E9D00AE5-6DD9-4FA2-87C2-D540ECA7CAD4}resource=/crio_Mod3/AI5;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_7.ctl{ECB861CD-A7D2-4FC7-9230-CD15AB835DC9}resource=/crio_Mod5/DI23:16;0;ReadMethodType=u8{EE54E2FC-43A4-4989-9F09-3B0BF6D0373D}resource=/crio_Mod5/DI0;0;ReadMethodType=bool{F0CE3E4F-4282-47B7-976F-FD6F8FF01AC6}resource=/crio_Mod5/DI5;0;ReadMethodType=bool{F3F4C908-8BE9-4BB1-87CE-A9CBEE0654C0}[crioConfig.Begin]crio.Calibration=1,crio.Location=Slot 2,crio.Type=NI 9201,cRIOModule.EnableDECoM=false,cRIOModule.EnableInputFifo=false,cRIOModule.EnableOutputFifo=false,cRIOModule.MinConvTime=2.000000E+0,cRIOModule.RsiAttributes=[crioConfig.End]{F46D18E7-7BAD-4CAC-BB79-5930E2B27B51}resource=/crio_Mod5/DI14;0;ReadMethodType=bool{F4C9041B-732C-4D33-8B6D-F935CE4C12B7}cRIO Subresource{F71F9839-1784-4187-819B-D230A921FFC3}ArbitrationForOutputData=NeverArbitrate;resource=/crio_Mod4/CH3;0;ReadMethodType=bool;WriteMethodType=bool{F87BF149-2F0F-43B1-B332-232F1C5515D1}resource=/crio_Mod5/DI22;0;ReadMethodType=boolcRIO-9049/Clk40/falsefalseFPGA_EXECUTION_MODEFPGA_TARGETFPGA_TARGET_CLASSCRIO_9049FPGA_TARGET_FAMILYKINTEX7TARGET_TYPEFPGA/[rSeriesConfig.Begin][rSeriesConfig.End]</Property>
					<Property Name="configString.name" Type="Str">10 MHz TimebaseNumberOfSyncRegistersForReadInProject=Auto;resource=/10 MHz Timebase;0;ReadMethodType=bool12.8 MHz TimebaseNumberOfSyncRegistersForReadInProject=Auto;resource=/12.8 MHz Timebase;0;ReadMethodType=bool13.1072 MHz TimebaseNumberOfSyncRegistersForReadInProject=Auto;resource=/13.1072 MHz Timebase;0;ReadMethodType=bool40 MHz Onboard ClockResourceName=40 MHz Onboard Clock;TopSignalConnect=Clk40;ClockSignalName=Clk40;MinFreq=40000000.000000;MaxFreq=40000000.000000;VariableFreq=0;NomFreq=40000000.000000;PeakPeriodJitter=250.000000;MinDutyCycle=50.000000;MaxDutyCycle=50.000000;Accuracy=100.000000;RunTime=0;SpreadSpectrum=0;GenericDataHash=D41D8CD98F00B204E9800998ECF8427E;Chassis Temperatureresource=/Chassis Temperature;0;ReadMethodType=i16cRIO_Trig0ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/cRIO_Trig/cRIO_Trig0;0;ReadMethodType=bool;WriteMethodType=boolcRIO_Trig1ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/cRIO_Trig/cRIO_Trig1;0;ReadMethodType=bool;WriteMethodType=boolcRIO_Trig2ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/cRIO_Trig/cRIO_Trig2;0;ReadMethodType=bool;WriteMethodType=boolcRIO_Trig3ArbitrationForOutputData=NeverArbitrate;NumberOfSyncRegistersForOutputData=1;NumberOfSyncRegistersForReadInProject=Auto;resource=/cRIO_Trig/cRIO_Trig3;0;ReadMethodType=bool;WriteMethodType=boolcRIO_Trig4NumberOfSyncRegistersForReadInProject=Auto;resource=/cRIO_Trig/cRIO_Trig4;0;ReadMethodType=boolcRIO_Trig5NumberOfSyncRegistersForReadInProject=Auto;resource=/cRIO_Trig/cRIO_Trig5;0;ReadMethodType=boolcRIO_Trig6NumberOfSyncRegistersForReadInProject=Auto;resource=/cRIO_Trig/cRIO_Trig6;0;ReadMethodType=boolcRIO_Trig7NumberOfSyncRegistersForReadInProject=Auto;resource=/cRIO_Trig/cRIO_Trig7;0;ReadMethodType=boolcRIO-9049/Clk40/falsefalseFPGA_EXECUTION_MODEFPGA_TARGETFPGA_TARGET_CLASSCRIO_9049FPGA_TARGET_FAMILYKINTEX7TARGET_TYPEFPGA/[rSeriesConfig.Begin][rSeriesConfig.End]Mod1[crioConfig.Begin]crio.Calibration=1,crio.Location=Slot 1,crio.Type=NI 9871,cRIOModule.EnableDECoM=false,cRIOModule.EnableInputFifo=false,cRIOModule.EnableOutputFifo=false,cRIOModule.kBaudRateDivider1=384,cRIOModule.kBaudRateDivider2=384,cRIOModule.kBaudRateDivider3=384,cRIOModule.kBaudRateDivider4=384,cRIOModule.kBaudRatePrescaler1=1,cRIOModule.kBaudRatePrescaler2=1,cRIOModule.kBaudRatePrescaler3=1,cRIOModule.kBaudRatePrescaler4=1,cRIOModule.kDataBits1=4,cRIOModule.kDataBits2=4,cRIOModule.kDataBits3=4,cRIOModule.kDataBits4=4,cRIOModule.kDesiredBaudRate1=9.600000E+3,cRIOModule.kDesiredBaudRate2=9.600000E+3,cRIOModule.kDesiredBaudRate3=9.600000E+3,cRIOModule.kDesiredBaudRate4=9.600000E+3,cRIOModule.kFlowControl1=1,cRIOModule.kFlowControl2=1,cRIOModule.kFlowControl3=1,cRIOModule.kFlowControl4=1,cRIOModule.kParity1=1,cRIOModule.kParity2=1,cRIOModule.kParity3=1,cRIOModule.kParity4=1,cRIOModule.kStopBits1=1,cRIOModule.kStopBits2=1,cRIOModule.kStopBits3=1,cRIOModule.kStopBits4=1,cRIOModule.kXcvrMode1="00",cRIOModule.kXcvrMode2="00",cRIOModule.kXcvrMode3="00",cRIOModule.kXcvrMode4="00",cRIOModule.RsiAttributes=[crioConfig.End]Mod2/AI0resource=/crio_Mod2/AI0;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_5.ctlMod2/AI1resource=/crio_Mod2/AI1;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_5.ctlMod2/AI2resource=/crio_Mod2/AI2;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_5.ctlMod2/AI3resource=/crio_Mod2/AI3;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_5.ctlMod2/AI4resource=/crio_Mod2/AI4;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_5.ctlMod2/AI5resource=/crio_Mod2/AI5;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_5.ctlMod2/AI6resource=/crio_Mod2/AI6;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_5.ctlMod2/AI7resource=/crio_Mod2/AI7;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_5.ctlMod2[crioConfig.Begin]crio.Calibration=1,crio.Location=Slot 2,crio.Type=NI 9201,cRIOModule.EnableDECoM=false,cRIOModule.EnableInputFifo=false,cRIOModule.EnableOutputFifo=false,cRIOModule.MinConvTime=2.000000E+0,cRIOModule.RsiAttributes=[crioConfig.End]Mod3/AI0resource=/crio_Mod3/AI0;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_7.ctlMod3/AI1resource=/crio_Mod3/AI1;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_7.ctlMod3/AI2resource=/crio_Mod3/AI2;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_7.ctlMod3/AI3resource=/crio_Mod3/AI3;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_7.ctlMod3/AI4resource=/crio_Mod3/AI4;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_7.ctlMod3/AI5resource=/crio_Mod3/AI5;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_7.ctlMod3/AI6resource=/crio_Mod3/AI6;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_7.ctlMod3/AI7resource=/crio_Mod3/AI7;0;ReadMethodType=vi.lib\LabVIEW Targets\FPGA\cRIO\shared\nicrio_FXP_Controls\nicrio_FXP_S_16_7.ctlMod3[crioConfig.Begin]crio.Calibration=1,crio.Location=Slot 3,crio.Type=NI 9221,cRIOModule.EnableDECoM=false,cRIOModule.EnableInputFifo=false,cRIOModule.EnableOutputFifo=false,cRIOModule.MinConvTime=1.250000E+0,cRIOModule.RsiAttributes=[crioConfig.End]Mod4/CH0ArbitrationForOutputData=NeverArbitrate;resource=/crio_Mod4/CH0;0;ReadMethodType=bool;WriteMethodType=boolMod4/CH1ArbitrationForOutputData=NeverArbitrate;resource=/crio_Mod4/CH1;0;ReadMethodType=bool;WriteMethodType=boolMod4/CH2ArbitrationForOutputData=NeverArbitrate;resource=/crio_Mod4/CH2;0;ReadMethodType=bool;WriteMethodType=boolMod4/CH3ArbitrationForOutputData=NeverArbitrate;resource=/crio_Mod4/CH3;0;ReadMethodType=bool;WriteMethodType=boolMod4/CH4ArbitrationForOutputData=NeverArbitrate;resource=/crio_Mod4/CH4;0;ReadMethodType=bool;WriteMethodType=boolMod4/CH5ArbitrationForOutputData=NeverArbitrate;resource=/crio_Mod4/CH5;0;ReadMethodType=bool;WriteMethodType=boolMod4/CH6ArbitrationForOutputData=NeverArbitrate;resource=/crio_Mod4/CH6;0;ReadMethodType=bool;WriteMethodType=boolMod4/CH7:0ArbitrationForOutputData=NeverArbitrate;resource=/crio_Mod4/CH7:0;0;ReadMethodType=u8;WriteMethodType=u8Mod4/CH7ArbitrationForOutputData=NeverArbitrate;resource=/crio_Mod4/CH7;0;ReadMethodType=bool;WriteMethodType=boolMod4[crioConfig.Begin]crio.Calibration=1,crio.Location=Slot 4,crio.Type=NI 9485,cRIOModule.DIO3_0InitialDir=0,cRIOModule.DIO7_4InitialDir=0,cRIOModule.EnableDECoM=false,cRIOModule.EnableInputFifo=false,cRIOModule.EnableOutputFifo=false,cRIOModule.NumSyncRegs=11111111,cRIOModule.RsiAttributes=[crioConfig.End]Mod5/DI0resource=/crio_Mod5/DI0;0;ReadMethodType=boolMod5/DI10resource=/crio_Mod5/DI10;0;ReadMethodType=boolMod5/DI11resource=/crio_Mod5/DI11;0;ReadMethodType=boolMod5/DI12resource=/crio_Mod5/DI12;0;ReadMethodType=boolMod5/DI13resource=/crio_Mod5/DI13;0;ReadMethodType=boolMod5/DI14resource=/crio_Mod5/DI14;0;ReadMethodType=boolMod5/DI15:8resource=/crio_Mod5/DI15:8;0;ReadMethodType=u8Mod5/DI15resource=/crio_Mod5/DI15;0;ReadMethodType=boolMod5/DI16resource=/crio_Mod5/DI16;0;ReadMethodType=boolMod5/DI17resource=/crio_Mod5/DI17;0;ReadMethodType=boolMod5/DI18resource=/crio_Mod5/DI18;0;ReadMethodType=boolMod5/DI19resource=/crio_Mod5/DI19;0;ReadMethodType=boolMod5/DI1resource=/crio_Mod5/DI1;0;ReadMethodType=boolMod5/DI20resource=/crio_Mod5/DI20;0;ReadMethodType=boolMod5/DI21resource=/crio_Mod5/DI21;0;ReadMethodType=boolMod5/DI22resource=/crio_Mod5/DI22;0;ReadMethodType=boolMod5/DI23:16resource=/crio_Mod5/DI23:16;0;ReadMethodType=u8Mod5/DI23resource=/crio_Mod5/DI23;0;ReadMethodType=boolMod5/DI24resource=/crio_Mod5/DI24;0;ReadMethodType=boolMod5/DI25resource=/crio_Mod5/DI25;0;ReadMethodType=boolMod5/DI26resource=/crio_Mod5/DI26;0;ReadMethodType=boolMod5/DI27resource=/crio_Mod5/DI27;0;ReadMethodType=boolMod5/DI28resource=/crio_Mod5/DI28;0;ReadMethodType=boolMod5/DI29resource=/crio_Mod5/DI29;0;ReadMethodType=boolMod5/DI2resource=/crio_Mod5/DI2;0;ReadMethodType=boolMod5/DI30resource=/crio_Mod5/DI30;0;ReadMethodType=boolMod5/DI31:0resource=/crio_Mod5/DI31:0;0;ReadMethodType=u32Mod5/DI31:24resource=/crio_Mod5/DI31:24;0;ReadMethodType=u8Mod5/DI31resource=/crio_Mod5/DI31;0;ReadMethodType=boolMod5/DI3resource=/crio_Mod5/DI3;0;ReadMethodType=boolMod5/DI4resource=/crio_Mod5/DI4;0;ReadMethodType=boolMod5/DI5resource=/crio_Mod5/DI5;0;ReadMethodType=boolMod5/DI6resource=/crio_Mod5/DI6;0;ReadMethodType=boolMod5/DI7:0resource=/crio_Mod5/DI7:0;0;ReadMethodType=u8Mod5/DI7resource=/crio_Mod5/DI7;0;ReadMethodType=boolMod5/DI8resource=/crio_Mod5/DI8;0;ReadMethodType=boolMod5/DI9resource=/crio_Mod5/DI9;0;ReadMethodType=boolMod5[crioConfig.Begin]crio.Calibration=1,crio.Location=Slot 5,crio.Type=NI 9426,cRIOModule.EnableDECoM=false,cRIOModule.EnableInputFifo=false,cRIOModule.EnableOutputFifo=false,cRIOModule.RsiAttributes=[crioConfig.End]Offset from Time Reference ValidNumberOfSyncRegistersForReadInProject=0;resource=/Time Synchronization/Offset from Time Reference Valid;0;ReadMethodType=boolOffset from Time ReferenceNumberOfSyncRegistersForReadInProject=0;resource=/Time Synchronization/Offset from Time Reference;0;ReadMethodType=i32Port1cRIO SubresourcePort2cRIO SubresourcePort3cRIO SubresourcePort4cRIO SubresourceReset RT Appresource=/Reset RT App;0;WriteMethodType=boolScan Clockresource=/Scan Clock;0;ReadMethodType=boolSleepresource=/Sleep;0;ReadMethodType=bool;WriteMethodType=boolSystem Resetresource=/System Reset;0;ReadMethodType=bool;WriteMethodType=boolSystem Watchdog ExpiredNumberOfSyncRegistersForReadInProject=Auto;resource=/System Watchdog Expired;0;ReadMethodType=boolTime SourceNumberOfSyncRegistersForReadInProject=0;resource=/Time Synchronization/Time Source;0;ReadMethodType=Targets\NI\FPGA\RIO\CompactRIO\Sync\SyncSource.ctlTime Synchronization FaultNumberOfSyncRegistersForReadInProject=0;resource=/Time Synchronization/Time Synchronization Fault;0;ReadMethodType=boolTimeNumberOfSyncRegistersForReadInProject=0;resource=/Time Synchronization/Time;0;ReadMethodType=u64USER FPGA LEDresource=/USER FPGA LED;0;ReadMethodType=u8;WriteMethodType=u8USER Push ButtonNumberOfSyncRegistersForReadInProject=0;resource=/USER Push Button;0;ReadMethodType=bool</Property>
					<Property Name="NI.LV.FPGA.InterfaceBitfile" Type="Str">C:\Users\ttsai\Documents\github\ts_m2fpga\fpgaInterface\bitfile\m2fpga_FPGATarget2_mainFPGA_QMvIodQP5L8.lvbitx</Property>
				</Item>
				<Item Name="Dependencies" Type="Dependencies">
					<Item Name="vi.lib" Type="Folder">
						<Item Name="lvSimController.dll" Type="Document" URL="/&lt;vilib&gt;/rvi/Simulation/lvSimController.dll"/>
					</Item>
				</Item>
				<Item Name="Build Specifications" Type="Build">
					<Item Name="mainFPGA" Type="{F4C5E96F-7410-48A5-BB87-3559BC9B167F}">
						<Property Name="AllowEnableRemoval" Type="Bool">false</Property>
						<Property Name="BuildSpecDecription" Type="Str"></Property>
						<Property Name="BuildSpecName" Type="Str">mainFPGA</Property>
						<Property Name="Comp.BitfileName" Type="Str">m2fpga_FPGATarget2_mainFPGA_QMvIodQP5L8.lvbitx</Property>
						<Property Name="Comp.CustomXilinxParameters" Type="Str"></Property>
						<Property Name="Comp.MaxFanout" Type="Int">-1</Property>
						<Property Name="Comp.RandomSeed" Type="Bool">false</Property>
						<Property Name="Comp.Version.Build" Type="Int">0</Property>
						<Property Name="Comp.Version.Fix" Type="Int">0</Property>
						<Property Name="Comp.Version.Major" Type="Int">1</Property>
						<Property Name="Comp.Version.Minor" Type="Int">0</Property>
						<Property Name="Comp.VersionAutoIncrement" Type="Bool">false</Property>
						<Property Name="Comp.Vivado.EnableMultiThreading" Type="Bool">true</Property>
						<Property Name="Comp.Vivado.OptDirective" Type="Str">Default</Property>
						<Property Name="Comp.Vivado.PhysOptDirective" Type="Str">Default</Property>
						<Property Name="Comp.Vivado.PlaceDirective" Type="Str">Default</Property>
						<Property Name="Comp.Vivado.RouteDirective" Type="Str">Default</Property>
						<Property Name="Comp.Vivado.RunPowerOpt" Type="Bool">false</Property>
						<Property Name="Comp.Vivado.Strategy" Type="Str">Default</Property>
						<Property Name="Comp.Xilinx.DesignStrategy" Type="Str">balanced</Property>
						<Property Name="Comp.Xilinx.MapEffort" Type="Str">default(noTiming)</Property>
						<Property Name="Comp.Xilinx.ParEffort" Type="Str">standard</Property>
						<Property Name="Comp.Xilinx.SynthEffort" Type="Str">normal</Property>
						<Property Name="Comp.Xilinx.SynthGoal" Type="Str">speed</Property>
						<Property Name="Comp.Xilinx.UseRecommended" Type="Bool">true</Property>
						<Property Name="DefaultBuildSpec" Type="Bool">true</Property>
						<Property Name="DestinationDirectory" Type="Path">/C/Users/ttsai/Documents/github/ts_m2fpga/fpgaInterface/bitfile</Property>
						<Property Name="NI.LV.FPGA.LastCompiledBitfilePath" Type="Path">/C/Users/ttsai/Documents/github/ts_m2fpga/fpgaInterface/bitfile/m2fpga_FPGATarget2_mainFPGA_QMvIodQP5L8.lvbitx</Property>
						<Property Name="NI.LV.FPGA.LastCompiledBitfilePathRelativeToProject" Type="Path"></Property>
						<Property Name="ProjectPath" Type="Path">/C/Users/ttsai/Documents/github/ts_m2fpga/src/m2fpga.lvproj</Property>
						<Property Name="RelativePath" Type="Bool">false</Property>
						<Property Name="RunWhenLoaded" Type="Bool">false</Property>
						<Property Name="SupportDownload" Type="Bool">true</Property>
						<Property Name="SupportResourceEstimation" Type="Bool">false</Property>
						<Property Name="TargetName" Type="Str">FPGA Target 2</Property>
						<Property Name="TopLevelVI" Type="Ref">/RT CompactRIO Target 2/Chassis/FPGA Target 2/mainFPGA.vi</Property>
					</Item>
				</Item>
			</Item>
		</Item>
		<Item Name="Dependencies" Type="Dependencies"/>
		<Item Name="Build Specifications" Type="Build"/>
	</Item>
</Project>
