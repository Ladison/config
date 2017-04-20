<?xml version="1.0"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html>
            <head>
                <title>Transform XML to HTML</title>
                <meta charset="UTF-8" />
            </head>
            <body>
                <h1>APP SETTINGS</h1>
                <h2>General</h2>
                <table border="1">
                    <tr><td><strong>App Version: </strong></td><td><xsl:value-of select="config/general/@appVersion"/></td></tr>
                    <tr><td><strong>Language: </strong></td><td><xsl:value-of select="config/general/language"/></td></tr>
                    <tr><td><strong>Device: </strong></td><td><xsl:value-of select="config/general/device"/></td></tr>
                    <tr><td><strong>Template color: </strong></td><td>(<xsl:value-of select="config/general/templateColor/@type"/>)<xsl:value-of select="config/general/templateColor"/></td></tr>
                    <tr><td><strong>Appstart: </strong></td><td><xsl:value-of select="config/general/appStart"/></td></tr>
                    <tr><td><strong>AutoSave: </strong></td><td><xsl:choose><xsl:when test="config/general/autoSave/@enabled = 'true'">ON [Save every <xsl:value-of select="config/general/autoSave/time"/> <xsl:value-of select="config/general/autoSave/time/@t-unit"/> | Overwrite: <xsl:choose><xsl:when test="config/general/autoSave/overwrite = 'true'">ON</xsl:when><xsl:otherwise>OFF</xsl:otherwise></xsl:choose></xsl:when><xsl:otherwise>OFF</xsl:otherwise></xsl:choose>]</td></tr>
                    <tr><td><strong>Units: </strong></td><td> workspace: <xsl:value-of select="config/general/units/workspace"/> | text: <xsl:value-of select="config/general/units/text"/> | stroke: <xsl:value-of select="config/general/units/stroke"/></td></tr>
                    <tr><td><strong>Plugins: </strong></td><td><xsl:choose><xsl:when test="config/general/enablePlugins = 'true'">ON</xsl:when><xsl:otherwise>OFF</xsl:otherwise></xsl:choose></td></tr>
                    <tr><td><strong>Confirm Savings: </strong></td><td><xsl:choose><xsl:when test="config/general/confirmSavings = 'true'">ON</xsl:when><xsl:otherwise>OFF</xsl:otherwise></xsl:choose></td></tr>
                    <tr><td><strong>Show tool tips: </strong></td><td><xsl:choose><xsl:when test="config/general/showTooltips = 'true'">ON</xsl:when><xsl:otherwise>OFF</xsl:otherwise></xsl:choose></td></tr>
                    <tr><td><strong>Font size in UI: </strong></td><td><xsl:value-of select="config/general/fontSizeUI"/></td></tr>
                    <tr><td><strong>Cursor: </strong></td><td><xsl:value-of select="config/general/cursor"/></td></tr>
                    <tr><td><strong>Documents in tabs: </strong></td><td><xsl:choose><xsl:when test="config/general/documentsTabs = 'true'">ON [maximum tabs: <xsl:value-of select="config/general/documentsTabs/@maxtabs"/></xsl:when><xsl:otherwise>OFF</xsl:otherwise></xsl:choose>]</td></tr>
                    <tr><td><strong>Switch with Shift: </strong></td><td><xsl:choose><xsl:when test="config/general/shiftSwitch = 'true'">ON</xsl:when><xsl:otherwise>OFF</xsl:otherwise></xsl:choose></td></tr>
                    <tr><td><strong>Show hidden panel: </strong></td><td><xsl:choose><xsl:when test="config/general/showHiddenPanel = 'true'">ON</xsl:when><xsl:otherwise>OFF</xsl:otherwise></xsl:choose></td></tr>
                    <tr><td><strong>Default extension: </strong></td><td><xsl:value-of select="config/general/defaultExtension"/></td></tr>
                    <tr><td><strong>Sounds: </strong></td><td><xsl:choose><xsl:when test="config/general/enableSounds = 'true'">ON [volume: <xsl:value-of select="config/general/enableSounds/@value"/></xsl:when><xsl:otherwise>OFF</xsl:otherwise></xsl:choose>]</td></tr>
                </table>               
                
                <h2>Performance</h2>	
                <table border="1">
                    <tr><td><strong>Using GPU: </strong></td><td><xsl:choose><xsl:when test="config/performance/usingGPU = 'true'">ON</xsl:when><xsl:otherwise>OFF</xsl:otherwise></xsl:choose></td></tr>
                    <tr><td><strong>Windowed mode: </strong></td><td><xsl:choose><xsl:when test="config/performance/windowed = 'true'">ON</xsl:when><xsl:otherwise>OFF</xsl:otherwise></xsl:choose></td></tr>
                    <tr><td><strong>Brightness: </strong></td><td><xsl:value-of select="config/performance/brightness"/></td></tr>
                    <tr><td><strong>Resizable: </strong></td><td><xsl:choose><xsl:when test="config/performance/resizable = 'true'">ON</xsl:when><xsl:otherwise>OFF</xsl:otherwise></xsl:choose></td></tr>
                    <tr><td><strong>Animated Zoom: </strong></td><td><xsl:choose><xsl:when test="config/performance/animatedZoom = 'true'">ON</xsl:when><xsl:otherwise>OFF</xsl:otherwise></xsl:choose></td></tr>
                    <tr><td><strong>History: </strong></td><td><xsl:choose><xsl:when test="config/performance/enableHistory = 'true'">ON [maximum history: <xsl:value-of select="config/performance/enableHistory/@maxhistory"/></xsl:when><xsl:otherwise>OFF</xsl:otherwise></xsl:choose>]</td></tr>
                    <tr><td><strong>Storage for swap disc: </strong></td><td><xsl:value-of select="config/performance/swapDisc"/></td></tr>
                    <tr><td><strong>Maximum usage RAM: </strong></td><td><xsl:value-of select="config/performance/maxRAM"/><xsl:value-of select="config/performance/maxRAM/@b-unit"/></td></tr>
                </table>
                 
                <h2>Plugins</h2>
                <table border="1">
                    <tr><td><strong>Load plugin panel: </strong></td><td><xsl:choose><xsl:when test="config/plugins/loadPluginsPanel = 'true'">ON</xsl:when><xsl:otherwise>OFF</xsl:otherwise></xsl:choose></td></tr>
                </table>
                <h3>List plugins</h3>
                <table border="1">
                    <tr><th>Name</th><th>Location</th><th>Language</th><th>Access to Internet</th></tr>
                    <xsl:for-each select="config/plugins/listPlugins/plugin[@enabled = 'true']">
			<tr><td><strong><xsl:value-of select="@name"/>: </strong></td><td><xsl:value-of select="location"/></td><td><xsl:value-of select="lang"/></td><td><xsl:choose><xsl:when test="accessInternet = 'true'">ON</xsl:when><xsl:otherwise>OFF</xsl:otherwise></xsl:choose></td></tr> 
		</xsl:for-each>
                </table>
                <h2>Tools</h2>
                <xsl:if test="config/tools/rule/@enabled = 'true'">
                    <h3>Rule</h3>
                    <table border="1">
                        <tr><td><strong>Catch:</strong></td><td><xsl:choose><xsl:when test="config/tools/rule/catch = 'true'">ON</xsl:when><xsl:otherwise>OFF</xsl:otherwise></xsl:choose></td></tr>
                        <tr><td><strong>Line Type:</strong></td><td><xsl:value-of select="config/tools/rule/lineType"/></td></tr>
                        <tr><td><strong>Color:</strong></td><td>(<xsl:value-of select="config/tools/rule/color/@type"/>)<xsl:value-of select="config/tools/rule/color"/></td></tr>
                    </table>    
                </xsl:if>
                <xsl:if test="config/tools/grid/@enabled = 'true'">
                    <h3>Grid</h3>
                    <table border="1">
                        <tr><td><strong>Catch:</strong></td><td><xsl:choose><xsl:when test="config/tools/grid/catch = 'true'">ON</xsl:when><xsl:otherwise>OFF</xsl:otherwise></xsl:choose></td></tr>
                        <tr><td><strong>Line Type:</strong></td><td><xsl:value-of select="config/tools/grid/lineType"/></td></tr>
                        <tr><td><strong>Color:</strong></td><td>(<xsl:value-of select="config/tools/grid/color/@type"/>)<xsl:value-of select="config/tools/grid/color"/></td></tr>
                        <tr><td><strong>Grid Size:</strong></td><td><xsl:value-of select="config/tools/grid/gridSize"/><xsl:value-of select="config/tools/grid/gridSize/@w-unit"/></td></tr>
                        <tr><td><strong>Grid Zoom:</strong></td><td><xsl:choose><xsl:when test="config/tools/grid/gridZoom = 'true'">ON</xsl:when><xsl:otherwise>OFF</xsl:otherwise></xsl:choose></td></tr>
                    </table>    
                </xsl:if>
                <h2>Shortcut list</h2>
                <table border="1">
                    <tr><th>Name</th><th>Shortcut</th><th>ID</th></tr>
                    <xsl:for-each select="config/shortcutList/command">
			<tr><td><strong><xsl:value-of select="@name"/>: </strong></td><td><xsl:value-of select="shortcut"/></td><td><xsl:value-of select="@id"/></td></tr> 
		</xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
