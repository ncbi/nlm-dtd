DELIVERY LETTER FOR THE DRAFT ARCHIVING AND INTERCHANGE DTD
               (Archiving (Green) Version 2.3 February 2, 2007)

                                               February 2007

------------------------------------------------------

This README describes:

   1.0 Files in this delivery:
       1.1  Catalog Files
       1.2  Modules Specific to the NLM Journal Archiving DTD
       1.3  DTD Suite: Critical Base Modules
       1.4  DTD Suite: Element Class Modules
       1.5  DTD Suite: Math Modules 
       1.6  DTD Suite: Table Modules
       1.7  DTD Suite: Notations and Special Characters
       1.8  Sample files for testing

A separate file will contain a description of the major
changes made between previous version and Version 2.3. These
changes are fully backwards compatible for XML documents
(document instances). That is, all documents that were valid 
to previous versions will be valid to Version 2.3.

------------------------------------------------------

1.0 FILES IN THIS DELIVERY

------------------------------------------------------

1.1 Catalog Files

These files are not part of the DTD Suite proper, but 
are provided as a convenience to implementors.

catalog-v2.xml - XML catalog made according to the
                 OASIS DTD Entity Resolution XML Catalog V2.1
"http://www.oasis-open.org/committees/entity/release/1.0/catalog.dtd"


catalog.ent - OASIS SOCAT catalog of the fpi and file names.
              This is the old style OASIS catalog, similar to
              SGML catalogs.
                           
------------------------------------------------------
1.2 Modules Specific to the NLM Journal Archiving DTD

archivearticle.dtd          
             - Main DTD for NLM Journal Archiving DTD;
               this is the DOCTYPE that covers a journal
               article and various other non-article
               journal content such as book and product 
               reviews. This DTD invokes almost all the 
               modules in the NLM Archiving and Interchange
               DTD Suite.

archivecustom-modules.ent 
             - Names all new modules created specifically
               for this DTD (therefore not part of the
               base DTD Suite)
               
               This module must be called as the first 
               module in the DTD, just before the Suite 
               Module of Modules %modules.ent;, which it
               supplements.

archivecustom-classes.ent
             - The DTD-specific class definitions for the 
               this DTD. Used to over-ride the Suite
               default classes.
               
               Declared in %archivecustom-modules.ent;
               Must be invoked before the default classes
               module.

archivecustom-mixes.ent
             - The DTD-specific mix definitions for the 
               this DTD. Used to over-ride the Suite
               default mixes.
               
               Declared in %archivecustom-modules.ent;
               Must be invoked before the default mixes
               module.

archivecustom-models.ent
             - The DTD-specific content model definitions 
               for this DTD. Used to over-ride the Suite
               default models.
               
               Declared in %archivecustom-modules.ent;
               Must be invoked before all of the DTD Suite
               modules since it is used to over-ride them.
            
               There are two types of such over-rides. Those 
               that replace a complete content model are
               named with a suffix "-model". Those that are 
               OR-groups of elements (intended to be mixed 
               with #PCDATA inside a particular model) are 
               named with an "-elements" suffix.

------------------------------------------------------

1.3 DTD Suite: Critical Base Modules

modules.ent      - Names all the modules in the NLM 
                   Archiving and Interchange DTD Suite
                                      
                   Must be called as the second module
                   by any DTD, after the DTD-specific module
                   of modules (if any) and before all other 
                   modules.
                   
                   NOTE: May name modules (such as the 
                   OASIS-Exchange module) that are not called 
                   by a particular DTD.

common.ent       - Defines all elements, attributes, entities
                   used by more than one module
                   
                   Called after all module-of-modules modules
                   and all customization (over-ride) modules
                   but before all the class modules. 

These modules need to be invoked before all other modules 
in a DTD. Other modules can usually be invoked in any order.
They are listed below alphabetically.


------------------------------------------------------

1.4 DTD Suite: Element Class Modules 
               (Define elements, attributes for one class)

articlemeta.ent  - Article-level metadata elements 
backmatter.ent   - Article-level back matter elements
display.ent      - Display elements such as Table, Figure, Graphic
format.ent       - Format-related elements such as Bold
journalmeta.ent  - Journal-level metadata elements
link.ent         - Linking elements such as X(Cross)-Reference
list.ent         - List elements
math.ent         - NLM-defined math elements such as Display Equation
para.ent         - Paragraph-level elements such as Paragraph and
                      Block Quote
phrase.ent       - Phrase-level content-related elements
references.ent   - Bibliographic reference list and the elements
                      that can be used inside a citation
section.ent      - Section-level elements


------------------------------------------------------

1.5 DTD Suite: Math Modules 
               (Define MathML tagging, used in %math.ent;)

These modules are defined in the Suite and should be invoked
from the DTD if MathML tagging is desired.

mathmlsetup.ent  - DTD Suite module that sets the parameter
                   entities for the MathML modules

The top-level MathML modules:
  mathml2.dtd
  mathml2-qname-1.mod

And inside the mathml subdirectory:
  mmlalias.ent
  mmlextra.ent

 
------------------------------------------------------

1.6 DTD Suite: Table Modules 
               (Define XHTML Table Model)

These modules are defined in the Suite and should be invoked
from the DTD if XHTML table tagging is desired. The XHTML
table model is the default table model for the NLM Suite.

XHTML Table Model
  XHTMLtablesetup.ent - NLM module to set up parameter
                        entities and attributes for
                        XHTML table processing
  xhtml-table-1.mod     XHTML v1.1 DTD module
  xhtml-inlstyle-1.mod  XHTML v1.1 style attribute module

If an organization wishes to use the OASIS Exchange CALS table 
model instead of OR IN ADDITION TO the XHTML model, the
following modules should be integrated into the DTD:

OASIS Exchange CALS Table Model
  oasis-tablesetup.ent - NLM module to set up parameter
                        entities and attributes for
                        OASIS Exchange CALS table processing
  oasis-exchange.ent    Basic CALS table model

------------------------------------------------------

1.7 DTD Suite: Notations and Special Characters

notat.ent        - Names all Notations used

chars.ent        - Defines NLM-specific and custom special
                   characters (as general entities defined
                   as hexadecimal or decimal character
                   entities [Unicode numbers] or by using
                   the <private-char> element).

xmlspecchars.ent - Names all the standard special character
                   entity sets to be used by the DTD. The
                   MathML characters sets were used,
                   unchanged, in the same directory
                   structure used for MathML.

All the MathML special character entity sets:

(inside the iso8879 subdirectory)
  isobox.ent
  isocyr1.ent
  isocyr2.ent
  isodia.ent
  isolat1.ent
  isolat2.ent
  isonum.ent
  isopub.ent

(inside the iso9573-13 subdirectory)
  isoamsa.ent
  isoamsb.ent
  isoamsc.ent
  isoamsn.ent
  isoamso.ent
  isoamsr.ent
  isogrk3.ent
  isomfrk.ent
  isomopf.ent
  isomscr.ent
  isotech.ent

Special character entity sets NOT used in MathML
(included as part of the DTD for backwards compatibility)  

(inside the xmlchars subdirectory)
  isogrk1.ent
  isogrk2.ent
  isogrk4.ent
 
 
------------------------------------------------------

1.8 Sample files for testing Green (Archiving)

samplesmall-archive.xml - Minimal document used to test the 
                          archiving DTD
                       
-------------  document end -------------------------------






















