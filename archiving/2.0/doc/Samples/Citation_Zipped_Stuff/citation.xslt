<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
   <xsl:strip-space elements="*"/>
   <xsl:template match="/">
      <html>
         <head>
            <title>Sample PMC Citations</title>
         </head>
         <body>
            <a name="top"/>
            <h1>Sample PMC Citations</h1>
            <ul>
               <xsl:apply-templates select="//title" mode="index"/>
            </ul>
            <xsl:apply-templates/>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="chapter">
      <xsl:apply-templates select="node()[not(self::no)]"/>
      <hr noshade="noshade"/>
   </xsl:template>
   <xsl:template match="part">
      <hr/>
      <hr/>
      <ul>
         <xsl:apply-templates/>
      </ul>
   </xsl:template>
   <!-- ======== In text title templates ================== -->
   <xsl:template match="part/title">
      <h1>
         <a name="{generate-id()}">
            <xsl:apply-templates/>
         </a>
      </h1>
   </xsl:template>
   <xsl:template match="chapter/title">
      <h2>
         <xsl:apply-templates select="../no"/>
         <xsl:text> </xsl:text>
         <a name="{generate-id()}">
            <xsl:apply-templates/>
         </a>
      </h2>
   </xsl:template>
   <xsl:template match="reflist/title">
      <h3>
         <a name="{generate-id()}">
            <xsl:apply-templates/>
         </a>
         <xsl:text> </xsl:text>
         <a href="#top">[top]</a>
      </h3>
   </xsl:template>
   <xsl:template match="reflist/reflist/title">
      <h4>
         <a name="{generate-id()}">
            <xsl:apply-templates/>
         </a>
         <xsl:text> </xsl:text>
         <a href="#top">[top]</a>
      </h4>
   </xsl:template>
   <xsl:template match="reflist/reflist//reflist/title">
      <b>
         <a name="{generate-id()}">
            <xsl:apply-templates/>
         </a>
      </b>
   </xsl:template>
   <!-- ========================================-->
   <!-- ========= Index templates ================== -->
   <xsl:template match="part/title" mode="index">
      <br/>
      <br/>
      <b>
         <font size="+1">
            <a href="#{generate-id()}">
               <xsl:apply-templates/>
            </a>
         </font>
      </b>
   </xsl:template>
   <xsl:template match="chapter/title" mode="index">
      <br/>
      <xsl:apply-templates select="../no"/>
      <xsl:text> </xsl:text>
      <a href="#{generate-id()}">
         <xsl:apply-templates/>
      </a>
   </xsl:template>
   <xsl:template match="reflist/title" mode="index">
      <ul>
         <a href="#{generate-id()}">
            <xsl:apply-templates/>
         </a>
      </ul>
   </xsl:template>
   <xsl:template match="reflist/reflist/title" mode="index">
      <ul>
         <ul>
            <a href="#{generate-id()}">
               <xsl:apply-templates/>
            </a>
         </ul>
      </ul>
   </xsl:template>
   <xsl:template match="reflist/reflist/reflist/title" mode="index">
      <ul>
         <ul>
            <ul>
               <a href="#{generate-id()}">
                  <xsl:apply-templates/>
               </a>
            </ul>
         </ul>
      </ul>
   </xsl:template>
   <!-- ========================================-->
   <!-- ========== reflist templates ================= -->
   <xsl:template match="reflist/reflist">
      <ul>
         <xsl:apply-templates/>
      </ul>
   </xsl:template>
   <xsl:template match="reflist/reflist/reflist">
      <xsl:apply-templates select="title"/>
      <ul>
         <xsl:apply-templates select="ref | reflist"/>
      </ul>
   </xsl:template>
   <xsl:template match="reflist/reflist/reflist/reflist">
      <br/>
      <xsl:apply-templates select="title"/>
      <xsl:apply-templates select="ref"/>
   </xsl:template>
   <!-- ========================================-->
   <xsl:template match="ref">
      <p>
         <xsl:apply-templates/>
      </p>
   </xsl:template>
   <xsl:template match="label">
      <b>
         <xsl:apply-templates/>
      </b>
   </xsl:template>
   <xsl:template match="citation">
      <xsl:variable name="augroupcount" select="count(person-group) + count(collab)"/>
      <xsl:choose>
         <xsl:when test="@citation-type='book' or @citation-type='thesis' ">
            <!--		<xsl:apply-templates select="*[not(self::annotation)]|text()" mode="book"/> -->
            <xsl:choose>
               <xsl:when test="$augroupcount>1 and person-group[@person-group-type!='author'] and atitle ">
                  <xsl:apply-templates select="person-group[@person-group-type='author']" mode="book"/>
                  <xsl:apply-templates select="collab"/>
                  <xsl:apply-templates select="atitle" mode="editedbook"/>
                  <xsl:text>In: </xsl:text>
                  <xsl:apply-templates select="person-group[@person-group-type='editor'] | person-group[@person-group-type='allauthors'] | person-group[@person-group-type='translator']  | person-group[@person-group-type='transed'] " mode="book"/>
                  <xsl:apply-templates select="source" mode="book"/>
                  <xsl:apply-templates select="edition" mode="book"/>
                  <xsl:apply-templates select="volume" mode="book"/>
                  <xsl:apply-templates select="trans-source" mode="book"/>
                  <xsl:apply-templates select="publisher-name | publisher-loc"/>
                  <xsl:apply-templates select="year | month | time-stamp | season | access-date" mode="book"/>
                  <xsl:apply-templates select="fpage | lpage" mode="book"/>
               </xsl:when>
               <xsl:when test="person-group[@person-group-type='author'] or person-group[@person-group-type='compiler']">
                  <xsl:apply-templates select="person-group[@person-group-type='author'] |  person-group[@person-group-type='compiler']" mode="book"/>
                  <xsl:apply-templates select="collab"/>
                  <xsl:apply-templates select="source" mode="book"/>
                  <xsl:apply-templates select="person-group[@person-group-type='editor'] | person-group[@person-group-type='translator']  | person-group[@person-group-type='transed'] " mode="book"/>
                  <xsl:apply-templates select="edition" mode="book"/>
                  <xsl:apply-templates select="volume" mode="book"/>
                  <xsl:apply-templates select="trans-source" mode="book"/>
                  <xsl:apply-templates select="publisher-name | publisher-loc"/>
                  <xsl:apply-templates select="year | month | time-stamp | season | access-date" mode="book"/>
                  <xsl:apply-templates select="atitle | fpage | lpage" mode="book"/>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:apply-templates select="person-group[@person-group-type='editor'] | person-group[@person-group-type='translator']  | person-group[@person-group-type='transed'] | person-group[@person-group-type='guest-editor']" mode="book"/>
                  <xsl:apply-templates select="collab"/>
                  <xsl:apply-templates select="source" mode="book"/>
                  <xsl:apply-templates select="edition" mode="book"/>
                  <xsl:apply-templates select="volume" mode="book"/>
                  <xsl:apply-templates select="trans-source" mode="book"/>
                  <xsl:apply-templates select="publisher-name | publisher-loc"/>
                  <xsl:apply-templates select="year | month | time-stamp | season | access-date" mode="book"/>
                  <xsl:apply-templates select="atitle | fpage | lpage" mode="book"/>
               </xsl:otherwise>
            </xsl:choose>
            <xsl:apply-templates select="series | other-ref"/>
         </xsl:when>
         <!-- CONFERENCE PROCEEDINGS -->
         <xsl:when test="@citation-type='confproc'">
            <xsl:choose>
               <xsl:when test="$augroupcount>1 and person-group[@person-group-type!='author']">
                  <xsl:apply-templates select="person-group[@person-group-type='author']" mode="book"/>
                  <xsl:apply-templates select="collab"/>
                  <xsl:apply-templates select="atitle" mode="inconf"/>
                  <xsl:text>In: </xsl:text>
                  <xsl:apply-templates select="person-group[@person-group-type='editor'] | person-group[@person-group-type='allauthors'] | person-group[@person-group-type='translator']  | person-group[@person-group-type='transed'] " mode="book"/>
                  <xsl:apply-templates select="source" mode="conf"/>
                  <xsl:apply-templates select="conf-name | conf-date | conf-loc" mode="conf"/>
                  <xsl:apply-templates select="publisher-loc"/>
                  <xsl:apply-templates select="publisher-name"/>
                  <xsl:apply-templates select="year | month | time-stamp | season | access-date" mode="book"/>
                  <xsl:apply-templates select="fpage | lpage" mode="book"/>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:apply-templates select="person-group" mode="book"/>
                  <xsl:apply-templates select="collab"/>
                  <xsl:apply-templates select="atitle" mode="conf"/>
                  <xsl:apply-templates select="source" mode="conf"/>
                  <xsl:apply-templates select="conf-name | conf-date | conf-loc" mode="conf"/>
                  <xsl:apply-templates select="publisher-loc"/>
                  <xsl:apply-templates select="publisher-name"/>
                  <xsl:apply-templates select="year | month | time-stamp | season | access-date" mode="book"/>
                  <xsl:apply-templates select="fpage | lpage" mode="book"/>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <!-- END CONFERENCE PROCEEDINGS -->
         <!-- GOVERNMENT AND OTHER REPORTS and OTHER and WEB and COMMUN -->
         <xsl:when test="@citation-type='gov' or @citation-type='other' or @citation-type='web' or @citation-type='commun' ">
            <xsl:apply-templates select="person-group" mode="book"/>
            <xsl:apply-templates select="collab"/>
            <xsl:choose>
               <xsl:when test="publisher-loc | publisher-name">
                  <xsl:apply-templates select="source" mode="book"/>
                  <xsl:apply-templates select="edition"/>
                  <xsl:apply-templates select="publisher-loc"/>
                  <xsl:apply-templates select="publisher-name"/>
                  <xsl:apply-templates select="year | month | time-stamp | season | access-date" mode="book"/>
                  <xsl:apply-templates select="atitle|gov"/>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:apply-templates select="atitle|gov"/>
                  <xsl:apply-templates select="source" mode="book"/>
                  <xsl:apply-templates select="edition"/>
                  <xsl:apply-templates select="publisher-loc"/>
                  <xsl:apply-templates select="publisher-name"/>
                  <xsl:apply-templates select="year | month | time-stamp | season | access-date" mode="book"/>
               </xsl:otherwise>
            </xsl:choose>
            <xsl:apply-templates select="fpage | lpage" mode="book"/>
            <xsl:apply-templates select="series | other-ref"/>
         </xsl:when>
         <!-- PATENTS  -->
         <xsl:when test="@citation-type='patent'">
            <xsl:apply-templates select="person-group" mode="book"/>
            <xsl:apply-templates select="collab"/>
            <xsl:apply-templates select="atitle | transtitle"/>
            <xsl:apply-templates select="source"/>
            <xsl:apply-templates select="patent"/>
            <xsl:apply-templates select="year | month | time-stamp | season | access-date" mode="book"/>
            <xsl:apply-templates select="fpage | lpage" mode="book"/>
            <xsl:apply-templates select="series | other-ref"/>
         </xsl:when>
         <!-- DISCUSSION  -->
         <xsl:when test="@citation-type='discussion'">
            <xsl:apply-templates select="person-group" mode="book"/>
            <xsl:apply-templates select="collab"/>
            <xsl:apply-templates select="atitle" mode="editedbook"/>
            <xsl:text>In: </xsl:text>
            <xsl:apply-templates select="source"/>
            <xsl:if test="publisher-name | publisher-loc">
               <xsl:text> [</xsl:text>
               <xsl:apply-templates select="publisher-loc"/>
               <xsl:value-of select="publisher-name"/>
               <xsl:text>]; </xsl:text>
            </xsl:if>
            <xsl:apply-templates select="year | month | time-stamp | season | access-date" mode="book"/>
            <xsl:apply-templates select="fpage | lpage" mode="book"/>
            <xsl:apply-templates select="series | other-ref"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:apply-templates select="*[not(self::annotation)]|text()"/>
         </xsl:otherwise>
      </xsl:choose>
      <!-- This piece grabs the language from the translated title and writes it after the citation -->
      <xsl:if test="atitle[@xml:lang!='en'] or atitle[@xml:lang!='EN']">
         <xsl:call-template name="language">
            <xsl:with-param name="lang" select="atitle/@xml:lang"/>
         </xsl:call-template>
      </xsl:if>
      <xsl:if test="source[@xml:lang!='en'] or source[@xml:lang!='EN']">
         <xsl:call-template name="language">
            <xsl:with-param name="lang" select="source/@xml:lang"/>
         </xsl:call-template>
      </xsl:if>
      <xsl:apply-templates select="annotation"/>
   </xsl:template>
   <!-- Default (Journal) citation templates -->
   <xsl:template match="person-group">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="name">
      <xsl:variable name="nodetotal" select="count(../*)"/>
      <xsl:variable name="position" select="position()"/>
      <xsl:choose>
         <xsl:when test="given-names">
            <xsl:apply-templates select="surname"/>
            <xsl:text> </xsl:text>
            <xsl:apply-templates select="given-names"/>
            <xsl:if test="suffix">
               <xsl:text>, </xsl:text>
               <xsl:apply-templates select="suffix"/>
            </xsl:if>
         </xsl:when>
         <xsl:otherwise>
            <xsl:apply-templates select="surname"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:choose>
         <xsl:when test="following-sibling::aff"/>
         <xsl:otherwise>
            <xsl:choose>
               <xsl:when test="$nodetotal=$position">. </xsl:when>
               <xsl:otherwise>, </xsl:otherwise>
            </xsl:choose>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="aff">
      <xsl:variable name="nodetotal" select="count(../*)"/>
      <xsl:variable name="position" select="position()"/>
      <xsl:text> (</xsl:text>
      <xsl:apply-templates/>
      <xsl:text>)</xsl:text>
      <xsl:choose>
         <xsl:when test="$nodetotal=$position">. </xsl:when>
         <xsl:otherwise>, </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="etal">
      <xsl:text>et al. </xsl:text>
   </xsl:template>
   <xsl:template match="atitle|gov">
      <xsl:choose>
         <xsl:when test="../transtitle">
            <xsl:apply-templates/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:apply-templates/>
            <xsl:text>. </xsl:text>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="transtitle">
      <xsl:text> [</xsl:text>
      <xsl:apply-templates/>
      <xsl:text>]. </xsl:text>
   </xsl:template>
   <xsl:template match="access-date">
      <xsl:text> [</xsl:text>
      <xsl:apply-templates/>
      <xsl:text>];</xsl:text>
   </xsl:template>
   <xsl:template match="transtitle">
      <xsl:text> [</xsl:text>
      <xsl:apply-templates/>
      <xsl:text>]. </xsl:text>
   </xsl:template>
   <xsl:template match="collab">
      <xsl:apply-templates/>
      <xsl:if test="@collab-type">
         <xsl:text>, </xsl:text>
         <xsl:value-of select="@collab-type"/>
      </xsl:if>
      <xsl:choose>
         <xsl:when test="following-sibling::collab">
            <xsl:text>; </xsl:text>
         </xsl:when>
         <xsl:otherwise>
            <xsl:text>. </xsl:text>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="source">
      <xsl:apply-templates/>
      <xsl:choose>
         <xsl:when test="../access-date">
            <xsl:text>. </xsl:text>
         </xsl:when>
         <xsl:when test="../volume | ../fpage">
            <xsl:text> </xsl:text>
         </xsl:when>
         <xsl:otherwise>
            <xsl:text>. </xsl:text>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="year">
      <xsl:choose>
         <xsl:when test="../month or ../season or ../access-date">
            <xsl:apply-templates/>
            <xsl:text> </xsl:text>
         </xsl:when>
         <xsl:otherwise>
            <xsl:apply-templates/>
            <xsl:if test="../volume or ../issue">
               <xsl:text>;</xsl:text>
            </xsl:if>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="month">
      <xsl:variable name="month" select="."/>
      <xsl:choose>
         <xsl:when test="$month='01' or $month='1' or $month='January'">Jan</xsl:when>
         <xsl:when test="$month='02' or $month='2' or $month='February'">Feb</xsl:when>
         <xsl:when test="$month='03' or $month='3' or $month='March'">Mar</xsl:when>
         <xsl:when test="$month='04' or $month='4' or $month='April'">Apr</xsl:when>
         <xsl:when test="$month='05' or $month='5' or $month='May'">May</xsl:when>
         <xsl:when test="$month='06' or $month='6' or $month='June'">Jun</xsl:when>
         <xsl:when test="$month='07' or $month='7' or $month='July'">Jul</xsl:when>
         <xsl:when test="$month='08' or $month='8' or $month='August'">Aug</xsl:when>
         <xsl:when test="$month='09' or $month='9' or $month='September'">Sep</xsl:when>
         <xsl:when test="$month='10' or $month='October'">Oct</xsl:when>
         <xsl:when test="$month='11' or $month='November'">Nov</xsl:when>
         <xsl:when test="$month='12' or $month='December'">Dec</xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$month"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:if test="../day">
         <xsl:text> </xsl:text>
         <xsl:value-of select="../day"/>
      </xsl:if>
      <xsl:text>;</xsl:text>
   </xsl:template>
   <xsl:template match="day"/>
   <xsl:template match="season">
      <xsl:apply-templates/>
      <xsl:text>; </xsl:text>
   </xsl:template>
   <xsl:template match="patent | edition">
      <xsl:apply-templates/>
      <xsl:text>. </xsl:text>
   </xsl:template>
   <xsl:template match="volume">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="supplement">
      <xsl:text> </xsl:text>
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="issue">
      <xsl:text>(</xsl:text>
      <xsl:apply-templates/>
      <xsl:text>)</xsl:text>
   </xsl:template>
   <xsl:template match="fpage">
      <xsl:choose>
         <xsl:when test="../lpage">
            <xsl:text>:</xsl:text>
            <xsl:apply-templates/>
            <xsl:text>-</xsl:text>
         </xsl:when>
         <xsl:otherwise>
            <xsl:text>:</xsl:text>
            <xsl:apply-templates/>
            <xsl:text>.</xsl:text>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="lpage">
      <xsl:apply-templates/>
      <xsl:text>.</xsl:text>
   </xsl:template>
   <xsl:template match="series">
      <xsl:text> (</xsl:text>
      <xsl:apply-templates/>
      <xsl:text>).</xsl:text>
   </xsl:template>
   <xsl:template match="other-ref">
      <xsl:text> </xsl:text>
      <xsl:apply-templates/>
      <xsl:text>. </xsl:text>
      <!--      <xsl:choose>
         <xsl:when test="exlnk"/>
         <xsl:otherwise><xsl:text>.</xsl:text></xsl:otherwise>
      </xsl:choose> -->
   </xsl:template>
   <xsl:template match="annotation">
      <br/>
      <font color="blue">
         <xsl:text> [</xsl:text>
         <xsl:apply-templates/>
         <xsl:text>]</xsl:text>
      </font>
   </xsl:template>
   <xsl:template match="exlnk">
      <xsl:if test="@exlnk-type='url'">
         <xsl:choose>
            <xsl:when test="contains(@href,'http://')">
               <a href="{@href}">
                  <xsl:apply-templates/>
               </a>
            </xsl:when>
            <xsl:otherwise>
               <a>
                  <xsl:attribute name="href"><xsl:text>href://</xsl:text><xsl:value-of select="@href"/></xsl:attribute>
                  <xsl:apply-templates/>
               </a>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:if>
   </xsl:template>
   <!-- ***************************** End Default (Journal) citation templates ************************** -->
   <!-- ***************************** Book citation templates ******************************************** -->
   <xsl:template match="person-group" mode="book">
      <xsl:variable name="auno" select="count(name)"/>
      <xsl:choose>
         <xsl:when test="@person-group-type='editor'">
            <xsl:apply-templates mode="book"/>
            <xsl:choose>
               <xsl:when test="$auno > 1">
                  <xsl:text>  editors. </xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>  editor. </xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="@person-group-type='assignee'">
            <xsl:apply-templates mode="book"/>
            <xsl:choose>
               <xsl:when test="$auno > 1">
                  <xsl:text>  assignees. </xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>  assignee. </xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="@person-group-type='translator'">
            <xsl:apply-templates mode="book"/>
            <xsl:choose>
               <xsl:when test="$auno > 1">
                  <xsl:text>  translators. </xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>  translator. </xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="@person-group-type='transed'">
            <xsl:apply-templates mode="book"/>
            <xsl:choose>
               <xsl:when test="$auno > 1">
                  <xsl:text>  translators and editors. </xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>  translator and editor. </xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="@person-group-type='guest-editor'">
            <xsl:apply-templates mode="book"/>
            <xsl:choose>
               <xsl:when test="$auno > 1">
                  <xsl:text>  guest editors. </xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>  guest editor. </xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="@person-group-type='compiler'">
            <xsl:apply-templates mode="book"/>
            <xsl:choose>
               <xsl:when test="$auno > 1">
                  <xsl:text>  compilers. </xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>  compiler. </xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="@person-group-type='inventor'">
            <xsl:apply-templates mode="book"/>
            <xsl:choose>
               <xsl:when test="$auno > 1">
                  <xsl:text>  inventors; </xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>  inventor; </xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:otherwise>
            <xsl:apply-templates mode="book"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="name" mode="book">
      <xsl:variable name="nodetotal" select="count(../*)"/>
      <xsl:variable name="position" select="position()"/>
      <xsl:choose>
         <xsl:when test="given-names">
            <xsl:apply-templates select="surname"/>
            <xsl:text>, </xsl:text>
            <xsl:apply-templates select="given-names"/>
            <xsl:if test="suffix">
               <xsl:text>, </xsl:text>
               <xsl:apply-templates select="suffix"/>
            </xsl:if>
         </xsl:when>
         <xsl:otherwise>
            <xsl:apply-templates select="surname"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:choose>
         <xsl:when test="following-sibling::aff"/>
         <xsl:otherwise>
            <xsl:choose>
               <xsl:when test="$nodetotal=$position">. </xsl:when>
               <xsl:otherwise>; </xsl:otherwise>
            </xsl:choose>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="etal" mode="book">
      <xsl:text>et al. </xsl:text>
   </xsl:template>
   <xsl:template match="aff" mode="book">
      <xsl:variable name="nodetotal" select="count(../*)"/>
      <xsl:variable name="position" select="position()"/>
      <xsl:text> (</xsl:text>
      <xsl:apply-templates/>
      <xsl:text>)</xsl:text>
      <xsl:choose>
         <xsl:when test="$nodetotal=$position">. </xsl:when>
         <xsl:otherwise>, </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="publisher-loc">
      <xsl:apply-templates/>
      <xsl:text>: </xsl:text>
   </xsl:template>
   <xsl:template match="publisher-name">
      <xsl:apply-templates/>
      <xsl:text>; </xsl:text>
   </xsl:template>
   <xsl:template match="fpage" mode="book">
      <xsl:choose>
         <xsl:when test="../lpage">
            <xsl:text>p. </xsl:text>
            <xsl:apply-templates/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:text>p. </xsl:text>
            <xsl:apply-templates/>
            <xsl:text>.</xsl:text>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="lpage" mode="book">
      <xsl:choose>
         <xsl:when test="../fpage">
            <xsl:text>-</xsl:text>
            <xsl:apply-templates/>
            <xsl:text>.</xsl:text>
         </xsl:when>
         <xsl:otherwise>
            <xsl:apply-templates/>
            <xsl:text> p.</xsl:text>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="volume | edition | season | collab" mode="book">
      <xsl:apply-templates/>
      <xsl:text>. </xsl:text>
   </xsl:template>
   <xsl:template match="atitle" mode="book">
      <xsl:apply-templates/>
      <xsl:choose>
         <xsl:when test="../fpage or ../lpage">
            <xsl:text>; </xsl:text>
         </xsl:when>
         <xsl:otherwise>
            <xsl:text>.</xsl:text>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="atitle" mode="editedbook">
      <xsl:apply-templates/>
      <xsl:text>. </xsl:text>
   </xsl:template>
   <xsl:template match="source" mode="book">
      <xsl:choose>
         <xsl:when test="../trans-source">
            <xsl:apply-templates/>
            <xsl:choose>
               <xsl:when test="../volume | ../edition">
                  <xsl:text>. </xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text> </xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:otherwise>
            <xsl:apply-templates/>
            <xsl:text>. </xsl:text>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="trans-source | access-date" mode="book">
      <xsl:text> [</xsl:text>
      <xsl:apply-templates/>
      <xsl:text>]. </xsl:text>
   </xsl:template>
   <xsl:template match="year" mode="book">
      <xsl:choose>
         <xsl:when test="../month or ../season or ../access-date">
            <xsl:apply-templates/>
            <xsl:text> </xsl:text>
         </xsl:when>
         <xsl:otherwise>
            <xsl:apply-templates/>
            <xsl:text>. </xsl:text>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="month" mode="book">
      <xsl:variable name="month" select="."/>
      <xsl:choose>
         <xsl:when test="$month='01' or $month='1' or $month='January'">Jan</xsl:when>
         <xsl:when test="$month='02' or $month='2' or $month='February'">Feb</xsl:when>
         <xsl:when test="$month='03' or $month='3' or $month='March'">Mar</xsl:when>
         <xsl:when test="$month='04' or $month='4' or $month='April'">Apr</xsl:when>
         <xsl:when test="$month='05' or $month='5' or $month='May'">May</xsl:when>
         <xsl:when test="$month='06' or $month='6' or $month='June'">Jun</xsl:when>
         <xsl:when test="$month='07' or $month='7' or $month='July'">Jul</xsl:when>
         <xsl:when test="$month='08' or $month='8' or $month='August'">Aug</xsl:when>
         <xsl:when test="$month='09' or $month='9' or $month='September'">Sep</xsl:when>
         <xsl:when test="$month='10' or $month='October'">Oct</xsl:when>
         <xsl:when test="$month='11' or $month='November'">Nov</xsl:when>
         <xsl:when test="$month='12' or $month='December'">Dec</xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$month"/>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:if test="../day">
         <xsl:text> </xsl:text>
         <xsl:value-of select="../day"/>
      </xsl:if>
      <xsl:choose>
         <xsl:when test="../time-stamp">
            <xsl:text>, </xsl:text>
            <xsl:value-of select="../time-stamp"/>
            <xsl:text> </xsl:text>
         </xsl:when>
         <xsl:when test="../access-date"/>
         <xsl:otherwise>
            <xsl:text>. </xsl:text>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="time-stamp" mode="book"/>
   <!-- **************************** End Book citation templates ***************************************  -->
   <!-- **************************** Conference citation templates ***************************************  -->
   <xsl:template match="atitle" mode="conf">
      <xsl:apply-templates/>
      <xsl:choose>
         <xsl:when test="../conf-name">
            <xsl:text>. </xsl:text>
         </xsl:when>
         <xsl:otherwise>
            <xsl:text>; </xsl:text>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="atitle" mode="inconf">
      <xsl:apply-templates/>
      <xsl:text>. </xsl:text>
   </xsl:template>
   <xsl:template match="conf-name | source | conf-date" mode="conf">
      <xsl:apply-templates/>
      <xsl:text>; </xsl:text>
   </xsl:template>
   <xsl:template match="conf-loc" mode="conf">
      <xsl:apply-templates/>
      <xsl:text>. </xsl:text>
   </xsl:template>
   <!-- ************************** End Conference citation templates **********************************  -->
   <!-- Language template -->
   <xsl:template name="language">
      <xsl:param name="lang"/>
      <xsl:choose>
         <xsl:when test="$lang='fr' or $lang='FR'"> (Fre).</xsl:when>
         <xsl:when test="$lang='jp' or $lang='JP'"> (Jpn).</xsl:when>
         <xsl:when test="$lang='ru' or $lang='RU'"> (Rus).</xsl:when>
         <xsl:when test="$lang='de' or $lang='DE'"> (Ger).</xsl:when>
         <xsl:when test="$lang='se' or $lang='SE'"> (Swe).</xsl:when>
         <xsl:when test="$lang='it' or $lang='IT'"> (Ita).</xsl:when>
         <xsl:when test="$lang='he' or $lang='HE'"> (Heb).</xsl:when>
         <xsl:when test="$lang='sp' or $lang='SP'"> (Spa).</xsl:when>
      </xsl:choose>
   </xsl:template>
</xsl:stylesheet>
