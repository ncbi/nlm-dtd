Delivery notes:

The W3C XML Schema for Archiving and Interchange is available in two versions,
with (full) and without (light) MathML. Each contains three modules:

archivearticle.xsd [or archivearticlelight.xsd]
xlink.xsd
xml.xsd

In addition, the "full" version of the Schema, which includes MathML, contains a copy of MathML (see http://www.w3.org/Math/XMLSchema/). These files are not included with the "light" version.

Each of these modules corresponds to one of the namespaces in play:

archivearticle.xsd [null, default namespace]
xlink.xsd          [xlink namespace: http://www.w3.org/1999/xlink]
xml.xsd            [xml namespace: http://www.w3.org/XML/1998/namespace]

The modules import one another. For the schema to work all modules must
be in the same subdirectory. In order to keep separate xlink and xml schema modules aligned with the schemas they call, each version here has its own subdirectory.

THIS SCHEMA IS NOT INTENDED FOR MAINTENANCE. In order to mitigate problems found in testing with various processors' differing interpretations of Schema syntax, this Schema has been generated out of a flattened rendition of the NCBI Archive and Interchange DTD. While the structural constraints on document tagging expressed by this schema are identical to those of the DTD, the DTD's modular architecture is not reflected in the schema's organization. Changes to the schema must therefore be made by making the analogous changes to the DTD, and regenerating a schema from the modified DTD.

The Schema has been tested and found to perform properly in
1. Apache Xerces XML parser (for Java, version 2.5.0)
2. XML Spy (version 2004 rel.3)
3. Microsoft Word XML 2003 Professional (but see below).

The document element of an instance document, depending on the tools used, may require namespace and attribute declarations to associate the document with the schema. For Xerces and XMLSpy, these may take the form of:

<article xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:noNamespaceSchemaLocation="archivearticle.xsd">

where the xsi:noNamespaceSchemaLocation attribute points to the archivearticle.xsd module on the system.

=====
Cautions when using MS Word 2003 Professional:

The mechanism for associating a document with a schema in MS Word 2003 Professional differs considerably from the above. The declarations (namespace declaration for the xsi namespace, and the xsi:noNamespaceDeclaration attribute) are NOT required -- and may confuse the system.

A schema may be bound to a document in MS Word 2003 as follows:

1. Add the schema to the list of schemas available. This can be done (though only when an XML document is open) through the "XML Schema" tab under the "Templates and Add-ins" menu option (under "Tools"). When the schema is selected, Word will want a URI to associate with it (despite the fact that this document type has no default namespace). We have used the following:

URI: http://namespace.nih.gov/archivearticle.xsd
Alias: Archive and Interchange schema

When this schema is added, the XLink schema must also be added (it is imported by the main schema). Its URI is derived from the xlink.xsd file; we have used

Alias: W3C XLink schema

Then MSWord will want to attach the archivearticle.xsd schema again (presumably since it is imported by XLink). This operation can be cancelled.

2. In the XML Schema tab of the Templates and Add-ins dialog box, associate the open document with the schema by checking the box next to the schema in the list.

Use the "Save As XML" feature with the "Save Data only" box checked to save clean XML using only allowed tags.
