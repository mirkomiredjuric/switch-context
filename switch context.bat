@setlocal enableextensions enabledelayedexpansion
@echo off
set input=%1
cd "c:\_CBS\metapodaci\CBSConfig"
git checkout .
git pull
git checkout %input%
copy "C:\_cbs\metapodaci\CBSConfig\context.xml" "C:\_cbs\JavaProjekti\CBSRetailConnect\src\main\webapp\META-INF\context.xml"
copy "C:\_cbs\metapodaci\CBSConfig\config.xml" "C:\_cbs\JavaProjekti\CBSRetailConnect\src\main\webapp\WEB-INF\metadata\config.xml"
copy "C:\_cbs\metapodaci\CBSConfig\appContext.xml" "C:\_cbs\JavaProjekti\CBSRetailConnect\src\main\webapp\WEB-INF\appContext.xml"
copy "C:\_cbs\metapodaci\CBSConfig\CBSRetail.xml" "C:\_cbs\FlexProjekti\CBSRetail\html-template\CBSRetail.xml"
copy "C:\_cbs\metapodaci\CBSConfig\Menu.xml" "C:\_cbs\metapodaci\config\Menu.xml"
ECHO (*************************************************************************)
ECHO (Pull-ovanje meta\Retail)
cd "c:\_CBS\metapodaci\Retail"
git checkout .
git checkout master
git pull
ECHO (*************************************************************************)
ECHO (Pull-ovanje meta\Petrol)
cd "c:\_CBS\metapodaci\Petrol"
git checkout .
git checkout master
git pull
if not x%input:Apios=%==x%input% (cd "C:\_cbs\JavaProjekti\ClientConfig"
git checkout . 
git checkout master 
git pull 
xcopy "C:\_cbs\JavaProjekti\ClientConfig\public_html\lukoilcro\meta\Retail" "C:\_cbs\metapodaci\Retail /E/Y"
xcopy "C:\_cbs\JavaProjekti\ClientConfig\public_html\lukoilcro\meta\Petrol" "C:\_cbs\metapodaci\Petrol /E/Y") 
endlocal
 