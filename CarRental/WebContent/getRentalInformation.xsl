<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
	<xsl:output method="xml" indent="yes"></xsl:output>
	
	 <xsl:template match="/">
     
       <xsl:apply-templates/>    
   
	 </xsl:template>
	 
	  <xsl:template match="MetaData"/>
	 
	 
		   <!-- Drop elements -->
  		<xsl:template match="Error | DeepLink  ">
   <xsl:apply-templates/>   
  </xsl:template> 
 
 <xsl:template match="Result ">
 <RentalInstances>
   <xsl:apply-templates/>  
   </RentalInstances>
  </xsl:template> 

  <xsl:template match="CarResult">
    
  <Rental>
   <xsl:copy-of select="SubTotal | CarTyTaxesAndFees | TotalPrice | CarTypeCode | DailyRate"> </xsl:copy-of>
   <xsl:copy-of select="DropoffDay | DropoffTime | PickupDay | PickupTime | LocationDescription | PickupAirport | RentalDays"> </xsl:copy-of>
           </Rental>
           
 </xsl:template>
	 
	 	 <xsl:template match=" StatusCode | StatusDesc"/>
</xsl:stylesheet>