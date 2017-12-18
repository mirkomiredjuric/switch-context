@setlocal enableextensions enabledelayedexpansion
@echo off
set input=%1
set pocetnaPutanja="C:\_cbs"
cd "%pocetnaPutanja%\metapodaci\CBSConfig"
git checkout .
git checkout %input%
git pull
copy "%pocetnaPutanja%\metapodaci\CBSConfig\context.xml" "%pocetnaPutanja%\JavaProjekti\CBSRetailConnect\src\main\webapp\META-INF\context.xml"
copy "%pocetnaPutanja%\metapodaci\CBSConfig\config.xml" "%pocetnaPutanja%\JavaProjekti\CBSRetailConnect\src\main\webapp\WEB-INF\metadata\config.xml"
copy "%pocetnaPutanja%\metapodaci\CBSConfig\appContext.xml" "%pocetnaPutanja%\JavaProjekti\CBSRetailConnect\src\main\webapp\WEB-INF\appContext.xml"
copy "%pocetnaPutanja%\metapodaci\CBSConfig\CBSRetail.xml" "%pocetnaPutanja%\FlexProjekti\CBSRetail\html-template\CBSRetail.xml"
copy "%pocetnaPutanja%\metapodaci\CBSConfig\Menu.xml" "%pocetnaPutanja%\metapodaci\config\Menu.xml"
ECHO (*************************************************************************)
ECHO (Pull-ovanje meta\Retail)
cd "%pocetnaPutanja%\metapodaci\Retail"
git checkout .
git checkout master
git pull
ECHO (*************************************************************************)
ECHO (Pull-ovanje meta\Petrol)
cd "%pocetnaPutanja%\metapodaci\Petrol"
git checkout .
git checkout master
git pull
if not x%input:Apios=%==x%input% (cd "%pocetnaPutanja%\JavaProjekti\ClientConfig" 
git checkout . 
git checkout master 
git pull 
xcopy "%pocetnaPutanja%\JavaProjekti\ClientConfig\public_html\lukoilcro\meta\Retail" "%pocetnaPutanja%\metapodaci\Retail" /E/Y
xcopy "%pocetnaPutanja%\JavaProjekti\ClientConfig\public_html\lukoilcro\meta\Petrol" "%pocetnaPutanja%\metapodaci\Petrol" /E/Y) 
endlocal
 
