<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    id="style"
    version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xhtml="http://www.w3.org/1999/xhtml"
    xmlns="https://www.w3schools.com/w3style.xsl">
  <xsl:output method="xml" version="1.0" encoding="utf-8" />
  <xsl:namespace-alias stylesheet-prefix="#default" result-prefix="xsl"/>
  <xsl:variable name="atom" select="'http://www.w3.org/2005/Atom'" />
  <xsl:variable name="xhtml" select="'http://www.w3.org/1999/xhtml'" />

  <xsl:template match="/">
    <xsl:processing-instruction name="xml-stylesheet">type="text/xsl" href="#style"</xsl:processing-instruction>
    <xsl:element name="feed" namespace="{$atom}">
      <xsl:call-template name="stylesheet" />
      <xsl:element name="id" namespace="{$atom}">
        <xsl:value-of select="$id" />
      </xsl:element>
      <xsl:element name="link" namespace="{$atom}">
        <xsl:attribute name="rel">self</xsl:attribute>
        <xsl:attribute name="href"><xsl:value-of select="$id" /></xsl:attribute>
      </xsl:element>
      <xsl:element name="updated" namespace="{$atom}">
        <xsl:value-of select="$updated" />
      </xsl:element>
      <xsl:element name="title" namespace="{$atom}">
        <xsl:value-of select=".//@title" />
      </xsl:element>
      <xsl:element name="rights" namespace="{$atom}">
        <xsl:text>©</xsl:text>
        <xsl:value-of select=".//@copy" />
        <xsl:text> </xsl:text>
        <xsl:value-of select=".//@author" />
      </xsl:element>
      <xsl:element name="generator" namespace="{$atom}">
        <xsl:attribute name="uri">http://vanilla-js.com/</xsl:attribute>
        <xsl:text>𝒱𝒶𝓃𝒾𝓁𝓁𝒶 𝒥𝒮</xsl:text>
      </xsl:element>

      <xsl:apply-templates select=".//entry" />
    </xsl:element>
  </xsl:template>
  <xsl:template match="entry">
    <xsl:element name="entry" namespace="{$atom}">
      <xsl:element name="id" namespace="{$atom}">
        <xsl:value-of select="$id" />
        <xsl:text>#</xsl:text>
        <xsl:value-of select=".//@created" />
        <xsl:text>-</xsl:text>
        <xsl:value-of select=".//@slug" />
      </xsl:element>
      <xsl:element name="title" namespace="{$atom}">
        <xsl:value-of select=".//@title" />
      </xsl:element>
      <xsl:element name="published" namespace="{$atom}">
        <xsl:value-of select=".//@created" />
        <xsl:text>T00:00:00+00:00</xsl:text>
      </xsl:element>
      <xsl:element name="updated" namespace="{$atom}">
        <xsl:value-of select=".//@updated" />
        <xsl:text>T00:00:00+00:00</xsl:text>
      </xsl:element>
      <xsl:element name="author" namespace="{$atom}">
        <xsl:element name="name" namespace="{$atom}">
          <xsl:value-of select="///@author" />
        </xsl:element>
      </xsl:element>
      <xsl:element name="content" namespace="{$atom}">
        <xsl:attribute name="type">xhtml</xsl:attribute>
        <xsl:copy-of select=".//xhtml:div" />
      </xsl:element>
      <xsl:element name="link" namespace="{$atom}">
        <xsl:attribute name="rel">alternate</xsl:attribute>
        <xsl:attribute name="href">
          <xsl:text>#</xsl:text>
          <xsl:value-of select=".//@created" />
          <xsl:text>-</xsl:text>
          <xsl:value-of select=".//@slug" />
        </xsl:attribute>
      </xsl:element>
    </xsl:element>
  </xsl:template>

  <xsl:template name="stylesheet">
    <stylesheet
        id="style"
        version="1.0"
        xmlns:atom="http://www.w3.org/2005/Atom">
      <output method="xml" version="1.0" encoding="utf-8" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" />
      <variable name="xhtml" select="'http://www.w3.org/1999/xhtml'" />
      <template match="/">
        <element name="html" namespace="{$xhtml}">
          <element name="head" namespace="{$xhtml}">
            <element name="title" namespace="{$xhtml}">
              <value-of select=".//atom:title/text()" />
            </element>
            <element name="link" namespace="{$xhtml}">
              <attribute name="type">application/atom+xml</attribute>
              <attribute name="rel">alternate</attribute>
              <attribute name="title"><value-of select=".//atom:title/text()" /></attribute>
              <attribute name="href">/</attribute>
            </element>
            <element name="style" namespace="{$xhtml}">
              <text><![CDATA[
html, body { width: 100%; height: 100%; margin: 0; padding: 0; }
h1 { font-size: 1.6em; }
body { --fg-color: #386; --bg-color: #FFF; color: var(--fg-color); background: #EEC;
  & a {
    &:link { color: unset; }
    &:visited { color: unset; }
  }
  & p { text-indent: 2em; padding: 0.5em; margin: 0; font-size: 1.2em; line-height: 1.8em; }
  & nobr { font-size: small; white-space: nowrap; display: inline; }
  & main { display: grid; grid-template-columns: 1fr repeat(1, auto); grid-template-rows: min-content min-content 1fr min-content; height: calc( 100% - 1em ); max-width: 42em; margin: 0 auto; padding: 0.5em 1em;
    > footer { grid-row: 4; grid-column: 1/5; width: 100%; border-top: 1px solid var(--fg-color);
      & p { font-size: small; text-indent: unset;
        > span:last-of-type {
          float: right;
        }
      }
    }
    & h1 { grid-row: 1; grid-column: 1; margin: 0 0.5em; display: none; }
    > h2 { grid-row: 1; margin: 1.25em 0.25em 0 0.25em; padding: 0em 0.5em; font-weight: normal; font-size: 1em; border: solid var(--fg-color); border-width: 1px 1px 0px 1px; border-radius: 0.2em 0.2em 0 0; align-self: safe end;
      & a:link { text-decoration: none; }
    }
    > section { grid-row: 3; grid-column: 1 / 5; width: 100%; height: 100%; border-top: 1px solid var(--fg-color); padding: 0.5em 0;
      & img { display: block; width: 10em; margin: 1em auto; border-radius: 1em; }

      &:not(:target) { display: none;
        + h2 { color: unset; background: unset; }
        ~ section:last-of-type { display: unset;
          ~ h2 { color: var(--bg-color); background: var(--fg-color); }
          ~ h1:last-of-type { display: unset; }
        }
      }
      &:target { display: unset;
        + h2 { color: var(--bg-color); background: var(--fg-color); }
        ~ section:last-of-type { display: none;
          ~ h2 { color: unset; background: unset; }
          ~ h1:last-of-type { display: unset; }
        }
      }
      &:has(article:target) { display: unset;
        + h2 { color: var(--bg-color); background: var(--fg-color); }
        ~ section:last-of-type { display: none;
          ~ h2 { color: unset; background: unset; }
          ~ h1:last-of-type { display: none; }
        }
      }

      > article { display: none;
        > iframe { width: 100%; height: 100%; border: 0; background: transparent; }
      }
      > summary { display: none; padding: 0.5em 1em; font-size: 1.2em; line-height: 1.8em; }

      > article:target { grid-row: 3; grid-column: 1/5; display: flex; flex-flow: column; width: 100%; padding: 0;
        + h1 { grid-row: 1; grid-column: 1; display: unset;
          & a:link { text-decoration: none; }
          + summary { grid-row: 2; grid-column: 1/5; display: block; border-top: 1px solid var(--fg-color); }
        }
        &:not(:has(+ h1 + summary)) { border-top: 1px solid var(--fg-color); }
      }

      &:has(article:target) {
        display: contents;
      }

      &:target {
        > h1 { display: inline; font-size: 1.4em; margin: 0; }
        > article { display: inline; border: none; padding: 0 0 0 0.5em; width: 6em;
          &>* { display: none; }
          & time { display: inline; color: gray;
            &:after { content: " \bb  "; color: black; }
          }
        }
        > summary { display: block; }
      }

      > article.hidden:not(:target) { display: none;
        > * { display: none; }
        + h1 { display: none;
          + summary { display: none; }
        }
      }
    }
  }
}]]></text>
            </element>
          </element>
          <element name="body" namespace="{$xhtml}">
            <element name="main" namespace="{$xhtml}">
              <element name="section" namespace="{$xhtml}">
                <attribute name="id">blog</attribute>
                <apply-templates select=".//atom:entry" />
              </element>
              <element name="h2" namespace="{$xhtml}">
                <element name="a" namespace="{$xhtml}">
                  <attribute name="href">#blog</attribute>
                  <text>我的日志</text>
                </element>
              </element>
              <element name="section" namespace="{$xhtml}">
                <attribute name="id">about</attribute>
                <xsl:copy-of select="///about/xhtml:div/*" />
              </element>
              <element name="h2" namespace="{$xhtml}">
                <element name="a" namespace="{$xhtml}">
                  <attribute name="href">#about</attribute>
                  <text>自我介绍</text>
                </element>
              </element>
              <element name="h1" namespace="{$xhtml}">
                <value-of select=".//atom:title/text()" />
              </element>
              <element name="footer" namespace="{$xhtml}">
                <element name="p" namespace="{$xhtml}">
                  <element name="span" namespace="{$xhtml}">
                    <text>Powered by </text>
                    <element name="a" namespace="{$xhtml}">
                      <attribute name="href">
                        <value-of select=".//atom:generator/@uri" />
                      </attribute>
                      <value-of select=".//atom:generator/text()" />
                    </element>
                  </element>
                  <element name="span" namespace="{$xhtml}">
                    <value-of select=".//atom:rights/text()" />
                  </element>
                </element>
              </element>
            </element>
          </element>
        </element>
      </template>

      <template match="atom:entry">
        <element name="article" namespace="{$xhtml}">
          <attribute name="id">
            <value-of select="substring(.//atom:link[@rel='alternate']/@href, 2)" />
          </attribute>
          <element name="time" namespace="{$xhtml}">
            <attribute name="datetime">
              <value-of select="substring-before(.//atom:published/text(), 'T')" />
            </attribute>
            <value-of select="substring-before(.//atom:published/text(), 'T')" />
          </element>
          <copy-of select=".//atom:content/xhtml:div" />
        </element>
        <element name="h1" namespace="{$xhtml}">
          <element name="a" namespace="{$xhtml}">
            <attribute name="href">
              <value-of select=".//atom:link[@rel='alternate']/@href" />
            </attribute>
            <value-of select=".//atom:title/text()" />
          </element>
        </element>
        <element name="summary" namespace="{$xhtml}">
          <value-of select=".//atom:summary/text()" />
        </element>
      </template>
    </stylesheet>
  </xsl:template>
</xsl:stylesheet>
