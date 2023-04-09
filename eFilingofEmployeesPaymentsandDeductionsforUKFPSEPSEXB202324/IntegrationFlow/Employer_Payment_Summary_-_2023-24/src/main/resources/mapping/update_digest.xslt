<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" />
	<xsl:param name="SAPMessageDigest" />

	<xsl:template match="@*|node()" name="t1">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="*[local-name()='PeriodEnd']">
		<xsl:call-template name="t1" />
		<xsl:element name="ns2:IRmark"
			namespace='http://www.govtalk.gov.uk/taxation/PAYE/RTI/EmployerPaymentSummary/23-24/1'>
			<xsl:attribute name="Type"><xsl:text>generic</xsl:text></xsl:attribute>
			<xsl:value-of select="$SAPMessageDigest" />
		</xsl:element>
	</xsl:template>
</xsl:stylesheet>