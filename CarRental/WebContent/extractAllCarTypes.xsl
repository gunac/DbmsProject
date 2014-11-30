<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
	<xsl:output method="xml" indent="yes"></xsl:output>
	
	 <xsl:template match="/">
      
      
     <CarType>
	 <xsl:copy-of select="//CarTypeName"> </xsl:copy-of>
         <xsl:copy-of select="//CarTypeCode"> </xsl:copy-of>
         <xsl:copy-of select="//PossibleModels"></xsl:copy-of>
         </CarType>
   
	 </xsl:template>
	 
	<!-- <xsl:copy>
                                <xsl:apply-templates match="@*|node()"/>
                        </xsl:copy> -->
	<!--  <xsl:copy-of select="/Hotwire/MetaData/CarMetaData/node()"></xsl:copy-of>-->
	 
</xsl:stylesheet>