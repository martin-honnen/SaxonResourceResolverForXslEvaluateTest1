<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="3.0"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  exclude-result-prefixes="#all"
  expand-text="yes">

  <xsl:template name="xsl:initial-template">
    <xsl:sequence select="doc('doc1.xml') => serialize(map{'method':'xml'})"/>
  </xsl:template>
  
</xsl:stylesheet>