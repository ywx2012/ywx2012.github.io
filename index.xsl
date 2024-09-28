<?xml version="1.0" encoding="UTF-8"?>
<stylesheet
    id="style"
    version="1.0"
    xmlns="http://www.w3.org/1999/XSL/Transform"
    xmlns:xhtml="http://www.w3.org/1999/xhtml">
  <output method="xml" version="1.0" encoding="utf-8" />
  <variable name="atom" select="'http://www.w3.org/2005/Atom'" />
  <variable name="xhtml" select="'http://www.w3.org/1999/xhtml'" />

  <template match="/">
    <processing-instruction name="xml-stylesheet">type="text/xsl" href="style.xsl"</processing-instruction>
    <element name="feed" namespace="{$atom}">
      <element name="id" namespace="{$atom}">
        <value-of select="$id" />
      </element>
      <element name="link" namespace="{$atom}">
        <attribute name="rel">self</attribute>
        <attribute name="href"><value-of select="$id" /></attribute>
      </element>
      <element name="updated" namespace="{$atom}">
        <value-of select="$updated" />
      </element>
      <element name="title" namespace="{$atom}">
        <value-of select=".//@title" />
      </element>
      <element name="rights" namespace="{$atom}">
        <text>©</text>
        <value-of select=".//@copy" />
        <text> </text>
        <value-of select=".//@author" />
      </element>
      <element name="generator" namespace="{$atom}">
        <attribute name="uri">http://vanilla-js.com/</attribute>
        <text>𝒱𝒶𝓃𝒾𝓁𝓁𝒶 𝒥𝒮</text>
      </element>

      <apply-templates select=".//entry" />
    </element>
  </template>
  <template match="entry">
    <element name="entry" namespace="{$atom}">
      <element name="id" namespace="{$atom}">
        <value-of select="$id" />
        <text>#</text>
        <value-of select=".//@created" />
        <text>-</text>
        <value-of select=".//@slug" />
      </element>
      <element name="title" namespace="{$atom}">
        <value-of select=".//@title" />
      </element>
      <element name="published" namespace="{$atom}">
        <value-of select=".//@created" />
        <text>T00:00:00+00:00</text>
      </element>
      <element name="updated" namespace="{$atom}">
        <value-of select=".//@updated" />
        <text>T00:00:00+00:00</text>
      </element>
      <element name="author" namespace="{$atom}">
        <element name="name" namespace="{$atom}">
          <value-of select="///@author" />
        </element>
      </element>
      <element name="content" namespace="{$atom}">
        <attribute name="type">xhtml</attribute>
        <copy-of select=".//xhtml:div" />
      </element>
      <element name="link" namespace="{$atom}">
        <attribute name="rel">alternate</attribute>
        <attribute name="href">
          <text>#</text>
          <value-of select=".//@created" />
          <text>-</text>
          <value-of select=".//@slug" />
        </attribute>
      </element>
    </element>
  </template>
</stylesheet>
