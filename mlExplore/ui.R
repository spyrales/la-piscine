
largeurBandeau=350

dashboardPage(skin = 'green',
              dashboardHeader(title = "Machine Learning", titleWidth=largeurBandeau),
              dashboardSidebar(
                width=largeurBandeau,
                sidebarMenu(
                  id='menu',
                  getElement(tags, "div")(style = "font-size: 11px",
                    column(6, textInput('dossier', 'Dossier', value = 'exemples')), column(6,uiOutput('uiFichiers')),
                    column(12,uiOutput('uiTarget')),
                    column(12,uiOutput('uiDummies')),
                    column(12,uiOutput('uiTo_drop')),
                    uiOutput('uiModeles')
                  ),
                  menuItem('Données',tabName = 'donnees'),
                  menuItem('Présentation des modèles',tabName = 'presentation'),
                  menuItem("Résultats", tabName = "resultats"),
                  menuItem('Eléments à avoir en tête',tabName = 'fiche1')
                )
              ),
              dashboardBody(tabItems(
                # ------------------------------------------------------------------------------------------------------------------------------------
                tabItem(tabName = "donnees", withMathJax(
                  setShadow(class = 'box'),
                  uiOutput('uiDonnees')
                )),
                # ------------------------------------------------------------------------------------------------------------------------------------
                tabItem(tabName = "presentation", withMathJax(
                  uiOutput('uiPresentation')
                )),
                # ------------------------------------------------------------------------------------------------------------------------------------
                tabItem(tabName = "resultats",
                  column(12, uiOutput('uiResultats'))
                ),
                # ------------------------------------------------------------------------------------------------------------------------------------
                tabItem(tabName = "fiche1", withMathJax(
                  setShadow(class = 'box'),
                  column(2,br()),box(width=8, includeMarkdown('markdown/ml_fiche1.Rmd'))
                ))
                # ------------------------------------------------------------------------------------------------------------------------------------
                
              ))
)
