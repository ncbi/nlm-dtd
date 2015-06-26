Delivery notes:

The enclosed W3C XML Schema contains three main modules:

historical.xsd
xlink.xsd
xml.xsd

In addition, a subdirectory contains a copy of MathML (see http://www.w3.org/Math/XMLSchema/), which provides additional modules.

Each of these modules corresponds to one of the namespaces in play:

historical.xsd        [null, default namespace]
xlink.xsd             [xlink namespace: http://www.w3.org/1999/xlink]
xml.xsd               [xml namespace: http://www.w3.org/XML/1998/namespace]
mathml2/mathml2.xsd   [mathml namespace: http://www.w3.org/1998/Math/MathML]

THIS SCHEMA IS NOT INTENDED FOR MAINTENANCE. This Schema has been generated out of a flattened rendition of the corresponding NCBI DTD. While the structural constraints on document tagging expressed by this schema are identical to those of the DTD, the DTD's modular architecture is not reflected in the schema's organization. Changes to the schema must therefore be made by making the analogous changes to the DTD, and regenerating a schema from the modified DTD.

The Schema has been tested and found to perform properly in
1. syncROsoft oXygen (version 6.2; using Xerces)
2. XML Spy (version 2004 rel.3)
3. Microsoft Word XML 2003 Professional (see below)

Users of other tools may find anomalies due to discrepancies in various processors' differing interpretations of Schema syntax. In such cases, it is recommended to use the normative version of the relevant NCBI DTD.

The document element of an instance document, depending on the tools used, may require namespace and attribute declarations to associate the document with the schema. These will typically take the form of:

<article xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:noNamespaceSchemaLocation="historical.xsd">

where the xsi:noNamespaceSchemaLocation attribute points to the historical.xsd module on the system, and the settings appear on the root element of your document (which may or may not be <article>).

=====
Cautions when using MS Word 2003 Professional:

A schema may be bound to a document in MS Word 2003 as follows:

1. Add the historical.xsd schema to the list of schemas available. This can be done (though only when a document is open) through the "XML Schema" tab under the "Templates and Add-ins" menu option (under "Tools"). When the schema is selected, Word will want a URI to associate with it (despite the fact that this document type has no default namespace). We have used the following:

Historical Book
URI: http://namespace.nih.gov/historical.xsd
Alias: NCBI Historical Book schema

On adding this namespace, you will be asked also to identify the modules

XLink namespace
URI: http://www.w3.org/1999/xlink
Alias: W3C XLink namespace

XML namespace
URI: http://www.w3.org/XML/1998/namespace
Alias: W3C XML namespace

MathML
URI: http://www.w3.org/1998/Math/MathML
Alias: W3C MathML2 schema

2. In the XML Schema tab of the Templates and Add-ins dialog box, associate the open document with the schema by checking the box next to the schema in the list.

Use the "Save As XML" feature with the "Save Data only" box checked to save clean XML using only allowed tags.
