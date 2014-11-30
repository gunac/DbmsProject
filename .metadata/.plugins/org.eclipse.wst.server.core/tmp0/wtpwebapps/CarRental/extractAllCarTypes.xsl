<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
	<CarTypes>
	<xsl:apply-templates> </xsl:apply-templates>
	</CarTypes>
		<!-- TODO: Auto-generated template -->
	</xsl:template>
	
	
	<xsl:template match="/Hotwire/MetaData/CarMetaData/CarTypes/CarType">
	<CarType>
	<CarTypeName> <xsl:value-of select="@CarTypeName"></xsl:value-of> </CarTypeName>
	<CarTypeCode> <xsl:value-of select="@CarTypeCode"></xsl:value-of> </CarTypeCode>
	<Model>  <xsl:for-each select="@PossibleModels">
        		<xsl:value-of select="concat(., substring(',', 2 - (position() != last())))"/>
  		    </xsl:for-each>
  	</Model>
	</CarType>
	
	</xsl:template>
</xsl:stylesheet>