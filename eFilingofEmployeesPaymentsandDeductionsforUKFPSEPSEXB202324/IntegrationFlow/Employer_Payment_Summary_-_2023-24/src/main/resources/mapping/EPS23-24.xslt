<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
   <xsl:output method="xml" />
   <xsl:template match="/">
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
            <xsl:if test="boolean(//*[local-name() = 'SenderID' ]/text() or      //*[local-name() = 'Method' ]/text() or      //*[local-name() = 'Role' ]/text() or      //*[local-name() = 'Value' ]/text())">
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
                     <xsl:value-of select="//*[local-name() = 'Key' and position() = 1]" />
                  </Key>
                  <Key Type="TaxOfficeReference">
                     <xsl:value-of select="//*[local-name() = 'Key' and position() = 2]" />
                  </Key>
                  <!--
                                         <xsl:apply-templates select="//*[local-name() = 'Key'  and position() = 1]"/>
                                         <xsl:apply-templates select="//*[local-name() = 'Key'  and position() = 2]"/>
                                         -->
               </Keys>
            </xsl:if>
            <xsl:if test="boolean(//*[local-name() = 'Organisation' ]/node())">
               <TargetDetails>
                  <Organisation>
                     <xsl:value-of select="//*[local-name() = 'Organisation' ]" />
                  </Organisation>
               </TargetDetails>
            </xsl:if>
            <xsl:if test="boolean(//*[local-name() = 'Processed' ]/text() or      //*[local-name() = 'Result' ]/text())">
               <GatewayValidation>
                  <Processed>
                     <xsl:value-of select="//*[local-name() = 'Processed' ]" />
                  </Processed>
                  <Result>
                     <xsl:value-of select="//*[local-name() = 'Result' ]" />
                  </Result>
               </GatewayValidation>
            </xsl:if>
            <xsl:if test="boolean(//*[local-name() = 'URI' ]/text() or      //*[local-name() = 'Name' ]/text() or      //*[local-name() = 'Product' ]/text() or      //*[local-name() = 'Version' ]/text() or      //*[local-name() = 'ID' ]/text() or      //*[local-name() = 'Timestamp' ]/text())">
               <ChannelRouting>
                  <Channel>
                     <xsl:if test="boolean(//*[local-name() = 'URI' ]/text())">
                        <URI>
                           <xsl:value-of select="//*[local-name() = 'URI' ]" />
                        </URI>
                     </xsl:if>
                     <xsl:if test="boolean(//*[local-name() = 'Name' ]/text())">
                        <Name>
                           <xsl:value-of select="//*[local-name() = 'Name' ]" />
                        </Name>
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
            <xsl:element xmlns="http://www.govtalk.gov.uk/taxation/PAYE/RTI/EmployerPaymentSummary/23-24/1" name="IRenvelope">
               <IRheader>
                  <xsl:if test="boolean(//*[local-name() = 'TestMessage' and namespace-uri() =  'http://www.govtalk.gov.uk/taxation/PAYE/RTI/EmployerPaymentSummary/23-24/1']/text())">
                     <TestMessage>
                        <xsl:value-of select="//*[local-name() = 'TestMessage' and namespace-uri() =  'http://www.govtalk.gov.uk/taxation/PAYE/RTI/EmployerPaymentSummary/23-24/1']" />
                     </TestMessage>
                  </xsl:if>
                  <Keys>
                     <Key Type="TaxOfficeNumber">
                        <xsl:value-of select="//*[local-name() = 'Key' and position() = 1]" />
                     </Key>
                     <Key Type="TaxOfficeReference">
                        <xsl:value-of select="//*[local-name() = 'Key' and position() = 2]" />
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
               <EmployerPaymentSummary>
                  <xsl:apply-templates select="//*[local-name() = 'EmpRefs']" />
                  <xsl:if test="boolean(//*[local-name() = 'NoPaymentForPeriod' ]/text())">
                     <NoPaymentForPeriod>
                        <xsl:value-of select="//*[local-name() = 'NoPaymentForPeriod' ]" />
                     </NoPaymentForPeriod>
                     <NoPaymentDates>
                        <From>
                           <xsl:value-of select="//*[local-name() = 'From' ]" />
                        </From>
                        <To>
                           <xsl:value-of select="//*[local-name() = 'To' ]" />
                        </To>
                     </NoPaymentDates>
                  </xsl:if>
                  <xsl:if test="boolean(//*[local-name() = 'PeriodOfInactivity/From' ]/text())">
                     <PeriodOfInactivity>
                        <From>
                           <xsl:value-of select="//*[local-name() = 'From' ]" />
                        </From>
                        <To>
                           <xsl:value-of select="//*[local-name() = 'To' ]" />
                        </To>
                     </PeriodOfInactivity>
                  </xsl:if>
                  <xsl:if test="boolean(//*[local-name() = 'EmpAllceInd' ]/text())">
                     <EmpAllceInd>
                        <xsl:value-of select="//*[local-name() = 'EmpAllceInd' ]" />
                     </EmpAllceInd>
                  </xsl:if>
                  <!--<xsl:if test="boolean(//*[local-name() = 'DeMinimisStateAid' ]/text())">-->
                     <xsl:apply-templates select="//*[local-name() = 'DeMinimisStateAid' ]" />
                  <!--</xsl:if>-->
                  <xsl:apply-templates select="//*[local-name() = 'RecoverableAmountsYTD' ]" />
                  <xsl:apply-templates select="//*[local-name() = 'ApprenticeshipLevy']" />
                  <xsl:apply-templates select="//*[local-name() = 'Account' ]" />
                  <RelatedTaxYear>
                     <xsl:value-of select=".//*[local-name() = 'RelatedTaxYear']" />
                  </RelatedTaxYear>
                  <xsl:apply-templates select="//*[local-name() = 'FinalSubmission' ]" />
                  <xsl:apply-templates select="//*[local-name() = 'QuestionsAndDeclarations' ]" />
               </EmployerPaymentSummary>
            </xsl:element>
         </Body>
      </GovTalkMessage>
   </xsl:template>
   <xsl:template match="//*[local-name() = 'Key' and namespace-uri() =  'http://www.govtalk.gov.uk/CM/envelope' and position() = 1]">
      <xsl:element name="Key" namespace="http://www.govtalk.gov.uk/CM/envelope">
         <xsl:attribute name="Type">
            <xsl:value-of select=".//@Type" />
         </xsl:attribute>
         <xsl:value-of select="//*[local-name() = 'Key' and namespace-uri() =  'http://www.govtalk.gov.uk/CM/envelope' and position() = 1]" />
      </xsl:element>
   </xsl:template>
   <xsl:template match="//*[local-name() = 'Key' and namespace-uri() =  'http://www.govtalk.gov.uk/CM/envelope' and position() = 2]">
      <xsl:element name="Key" namespace="http://www.govtalk.gov.uk/CM/envelope">
         <xsl:attribute name="Type">
            <xsl:value-of select=".//@Type" />
         </xsl:attribute>
         <xsl:value-of select="//*[local-name() = 'Key' and namespace-uri() =  'http://www.govtalk.gov.uk/CM/envelope' and position() = 2]" />
      </xsl:element>
   </xsl:template>
   <xsl:template match="//*[local-name() = 'Key' and namespace-uri() =  'http://www.govtalk.gov.uk/taxation/PAYE/RTI/EmployerPaymentSummary/23-24/1' and position() = 1]">
      <xsl:element name="Key" namespace="http://www.govtalk.gov.uk/taxation/PAYE/RTI/EmployerPaymentSummary/23-24/1">
         <xsl:attribute name="Type">
            <xsl:value-of select=".//@Type" />
         </xsl:attribute>
         <xsl:value-of select="//*[local-name() = 'Key' and namespace-uri() =  'http://www.govtalk.gov.uk/taxation/PAYE/RTI/EmployerPaymentSummary/23-24/1' and position() = 1]" />
      </xsl:element>
   </xsl:template>
   <xsl:template match="//*[local-name() = 'Key' and namespace-uri() =  'http://www.govtalk.gov.uk/taxation/PAYE/RTI/EmployerPaymentSummary/23-24/1' and position() = 2]">
      <xsl:element name="Key" namespace="http://www.govtalk.gov.uk/taxation/PAYE/RTI/EmployerPaymentSummary/23-24/1">
         <xsl:attribute name="Type">
            <xsl:value-of select=".//@Type" />
         </xsl:attribute>
         <xsl:value-of select="//*[local-name() = 'Key' and namespace-uri() =  'http://www.govtalk.gov.uk/taxation/PAYE/RTI/EmployerPaymentSummary/23-24/1' and position() = 2]" />
      </xsl:element>
   </xsl:template>
   <xsl:template match="//*[local-name() = 'GovTalkErrors' and namespace-uri() =  'http://www.govtalk.gov.uk/CM/envelope']">
      <Error xmlns="http://www.govtalk.gov.uk/CM/envelope">
         <RaisedBy>
            <xsl:value-of select="//*[local-name() = 'RaisedBy' and namespace-uri() =  'http://www.govtalk.gov.uk/CM/envelope']" />
         </RaisedBy>
         <xsl:if test="boolean(//*[local-name() = 'Number' and namespace-uri() =  'http://www.govtalk.gov.uk/CM/envelope']/text())">
            <Number>
               <xsl:value-of select="//*[local-name() = 'Number' and namespace-uri() =  'http://www.govtalk.gov.uk/CM/envelope']" />
            </Number>
         </xsl:if>
         <Type>
            <xsl:value-of select="//*[local-name() = 'Type' and namespace-uri() =  'http://www.govtalk.gov.uk/CM/envelope']" />
         </Type>
         <xsl:if test="boolean(//*[local-name() = 'Text' and namespace-uri() =  'http://www.govtalk.gov.uk/CM/envelope']/text())">
            <Text>
               <xsl:value-of select="//*[local-name() = 'Text' and namespace-uri() =  'http://www.govtalk.gov.uk/CM/envelope']" />
            </Text>
         </xsl:if>
         <xsl:if test="boolean(//*[local-name() = 'Location' and namespace-uri() =  'http://www.govtalk.gov.uk/CM/envelope']/text())">
            <Location>
               <xsl:value-of select="//*[local-name() = 'Location' and namespace-uri() =  'http://www.govtalk.gov.uk/CM/envelope']" />
            </Location>
         </xsl:if>
      </Error>
   </xsl:template>
   <xsl:template match="//*[local-name() = 'EmpRefs']">
      <EmpRefs xmlns="http://www.govtalk.gov.uk/taxation/PAYE/RTI/EmployerPaymentSummary/23-24/1">
         <OfficeNo>
            <xsl:value-of select=".//*[local-name() = 'OfficeNo']" />
         </OfficeNo>
         <PayeRef>
            <xsl:value-of select=".//*[local-name() = 'PayeRef']" />
         </PayeRef>
         <AORef>
            <xsl:value-of select=".//*[local-name() = 'AORef']" />
         </AORef>
         <xsl:if test="boolean(//*[local-name() = 'COTAXRef' ]/text())">
            <COTAXRef>
               <xsl:value-of select=".//*[local-name() = 'COTAXRef']" />
            </COTAXRef>
         </xsl:if>
      </EmpRefs>
   </xsl:template>
   <xsl:template match="//*[local-name() = 'DeMinimisStateAid' ]">
      <DeMinimisStateAid xmlns="http://www.govtalk.gov.uk/taxation/PAYE/RTI/EmployerPaymentSummary/23-24/1">
	     <xsl:if test="boolean(//*[local-name() = 'NA' ]/text())">
            <NA>
               <xsl:value-of select=".//*[local-name() = 'NA' ]" />
            </NA>
         </xsl:if>
      
         <xsl:if test="boolean(//*[local-name() = 'Agri' ]/text())">
            <Agri>
               <xsl:value-of select=".//*[local-name() = 'Agri' ]" />
            </Agri>
         </xsl:if>
         <xsl:if test="boolean(//*[local-name() = 'FisheriesAqua' ]/text())">
            <FisheriesAqua>
               <xsl:value-of select="//*[local-name() = 'FisheriesAqua' ]" />
            </FisheriesAqua>
         </xsl:if>
         <xsl:if test="boolean(//*[local-name() = 'RoadTrans' ]/text())">
            <RoadTrans>
               <xsl:value-of select="//*[local-name() = 'RoadTrans' ]" />
            </RoadTrans>
         </xsl:if>
         <xsl:if test="boolean(//*[local-name() = 'Indust' ]/text())">
            <Indust>
               <xsl:value-of select="//*[local-name() = 'Indust' ]" />
            </Indust>
         </xsl:if>
         <xsl:if test="boolean(//*[local-name() = 'Aid' ]/text())">
            <Aid Cur="EUR">
               <xsl:value-of select="//*[local-name() = 'Aid' ]" />
            </Aid>
         </xsl:if>
      </DeMinimisStateAid>
   </xsl:template>
   <xsl:template match="//*[local-name() = 'RecoverableAmountsYTD' ]">
      <RecoverableAmountsYTD xmlns="http://www.govtalk.gov.uk/taxation/PAYE/RTI/EmployerPaymentSummary/23-24/1">
         <xsl:if test="boolean(//*[local-name() = 'TaxMonth' ]/text())">
            <TaxMonth>
               <xsl:value-of select=".//*[local-name() = 'TaxMonth' ]" />
            </TaxMonth>
         </xsl:if>
         <xsl:if test="boolean(//*[local-name() = 'SMPRecovered' ]/text())">
            <SMPRecovered>
               <xsl:value-of select="//*[local-name() = 'SMPRecovered' ]" />
            </SMPRecovered>
         </xsl:if>
         <xsl:if test="boolean(//*[local-name() = 'SPPRecovered' ]/text())">
            <SPPRecovered>
               <xsl:value-of select="//*[local-name() = 'SPPRecovered' ]" />
            </SPPRecovered>
         </xsl:if>
         <xsl:if test="boolean(//*[local-name() = 'SAPRecovered' ]/text())">
            <SAPRecovered>
               <xsl:value-of select="//*[local-name() = 'SAPRecovered' ]" />
            </SAPRecovered>
         </xsl:if>
         <xsl:if test="boolean(.//*[local-name() = 'ShPPRecovered' ]/text() and                             .//*[local-name() = 'ShPPRecovered' ]/text() != '0000.00')">
            <ShPPRecovered>
               <xsl:value-of select=".//*[local-name() = 'ShPPRecovered' ]" />
            </ShPPRecovered>
         </xsl:if>
         <xsl:if test="boolean(.//*[local-name() = 'SPBPRecovered' ]/text())">
            <SPBPRecovered>
               <xsl:value-of select=".//*[local-name() = 'SPBPRecovered' ]" />
            </SPBPRecovered>
         </xsl:if>
         <xsl:if test="boolean(.//*[local-name() = 'NICCompensationOnSMP' ]/text() and                             .//*[local-name() = 'NICCompensationOnSMP' ]/text() != '0000.00')">
            <NICCompensationOnSMP>
               <xsl:value-of select=".//*[local-name() = 'NICCompensationOnSMP' ]" />
            </NICCompensationOnSMP>
         </xsl:if>
         <xsl:if test="boolean(.//*[local-name() = 'NICCompensationOnSPP' ]/text() and                             .//*[local-name() = 'NICCompensationOnSPP' ]/text() != '0000.00')">
            <NICCompensationOnSPP>
               <xsl:value-of select=".//*[local-name() = 'NICCompensationOnSPP' ]" />
            </NICCompensationOnSPP>
         </xsl:if>
         <xsl:if test="boolean(.//*[local-name() = 'NICCompensationOnSAP' ]/text() and                             .//*[local-name() = 'NICCompensationOnSAP' ]/text() != '0000.00')">
            <NICCompensationOnSAP>
               <xsl:value-of select=".//*[local-name() = 'NICCompensationOnSAP' ]" />
            </NICCompensationOnSAP>
         </xsl:if>
         <xsl:if test="boolean(.//*[local-name() = 'NICCompensationOnShPP' ]/text() and                             .//*[local-name() = 'NICCompensationOnShPP' ]/text() != '0000.00')">
            <NICCompensationOnShPP>
               <xsl:value-of select=".//*[local-name() = 'NICCompensationOnShPP' ]" />
            </NICCompensationOnShPP>
         </xsl:if>
         <xsl:if test="boolean(.//*[local-name() = 'NICCompensationOnSPBP' ]/text())">
            <NICCompensationOnSPBP>
               <xsl:value-of select=".//*[local-name() = 'NICCompensationOnSPBP' ]" />
            </NICCompensationOnSPBP>
         </xsl:if>
         <xsl:if test="boolean(.//*[local-name() = 'CISDeductionsSuffered' ]/text() and                             .//*[local-name() = 'CISDeductionsSuffered' ]/text() != '0000.00')">
            <CISDeductionsSuffered>
               <xsl:value-of select=".//*[local-name() = 'CISDeductionsSuffered' ]" />
            </CISDeductionsSuffered>
         </xsl:if>
      </RecoverableAmountsYTD>
   </xsl:template>
   <xsl:template match="//*[local-name() = 'ApprenticeshipLevy' ]">
      <ApprenticeshipLevy xmlns="http://www.govtalk.gov.uk/taxation/PAYE/RTI/EmployerPaymentSummary/23-24/1">
         <xsl:if test="boolean(.//*[local-name() = 'LevyDueYTD' ]/text() and                             .//*[local-name() = 'LevyDueYTD' ]/text() != '0000.00')">
            <LevyDueYTD>
               <xsl:value-of select=".//*[local-name() = 'LevyDueYTD']" />
            </LevyDueYTD>
         </xsl:if>
         <xsl:if test="boolean(.//*[local-name() = 'TaxMonth' ]/text()) ">
            <TaxMonth>
               <xsl:value-of select=".//*[local-name() = 'TaxMonth']" />
            </TaxMonth>
         </xsl:if>
         <xsl:if test="boolean(.//*[local-name() = 'AnnualAllce' ]/text() and                             .//*[local-name() = 'AnnualAllce' ]/text() != '0000.00')">
            <AnnualAllce>
               <xsl:value-of select=".//*[local-name() = 'AnnualAllce']" />
            </AnnualAllce>
         </xsl:if>
      </ApprenticeshipLevy>
   </xsl:template>
   <xsl:template match="//*[local-name() = 'Account']">
      <xsl:if test="boolean(//*[local-name() = 'AccountHoldersName']/text())">
         <Account xmlns="http://www.govtalk.gov.uk/taxation/PAYE/RTI/EmployerPaymentSummary/23-24/1">
            <xsl:if test="boolean(//*[local-name() = 'AccountHoldersName']/text())">
               <AccountHoldersName>
                  <xsl:value-of select="//*[local-name() = 'AccountHoldersName']" />
               </AccountHoldersName>
            </xsl:if>
            <xsl:if test="boolean(//*[local-name() = 'AccountNo']/text())">
               <AccountNo>
                  <xsl:value-of select="//*[local-name() = 'AccountNo']" />
               </AccountNo>
            </xsl:if>
            <xsl:if test="boolean(//*[local-name() = 'SortCode']/text())">
               <SortCode>
                  <xsl:value-of select="//*[local-name() = 'SortCode']" />
               </SortCode>
            </xsl:if>
            <xsl:if test="boolean(//*[local-name() = 'BuildingSocRef']/text())">
               <BuildingSocRef>
                  <xsl:value-of select="//*[local-name() = 'BuildingSocRef']" />
               </BuildingSocRef>
            </xsl:if>
         </Account>
      </xsl:if>
   </xsl:template>
   <xsl:template match="//*[local-name() = 'FinalSubmission' and namespace-uri() =  'http://www.govtalk.gov.uk/taxation/PAYE/RTI/EmployerPaymentSummary/23-24/1']">
      <xsl:if test="boolean(//*[local-name() = 'BecauseSchemeCeased' and namespace-uri() =  'http://www.govtalk.gov.uk/taxation/PAYE/RTI/EmployerPaymentSummary/23-24/1']/text())">
         <FinalSubmission xmlns="http://www.govtalk.gov.uk/taxation/PAYE/RTI/EmployerPaymentSummary/23-24/1">
            <xsl:if test="boolean(//*[local-name() = 'BecauseSchemeCeased' and namespace-uri() =  'http://www.govtalk.gov.uk/taxation/PAYE/RTI/EmployerPaymentSummary/23-24/1']/text())">
               <BecauseSchemeCeased>
                  <xsl:value-of select="//*[local-name() = 'BecauseSchemeCeased' and namespace-uri() =  'http://www.govtalk.gov.uk/taxation/PAYE/RTI/EmployerPaymentSummary/23-24/1']" />
               </BecauseSchemeCeased>
            </xsl:if>
            <xsl:if test="boolean(//*[local-name() = 'DateSchemeCeased' and namespace-uri() =  'http://www.govtalk.gov.uk/taxation/PAYE/RTI/EmployerPaymentSummary/23-24/1']/text())">
               <DateSchemeCeased>
                  <xsl:value-of select="//*[local-name() = 'DateSchemeCeased' and namespace-uri() =  'http://www.govtalk.gov.uk/taxation/PAYE/RTI/EmployerPaymentSummary/23-24/1']" />
               </DateSchemeCeased>
            </xsl:if>
         </FinalSubmission>
      </xsl:if>
      <xsl:if test="boolean(//*[local-name() = 'ForYear' and namespace-uri() =  'http://www.govtalk.gov.uk/taxation/PAYE/RTI/EmployerPaymentSummary/23-24/1']/text())">
         <FinalSubmission xmlns="http://www.govtalk.gov.uk/taxation/PAYE/RTI/EmployerPaymentSummary/23-24/1">
            <xsl:if test="boolean(//*[local-name() = 'ForYear' and namespace-uri() =  'http://www.govtalk.gov.uk/taxation/PAYE/RTI/EmployerPaymentSummary/23-24/1']/text())">
               <ForYear>
                  <xsl:value-of select="//*[local-name() = 'ForYear' and namespace-uri() =  'http://www.govtalk.gov.uk/taxation/PAYE/RTI/EmployerPaymentSummary/23-24/1']" />
               </ForYear>
            </xsl:if>
         </FinalSubmission>
      </xsl:if>
   </xsl:template>
   <xsl:template match="//*[local-name() = 'QuestionsAndDeclarations' and namespace-uri() =  'http://www.govtalk.gov.uk/taxation/PAYE/RTI/EmployerPaymentSummary/23-24/1']">
      <xsl:if test="boolean(//*[local-name() = 'FreeOfTaxPaymentsMadeToEmployee' and namespace-uri() =  'http://www.govtalk.gov.uk/taxation/PAYE/RTI/EmployerPaymentSummary/23-24/1']/text())">
         <QuestionsAndDeclarations xmlns="http://www.govtalk.gov.uk/taxation/PAYE/RTI/EmployerPaymentSummary/23-24/1">
            <xsl:if test="boolean(//*[local-name() = 'FreeOfTaxPaymentsMadeToEmployee' and namespace-uri() =  'http://www.govtalk.gov.uk/taxation/PAYE/RTI/EmployerPaymentSummary/23-24/1']/text())">
               <FreeOfTaxPaymentsMadeToEmployee>
                  <xsl:value-of select="//*[local-name() = 'FreeOfTaxPaymentsMadeToEmployee' and namespace-uri() =  'http://www.govtalk.gov.uk/taxation/PAYE/RTI/EmployerPaymentSummary/23-24/1']" />
               </FreeOfTaxPaymentsMadeToEmployee>
            </xsl:if>
            <xsl:if test="boolean(//*[local-name() = 'ExpensesVouchersOrBenefitsFromOthers' and namespace-uri() =  'http://www.govtalk.gov.uk/taxation/PAYE/RTI/EmployerPaymentSummary/23-24/1']/text())">
               <ExpensesVouchersOrBenefitsFromOthers>
                  <xsl:value-of select="//*[local-name() = 'ExpensesVouchersOrBenefitsFromOthers' and namespace-uri() =  'http://www.govtalk.gov.uk/taxation/PAYE/RTI/EmployerPaymentSummary/23-24/1']" />
               </ExpensesVouchersOrBenefitsFromOthers>
            </xsl:if>
            <xsl:if test="boolean(//*[local-name() = 'PersonEmployedOutsideUKWorkedFor30DaysOrMore' and namespace-uri() =  'http://www.govtalk.gov.uk/taxation/PAYE/RTI/EmployerPaymentSummary/23-24/1']/text())">
               <PersonEmployedOutsideUKWorkedFor30DaysOrMore>
                  <xsl:value-of select="//*[local-name() = 'PersonEmployedOutsideUKWorkedFor30DaysOrMore' and namespace-uri() =  'http://www.govtalk.gov.uk/taxation/PAYE/RTI/EmployerPaymentSummary/23-24/1']" />
               </PersonEmployedOutsideUKWorkedFor30DaysOrMore>
            </xsl:if>
            <xsl:if test="boolean(//*[local-name() = 'PayToSomeoneElse' and namespace-uri() =  'http://www.govtalk.gov.uk/taxation/PAYE/RTI/EmployerPaymentSummary/23-24/1']/text())">
               <PayToSomeoneElse>
                  <xsl:value-of select="//*[local-name() = 'PayToSomeoneElse' and namespace-uri() =  'http://www.govtalk.gov.uk/taxation/PAYE/RTI/EmployerPaymentSummary/23-24/1']" />
               </PayToSomeoneElse>
            </xsl:if>
            <xsl:if test="boolean(//*[local-name() = 'P11DFormsDue' and namespace-uri() =  'http://www.govtalk.gov.uk/taxation/PAYE/RTI/EmployerPaymentSummary/23-24/1']/text())">
               <P11DFormsDue>
                  <xsl:value-of select="//*[local-name() = 'P11DFormsDue' and namespace-uri() =  'http://www.govtalk.gov.uk/taxation/PAYE/RTI/EmployerPaymentSummary/23-24/1']" />
               </P11DFormsDue>
            </xsl:if>
            <xsl:if test="boolean(//*[local-name() = 'ServiceCompany' and namespace-uri() =  'http://www.govtalk.gov.uk/taxation/PAYE/RTI/EmployerPaymentSummary/23-24/1']/text())">
               <ServiceCompany>
                  <xsl:value-of select="//*[local-name() = 'ServiceCompany' and namespace-uri() =  'http://www.govtalk.gov.uk/taxation/PAYE/RTI/EmployerPaymentSummary/23-24/1']" />
               </ServiceCompany>
            </xsl:if>
         </QuestionsAndDeclarations>
      </xsl:if>
   </xsl:template>
</xsl:stylesheet>