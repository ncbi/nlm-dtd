DELIVERY LETTER FOR THE JOURNAL PUBLISHING DTD
           (Publishing (Blue) Version 2.2 April 30, 2006)


------------------------------------------------------

This README describes:

   1.0 The Publishing (Blue) DTD Version 2.2
   2.0 Files in this delivery:
       2.1  Catalog Files
       2.2  Modules Specific to the NLM Journal Publishing DTD
       2.3  DTD Suite: Critical Base Modules
       2.4  DTD Suite: Element Class Modules
       2.5  DTD Suite: Math Modules 
       2.6  DTD Suite: Table Modules
       2.7  DTD Suite: Notations and Special Characters

------------------------------------------------------

1.0 Publishing (Blue) DTD VERSION Version 2.2 April 2006


Version 2.2 was a minor dot release that added many new
attribute values and a few elements, based on production
needs of NLM and other users.

Not all files were changed in this release. The following Suite
modules were changed:

 - articlemeta.ent
 - common.ent
 - default-classes.ent
 - display.ent
 - modules.ent
 - para.ent
 - references.ent
 - section.ent
 
In addition, the following DTD-specific modules were
altered:

- journalpublishing.dtd
- journalpubcustom-models.ent
- journalpubcustom-modules.ent

------------------------------------------------------

2.0 FILES IN THIS DELIVERY

------------------------------------------------------

2.1 Catalog Files

These files are not part of the DTD Suite proper, but 
are provided as a convenience to implementors.

catalog-v2.xml - XML catalog made according to the
                 OASIS DTD Entity Resolution XML Catalog V2.2
"http://www.oasis-open.org/committees/entity/release/1.0/catalog.dtd"


catalog.ent - OASIS SOCAT catalog of the fpi and file names.
              This is the old style OASIS catalog, similar to
              SGML catalogs.

------------------------------------------------------

2.2 Modules Specific to the NLM Journal Publishing DTD

journalpublishing.dtd          
             - Main DTD for NLM Journal Publishing DTD;
               this is the DOCTYPE that covers a journal
               article and various other non-article
               journal content such as book and product 
               reviews. This DTD invokes almost all the 
               modules in the NLM Archiving and Interchange
               DTD Suite.

journalpubcustom-modules.ent 
             - Names all new modules created specifically
               for this DTD (therefore not part of the
               base DTD Suite)
               
               Must be called as the first module in 
               the DTD, just before the Suite Module
               of Modules %modules.ent;

journalpubcustom-classes.ent
             - The DTD-specific class definitions for the 
               this DTD. Used to over-ride the Suite
               default classes. 
               
               Declared in %journalpubcustom-modules.ent;.
               Must be invoked before the default classes
               module.

journalpubcustom-mixes.ent
             - The DTD-specific mix definitions for the 
               this DTD. Used to over-ride the Suite
               default mixes. 
               
               Declared in %journalpubcustom-modules.ent;.
               Must be invoked before the default mixes
               module.

journalpubcustom-models.ent
             - The DTD-specific content model definitions 
               for the this DTD. Used to over-ride the Suite
               default models. 
               
               Declared in %journalpubcustom-modules.ent;.
               Must be invoked before all of the DTD Suite
               modules since it is used to over-ride them.
            
               There are two types of such over-rides. Those 
               Ththat replace a complete content model are
               named with a suffix "-model". Those that are 
               OR-groups of elements (intended to be mixed 
               with #PCDATA inside a particular model) are 
               named with an "-elements" suffix.

------------------------------------------------------

2.3 DTD Suite: Critical Base Modules

modules.ent      - Names all the modules in the NLM 
                   Archiving and Interchange DTD Suite
                   
                   Must be called as the second module
                   by any DTD, after the DTD-specific module
                   of modules (if any) and before all other 
                   modules.
                   
                   NOTE: This modules may name modules (such as 
                   the OASIS-Exchange module) that are NOT used 
                   by this DTD.

common.ent       - Defines all elements, attributes, and
                   entities used by more than one module
                   
                   Called after all module-of-modules modules
                   and all customization (over-ride) modules
                   but before all the class modules. 

These modules need to be invoked before all other modules 
in a DTD. Other modules can usually be invoked in any order.
They are listed below alphabetically.

default-classes.ent       
                 - Sets up the original class definitions,
                   which are sets of elements used in
                   the same way, that are used to build all
                   OR groups in the content models of the DTDs.
                   These may be over-ridden by the DTD-
                   specific class Parameter Entities.

default-mixes .ent       
                 - Sets up the original mix definitions,
                   which are sets of classes used in
                   the same way, that are used to build some
                   OR groups in the content models of the DTDs.
                   These may be over-ridden by the DTD-
                   specific mix Parameter Entities.


------------------------------------------------------

2.4 DTD Suite: Element Class Modules 
               (Define elements, attributes for one class)

articlemeta.ent  - Article-level metadata elements 
backmatter.ent   - Article-level back matter elements
display.ent      - Display elements such as Table, Figure, Graphic
format.ent       - Format-related elements such as Bold
journalmeta.ent  - Journal-level metadata elements
link.ent         - Linking elements such as X(Cross)-Reference
list.ent         - List elements
math.ent         - NLM-defined math elements such as Display Equation
nlm-citation.ent - Model for NLM-defined bibliographic references
para.ent         - Paragraph-level elements such as Paragraph and
                      Block Quote
phrase.ent       - Phrase-level content-related elements
references.ent   - Bibliographic reference list and the elements
                      that can be used inside a citation
section.ent      - Section-level elements


------------------------------------------------------

2.5 DTD Suite: Math Modules 
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

2.6 DTD Suite: Table Modules 
               (Define XHTML Table Model)

These modules are defined in the Suite and should be invoked
from the DTD if table tagging is desired.

XHTML Table Model:
  XHTMLtablesetup.ent
                 -  DTD Suite module that sets up the
                    Parameter Entities for the XHTML
                    table model
  htmltable.dtd  - the public XHTML table model


------------------------------------------------------
2.7 DTD Suite: Notations and Special Characters

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
 


-------------  document end -------------------------------






















