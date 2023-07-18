<xsl:stylesheet 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  version="3.0" 
  xmlns:mf="http://example.com/mf"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  exclude-result-prefixes="#all">

  <xsl:function name="mf:eval" as="item()*" visibility="public">
    <xsl:param name="expression" as="xs:string"/>
    <xsl:param name="context-item" as="item()?"/>
    <xsl:param name="params" as="map(xs:QName, item()*)"/>
    <xsl:evaluate xpath="$expression" context-item="$context-item" with-params="$params"/>
  </xsl:function>

  <xsl:function name="mf:eval" as="item()*" visibility="public">
    <xsl:param name="expression" as="xs:string"/>
    <xsl:evaluate xpath="$expression" context-item="()" with-params="map{}"/>
  </xsl:function>

  <xsl:function name="mf:eval" as="item()*" visibility="public">
    <xsl:param name="expression" as="xs:string"/>
    <xsl:param name="context-item" as="item()?"/>
    <xsl:evaluate xpath="$expression" context-item="$context-item" with-params="map{}"/>
  </xsl:function>

</xsl:stylesheet>