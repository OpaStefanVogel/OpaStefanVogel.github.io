<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/REZEPTE">
<html>
 <head>
   <link rel="stylesheet" type="text/css" href="Rezepte.css" />
   <style>button {font-size:100%}</style> 
   </head>
<body class="REZEPT">
  <xsl:for-each select="//TITEL">
    <a>
      <xsl:attribute name="href">#<xsl:value-of select="." /></xsl:attribute>
      <xsl:attribute name="style">background-color:<xsl:value-of select="@ok"/></xsl:attribute>
      <xsl:value-of select="." />
      </a>,
    </xsl:for-each>
  <div style="height:600px"> </div>
  <xsl:apply-templates />
  <textarea cols="120" rows="20"><xsl:for-each select="//REZEPTE">
      <xsl:copy-of select="." />
      </xsl:for-each>
    </textarea>
<script src="REZEPT_UHR.js" type="text/javascript"/>
  </body></html>
</xsl:template>

<xsl:template match="UHR">
<span class="UHR" ontouchstart="CLICKI(event)"
  ontouchmove="DRAGGI(event)"
  angehalten="ja"><xsl:attribute name="Anfangszeit"><xsl:value-of select="." /></xsl:attribute>
  <img src="REZEPT_UHR.svg"/>
  <button angehalten="ja"><xsl:attribute name="Anfangszeit"><xsl:value-of select="." /></xsl:attribute><xsl:value-of select="." /></button>
  </span>
</xsl:template>

<xsl:template match="REZEPT">
  <xsl:apply-templates />
  <div style="height:100px"> </div>
  <textarea cols="120" rows="20"><xsl:copy-of select="." />
    </textarea>
  <div style="height:600px"> </div>
  </xsl:template>



<xsl:template match="TITEL">
<div><span class="TITEL" style="vertical-align:top"><xsl:attribute name="id"><xsl:value-of select="." /></xsl:attribute>Rezept</span>
<svg style="border:solid" width="90%" height="110px" font-family="Helvicta">
<text transform="scale(6,4) rotate(0) translate(0,16)" stroke="red" fill="green">
  * *    * <xsl:value-of select="." /> * * *
   <xsl:value-of select="." /> * * *
    <xsl:value-of select="." /> * * *
     <xsl:value-of select="." /> * * *
      <xsl:value-of select="." /> * * *
    <animate attributeType="XML" attributeName="x"     
    begin="0s" dur="200s"   
    from="0" to="-800"
    accumulate="sum"
    additive="sum"
    repeatCount="50"    
    fill="freeze" />
    
 </text>
</svg>
</div>
</xsl:template>

<xsl:template match="ZUTATEN">
 <span class="ZUTATEN"><xsl:value-of select="." /></span>
</xsl:template>

<xsl:template match="ZUBEREITUNG">
  
 <span class="ZUBEREITUNG"><xsl:apply-templates /></span>
</xsl:template>

<xsl:template match="ZUBEREITUNG/a">
 <a target="_blank"><xsl:attribute name="href"><xsl:value-of select="." /></xsl:attribute>
  <u><xsl:value-of select="." /></u></a>
 </xsl:template>

<xsl:template match="BILD">
 <img><xsl:attribute name="src"><xsl:value-of select="." /></xsl:attribute></img>
 </xsl:template>

<xsl:template match="a">
 <a><xsl:attribute name="href" target="_blank"><xsl:value-of select="." /></xsl:attribute>
  <u><xsl:value-of select="." /></u></a>;
 </xsl:template>

</xsl:stylesheet>
