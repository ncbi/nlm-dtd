README.TXT                                  March 2003

This README names the modules delivered as Version 1.0 
of the Journal Archiving and Interchange DTD and 
Version 1.0 of the Archiving and Interchange DTD Suite.         

The rest of this README contains notes concerning:
  1.0 File Names
  2.0 Modules Specific to the Journal Archiving 
        and Interchange DTD
  3.0 Modules Forming the Archiving and Interchange 
        DTD Suite
      3.1 Element Class Modules
      3.2 Math Modules 
      3.3 Table Modules
      3.4 Notations and Special Characters
  4.0 Sample files for testing
  5.0 Statement of Intent 


------------------------------------------------------
1.0 File Names

catalog.ent - OASIS SOCAT catalog of the formal public
              identifier (fpi) and file names for each
              DTD and module.
              Not part of the DTD or the Suite proper, but 
              used to implement a system using the suite.


------------------------------------------------------
2.0 Modules Specific to the 
    Journal Archiving and Interchange DTD

archivearticle.dtd          
             - The DTD file for the Journal Archiving and 
               Interchange DTD. The DOCTYPE covers a 
               journal article as well as various
               non-article journal content such as book 
               and product reviews. This DTD invokes 
               almost all the modules in the Archiving 
               and Interchange DTD Suite.

archivecustomize.ent 
             - Customization module for the DTD. This
               secondary module forms the second part
               of the Journal Archiving and Interchange 
               DTD. The modules defines the classes, 
               mixes, and Parameter Entities for this 
               specific archival and interchange DTD. 
               
               (Every DTD made from the full Suite will 
               need to make its own customization 
               module. This module should be called 
               as the second module in a DTD, after the
               module that names the modules, modules.ent.)
 

------------------------------------------------------
3.0 Modules Forming the Archiving and Interchange 
    DTD Suite

modules.ent      - Names all the modules in the
                   Archiving and Interchange DTD Suite.
                   (Must be called as the first module
                   by any DTD) NOTE: May name modules
                   (such as the OASIS-Exchange module)
                   that are not called by a particular
                   DTD.

common.ent       - Defines all elements, attributes, 
                   entities, attribute values that are
                   used by more than one module in the
                   Suite. (Typically called as the third 
                   module in a DTD.)

These modules need to be invoked before all other modules 
in a DTD. Other modules can usually be invoked in any order,
and are typically invoked alphabetically.


------------------------------------------------------
3.1 Element Class Modules (define elements, attributes 
    for a single element class)

articlemeta.ent  - Article-level metadata elements 
backmatter.ent   - Article-level back matter elements
display.ent      - Display elements such as Table, Figure, 
                     Graphic
format.ent       - Format-related elements such as Bold
journalmeta.ent  - Journal-level metadata elements
link.ent         - Linking elements such as 
                     X(Cross)-Reference 
list.ent         - List elements
math.ent         - Suite-defined math elements such as 
                     Display Equation
para.ent         - Paragraph-level elements such as 
                     Paragraph and Display Quote
phrase.ent       - Phrase-level content-related elements
references.ent   - Bibliographic reference list and the 
                     elements that can be used inside a 
                     citation
section.ent      - Section-level elements


------------------------------------------------------
3.2 Math Modules (Define MathML tagging, used in math.ent)

These modules are defined in the suite and should be invoked
from the DTD if MathML tagging is desired. The Journal
Archiving and Interchange DTD calls these modules.

mathml2.dtd
mathmlsetup.ent

And inside the mathml subdirectory:
  mathml2-qname-1.mod
  mmlalias.ent
  mmlextra.ent

 
------------------------------------------------------
3.3 Table Modules (Define XHTML and OASIS Exchange Table Models))

These modules are defined in the suite and should be invoked
from the DTD if table tagging is desired. The Journal
Archiving and Interchange DTD calls the modules for the XHTML
table model but not those for the OASIS Exchange Table Model.

Using either table model requires two modules: one to set up the
Parameter Entities necessary to use the model, and the second to
define the model itself (as defined publicly).

Archiving and Interchange DTD Suite version (no namespaces) 
of the XHTML Table Model (called in the DTD)
  XHTMLtablesetup.ent (setup module)
  htmltable.dtd       (PUBLIC module)

Archiving and Interchange DTD Suite version (with namespaces) 
of the OASIS Exchange Table Model (not called in the DTD)
  oasis-tablesetup.ent  (setup module)
  oasis-exchange.ent    (Suite version of the PUBLIC module)


------------------------------------------------------
3.4 Notations and Special Characters

notat.ent        - Names all notations used
xmlspecchars.ent - Names all the standard special character
                      entity sets to be used by the DTD. The
                      MathML characters sets were used,
                      unchanged
chars.ent        - Definitions of DTD-specific and custom
                      special characters (as general entities
                      defined as hexadecimal or decimal character
                      entities - Unicode numbers or using the
                      <private-char> element.) 

All the MathML special character entity sets
(inside the xmlchars directory)
  isoamsa.ent
  isoamsb.ent
  isoamsc.ent
  isoamsn.ent
  isoamso.ent
  isoamsr.ent
  isobox.ent
  isocyr1.ent
  isocyr2.ent
  isodia.ent
  isogrk1.ent
  isogrk2.ent
  isogrk3.ent
  isogrk4.ent
  isolat1.ent
  isolat2.ent
  isomfrk.ent
  isomopf.ent
  isomscr.ent
  isonum.ent
  isopub.ent
  isotech.ent
 
 
------------------------------------------------------
4.0 Sample files for testing

sampleminimal.xml   - Stub file for simple parsing
samplesmall.xml     - Incomplete sample journal article
                      provided to test the DTD, and in 
                      specific to test table models
                      (Currently calls one table model 
                      but has been tested with three 
                      distinct table models.)
 
------------------------------------------------------
5.0 Statement of Intent 

 The Archiving and Interchange DTD Suite was created 
 for digital archives and publishers who wish to create 
 a custom XML DTD for original markup of journal 
 literature, books, and related material, or for 
 archiving and transferring such material between 
 archives. The Journal Archiving and Interchange DTD
 is a repository and interchange DTD for journal 
 articles and some non-article journal material, made
 using the modules of the suite.
 
 This DTD and the full Suite are in the public domain. 
 An organization that wishes to create its own DTD 
 from the suite may do so without permission from NLM.
 
 The suite has been set up to be extended using a
 new DTD file and a new DTD-specific Customization 
 Module to redefine the many Parameter Entities. 
 Do not modify the suite directly or redistribute
 modified versions of the suite. 
 
 In the interest of maintaining consistency and
 clarity for potential users, NLM requests:
 
 a. If you create a DTD from the Archiving and 
    Interchange DTD Suite and intend to stay 
    compatible with the suite, then please include 
    the following statement as a comment in all of 
    your DTD modules:
      "Created from, and fully compatible with, 
       the Archiving and Interchange DTD Suite."
 
 b. If you alter one or more modules of the suite, 
    then please rename your version and all its
    modules to avoid any confusion with the
    original suite. Also, please include the 
    following statement as a comment in all your 
    DTD modules: 
      "Based in part on, but not fully compatible 
       with, the Archiving and Interchange DTD 
       Suite."
 
 Suggestions for refinements and enhancements to 
 the DTD suite should be sent in email to: 
 archive-dtd@ncbi.nlm.nih.gov

------------ document end ----------------------------



