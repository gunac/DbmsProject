<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
	<xsl:output method="xml" indent="yes"></xsl:output>
	
	<xsl:template match="/" name="MultilineTextOutput">
	<CarTypes>
	<xsl:apply-templates> </xsl:apply-templates>
	</CarTypes>
		<!-- TODO: Auto-generated template -->
	</xsl:template>
	
	<xsl:copy-of select="/Hotwire/MetaData/CarMetaData/node()"></xsl:copy-of>
	 
</xsl:stylesheet>