<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" />
	<xsl:template match="/" >
		<GovTalkMessage xmlns="http://www.govtalk.gov.uk/CM/envelope">
			<EnvelopeVersion>
				<xsl:value-of select="//*[local-name() = 'EnvelopeVersion' ]" />
			</EnvelopeVersion>
			<Header>
				<MessageDetails>
					<Class>
						<xsl:value-of select="//*[local-name() = 'Class' ]" />
					</Class>
					<Qualifier>
						<xsl:value-of select="//*[local-name() = 'Qualifier' ]" />
					</Qualifier>
					<xsl:if test="boolean(//*[local-name() = 'Function' ]/text())">
						<Function>
							<xsl:value-of select="//*[local-name() = 'Function' ]" />
						</Function>
					</xsl:if>
					<xsl:if test="boolean(//*[local-name() = 'TransactionID' ]/text())">
						<TransactionID>
							<xsl:value-of select="//*[local-name() = 'TransactionID' ]" />
						</TransactionID>
					</xsl:if>
					<xsl:if test="boolean(//*[local-name() = 'AuditID' ]/text())">
						<AuditID>
							<xsl:value-of select="//*[local-name() = 'AuditID' ]" />
						</AuditID>
					</xsl:if>
					<xsl:if test="boolean(//*[local-name() = 'ResponseEndPoint' ]/text())">
						<xsl:element name="ResponseEndPoint">
							<xsl:if test="boolean(//@PollInterval)">
								<xsl:attribute name="PollInterval"> 
									<xsl:value-of select="//@PollInterval" />
								</xsl:attribute>
							</xsl:if>
							<xsl:value-of select="//*[local-name() = 'PollInterval' ]" />
						</xsl:element>
					</xsl:if>
					<xsl:if test="boolean(//*[local-name() = 'Transformation' ]/text())">
						<Transformation>
							<xsl:value-of select="//*[local-name() = 'Transformation' ]" />
						</Transformation>
					</xsl:if>
					<xsl:if test="boolean(//*[local-name() = 'GatewayTest' ]/text())">
						<GatewayTest>
							<xsl:value-of select="//*[local-name() = 'GatewayTest' ]" />
						</GatewayTest>
					</xsl:if>
				</MessageDetails>
				<xsl:if test="boolean(//*[local-name() = 'SenderID' ]/text() or 
				//*[local-name() = 'Method' ]/text() or 
				//*[local-name() = 'Role' ]/text() or 
				//*[local-name() = 'Value' ]/text())">
					<SenderDetails>
						<IDAuthentication>
							<xsl:if test="boolean(//*[local-name() = 'SenderID' ]/text())">
								<SenderID>
									<xsl:value-of select="//*[local-name() = 'SenderID' ]" />
								</SenderID>
							</xsl:if>
							<Authentication>
								<Method>
									<xsl:value-of select="//*[local-name() = 'Method' ]" />
								</Method>
								<xsl:if test="boolean(//*[local-name() = 'Role' ]/text())">
									<Role>
										<xsl:value-of select="//*[local-name() = 'Role' ]" />
									</Role>
								</xsl:if>
								<Value>
									<xsl:value-of select="//*[local-name() = 'Value' ]" />
								</Value>
							</Authentication>
						</IDAuthentication>
						<xsl:if test="boolean(//*[local-name() = 'X509Certificate' ]/text())">
							<X509Certificate>
								<xsl:value-of select="//*[local-name() = 'X509Certificate' ]" />
							</X509Certificate>
						</xsl:if>
						<xsl:if test="boolean(//*[local-name() = 'EmailAddress' ]/text())">
							<EmailAddress>
								<xsl:value-of select="//*[local-name() = 'EmailAddress' ]" />
							</EmailAddress>
						</xsl:if>
					</SenderDetails>
				</xsl:if>
			</Header>
			<GovTalkDetails>
				<xsl:if test="boolean(//*[local-name() = 'Key' ]/node())">
					<Keys>
						<Key Type="TaxOfficeNumber">
							<xsl:value-of select="(//*[local-name() = 'Key'])[1]" />
						</Key>
						<Key Type="TaxOfficeReference">
							<xsl:value-of select="(//*[local-name() = 'Key'])[2]" />
						</Key>
					</Keys>
				</xsl:if>
				<xsl:if test="boolean(//*[local-name() = 'Organisation' ]/node())">
					<TargetDetails>
						<Organisation>
							<xsl:value-of select="//*[local-name() = 'Organisation' ]" />
						</Organisation>
					</TargetDetails>
				</xsl:if>
				<xsl:if test="boolean(//*[local-name() = 'Processed' ]/text() or 
					//*[local-name() = 'Result' ]/text())">
					<GatewayValidation>
						<Processed>
							<xsl:value-of select="//*[local-name() = 'Processed' ]" />
						</Processed>
						<Result>
							<xsl:value-of select="//*[local-name() = 'Result' ]" />
						</Result>
					</GatewayValidation>
				</xsl:if>
				<xsl:if test="boolean(//*[local-name() = 'URI' ]/text() or
					 //*[local-name() = 'Name' ]/text() or
					//*[local-name() = 'Product' ]/text() or
					//*[local-name() = 'Version' ]/text() or
     				//*[local-name() = 'ID' ]/text() or
     				//*[local-name() = 'Timestamp' ]/text())">
					<ChannelRouting>
						<Channel>
							<xsl:if test="boolean(//*[local-name() = 'URI' ]/text())">
								<URI>
									<xsl:value-of select="//*[local-name() = 'URI' ]" />
								</URI>
							</xsl:if>
							<xsl:if test="boolean( //*[local-name() = 'Product' ]/text())">
								<Product>
									<xsl:value-of select="//*[local-name() = 'Product' ]" />
								</Product>
							</xsl:if>
							<xsl:if test="boolean(//*[local-name() = 'Version' ]/text())">
								<Version>
									<xsl:value-of select="//*[local-name() = 'Version' ]" />
								</Version>
							</xsl:if>
						</Channel>
						<xsl:if test="boolean(//*[local-name() = 'ID' ]/text())">
							<ID>
								<xsl:value-of select="//*[local-name() = 'ID' ]" />
							</ID>
						</xsl:if>
						<xsl:if test="boolean(//*[local-name() = 'Timestamp' ]/text())">
							<Timestamp>
								<xsl:value-of select="//*[local-name() = 'Timestamp' ]" />
							</Timestamp>
						</xsl:if>
					</ChannelRouting>
				</xsl:if>
				<xsl:if test="boolean(//*[local-name() = 'GovTalkErrors' ]/node())">
					<GovTalkErrors>
						<xsl:apply-templates select="//*[local-name() = 'GovTalkErrors' ]" />
					</GovTalkErrors>
				</xsl:if>
				<xsl:if test="boolean(//*[local-name() = 'GatewayAdditions' ]/text())">
					<GatewayAdditions>
						<xsl:value-of select="//*[local-name() = 'GatewayAdditions' ]" />
					</GatewayAdditions>
				</xsl:if>
			</GovTalkDetails>
			<Body>
				<xsl:element name="IRenvelope" xmlns="http://www.govtalk.gov.uk/taxation/EXB/22-23/1">
					<IRheader xmlns="http://www.govtalk.gov.uk/taxation/EXB/22-23/1">
						<xsl:if test="boolean(//*[local-name() = 'TestMessage' and namespace-uri() = 'http://www.govtalk.gov.uk/taxation/EXB/22-23/1']/text())">
							<TestMessage>
								<xsl:value-of select="//*[local-name() = 'TestMessage' and namespace-uri() = 'http://www.govtalk.gov.uk/taxation/EXB/22-23/1']" />
							</TestMessage>
						</xsl:if>
						<Keys>
							<Key Type="TaxOfficeNumber">
								<xsl:value-of select="(//*[local-name() = 'Key'])[1]" />
							</Key>
							<Key Type="TaxOfficeReference">
								<xsl:value-of select="(//*[local-name() = 'Key'])[2]" />
							</Key>
						</Keys>
						<PeriodEnd>
							<xsl:value-of select="//*[local-name() = 'PeriodEnd']" />
						</PeriodEnd>
						<xsl:if test="boolean(//*[local-name() = 'DefaultCurrency']/text())">
							<DefaultCurrency>
								<xsl:value-of select="//*[local-name() = 'DefaultCurrency']" />
							</DefaultCurrency>
						</xsl:if>
						<Sender>
							<xsl:value-of select="//*[local-name() = 'Sender']" />
						</Sender>
					</IRheader>
					<ExpensesAndBenefits xmlns="http://www.govtalk.gov.uk/taxation/EXB/22-23/1">
						<xsl:if test="boolean(//*[local-name() = 'Name' ]/text())">
							<Employer>
								<Name>
									<xsl:value-of select="//*[local-name() = 'Name']" />
								</Name>
							</Employer>
						</xsl:if>
						<xsl:if test="boolean(//*[local-name() = 'P11Dincluded' ]/text())">
							<Declarations>
								<P11Dincluded>
									<xsl:value-of select="//*[local-name() = 'P11Dincluded']" />
								</P11Dincluded>
							</Declarations>
						</xsl:if>
						<xsl:if test="boolean(//*[local-name() = 'TotalBenefit' ]/text() or //*[local-name() = 'NICpayable' ]/text())">
							<P11Db>
								<xsl:element name="Class1AcontributionsDue" namespace="http://www.govtalk.gov.uk/taxation/EXB/22-23/1">
									<xsl:if test="boolean(.//@NICsRate)">
										<xsl:attribute name="NICsRate">
											<xsl:value-of select=".//@NICsRate"/>
										</xsl:attribute>
									</xsl:if>

									<xsl:element name="TotalBenefit" namespace="http://www.govtalk.gov.uk/taxation/EXB/22-23/1">
										<xsl:if test="boolean(.//@AdjustmentRequired)">
											<xsl:attribute name="AdjustmentRequired">
												<xsl:value-of select=".//@AdjustmentRequired"/>
											</xsl:attribute>
										</xsl:if>
										<xsl:value-of select="(//*[local-name() = 'TotalBenefit'])[1]"/>
									</xsl:element>

									<xsl:if test="boolean(//*[local-name() = 'NICpayable' ]/text())">
										<NICpayable>
											<xsl:value-of select="//*[local-name() = 'NICpayable']" />
										</NICpayable>
									</xsl:if>

									<xsl:if test="boolean(//*[local-name() = 'Adjustments' ])">
										<Adjustments>
											<TotalBenefit>
												<xsl:value-of select="(//*[local-name() = 'TotalBenefit'])[2]" />
											</TotalBenefit>
											<AmountDue>
												<Description>
													<xsl:value-of select="(//*[local-name() = 'Description'])[1]" />
												</Description>
												<Adjustment>
													<xsl:value-of select="(//*[local-name() = 'Adjustment'])[1]" />
												</Adjustment>
											</AmountDue>
											<AmountNotDue>
												<Description>
													<xsl:value-of select="(//*[local-name() = 'Description'])[2]" />
												</Description>
												<Adjustment>
													<xsl:value-of select="(//*[local-name() = 'Adjustment'])[2]" />
												</Adjustment>
											</AmountNotDue>
											<Total>
												<xsl:value-of select="//*[local-name() = 'Total']" />
											</Total>
											<Payable>
												<xsl:value-of select="//*[local-name() = 'Payable']" />
											</Payable>
										</Adjustments>
									</xsl:if>
								</xsl:element>

							</P11Db>
						</xsl:if>
						<xsl:if test="boolean(//*[local-name() = 'P11DrecordCount' ]/text())">
							<P11DrecordCount>
								<xsl:value-of select="//*[local-name() = 'P11DrecordCount']" />
							</P11DrecordCount>
						</xsl:if>
						<xsl:if test="boolean(//*[local-name() = 'P46CarRecordCount' ]/text())">
							<P46CarRecordCount>
								<xsl:value-of select="//*[local-name() = 'P46CarRecordCount']" />
							</P46CarRecordCount>
						</xsl:if>
						<xsl:apply-templates select="//*[local-name() = 'CompressedPart']"/>
					</ExpensesAndBenefits>
				</xsl:element>
			</Body>
		</GovTalkMessage>
	</xsl:template>
	<xsl:template match="//*[local-name() = 'CompressedPart']">
		<xsl:element name="CompressedPart" namespace="http://www.govtalk.gov.uk/taxation/EXB/22-23/1">
			<xsl:if test="boolean(.//@Type)">
				<xsl:attribute name="Type">
					<xsl:value-of select=".//@Type"/>
				</xsl:attribute>
			</xsl:if>
			<xsl:value-of select="//*[local-name() = 'CompressedPart']"/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="//*[local-name() = 'GovTalkErrors' ]">
		<Error xmlns="http://www.govtalk.gov.uk/CM/envelope">
			<RaisedBy>
				<xsl:value-of select="//*[local-name() = 'RaisedBy' ]" />
			</RaisedBy>
			<xsl:if test="boolean(//*[local-name() = 'Number' ]/text())">
				<Number>
					<xsl:value-of select="//*[local-name() = 'Number' ]" />
				</Number>
			</xsl:if>
			<Type>
				<xsl:value-of select="//*[local-name() = 'Type' ]" />
			</Type>
			<xsl:if test="boolean(//*[local-name() = 'Text' ]/text())">
				<Text>
					<xsl:value-of select="//*[local-name() = 'Text' ]" />
				</Text>
			</xsl:if>
			<xsl:if test="boolean(//*[local-name() = 'Location' ]/text())">
				<Location>
					<xsl:value-of select="//*[local-name() = 'Location' ]" />
				</Location>
			</xsl:if>
		</Error>
	</xsl:template>
</xsl:stylesheet>