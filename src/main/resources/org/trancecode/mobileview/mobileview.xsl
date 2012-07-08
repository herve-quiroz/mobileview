<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xmlns:ddo="urn:trancecode.org:xsl:ddo"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://www.w3.org/1999/XSL/Transform http://www.w3.org/2007/schema-for-xslt20.xsd">

  <xsl:output method="html" />

  <xsl:param name="name" />
  <xsl:param name="request.path" as="xs:string" select="''" />
  <xsl:param name="request.query" as="xs:string" select="''" />

  <xsl:variable name="xml-content-url" select="concat('http://html2xml.trancecode.org/', $request.path, '?', $request.query)" />
  <xsl:variable name="xml-content" select="doc($xml-content-url)" />

  <xsl:template match="element()">
    <xsl:copy>
      <xsl:copy-of select="@*" />
      <xsl:apply-templates />
    </xsl:copy>
  </xsl:template>

  <xsl:template match="title">
    <xsl:copy>
      <xsl:value-of select="$xml-content/html/head/title" />
    </xsl:copy>
  </xsl:template>

  <xsl:template match="body">
    <xsl:copy>
      <xsl:apply-templates select="$xml-content/html/body" mode="mobileview" />
    </xsl:copy>
  </xsl:template>

  <xsl:template match="text()" mode="mobileview" />

</xsl:stylesheet>
