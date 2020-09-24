--------------------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}
import           Data.Monoid (mappend)
import           Hakyll

--------------------------------------------------------------------------------
------------------------------------ Atom --------------------------------------
--------------------------------------------------------------------------------

myFeedConfiguration :: FeedConfiguration
myFeedConfiguration = FeedConfiguration
    { feedTitle       = "Lambdanaut: Gamedev, FOSS, and Lambdanaut's life"
    , feedDescription = ""
    , feedAuthorName  = "Joshua Thomas"
    , feedAuthorEmail = "lambdanaut@protonmail.com"
    , feedRoot        = "http://lambdanaut.com"
    }

--------------------------------------------------------------------------------
main :: IO ()
main = hakyll $ do
    match "images/*" $ do
        route   idRoute
        compile copyFileCompiler
    match "images/*/*" $ do
        route   idRoute
        compile copyFileCompiler
    match "images/*/*/*" $ do
        route   idRoute
        compile copyFileCompiler

    match "css/*" $ do
        route   idRoute
        compile compressCssCompiler

    match "javascript/*" $ do
        route   idRoute
        compile copyFileCompiler
    match "javascript/*/*" $ do
        route   idRoute
        compile copyFileCompiler

    match "games/*" $ do
        route   idRoute
        compile copyFileCompiler
    match "games/*/*" $ do
        route   idRoute
        compile copyFileCompiler

    match "meta/*" $ do
        route   $ setExtension "html"
        compile $ getResourceBody
            >>= loadAndApplyTemplate "templates/layout.html" defaultContext
            >>= relativizeUrls

    match "posts/*" $ do
        route $ setExtension "html"
        compile $ pandocCompiler
            >>= loadAndApplyTemplate "templates/post.html" postCtx
            >>= saveSnapshot "content"
            >>= loadAndApplyTemplate "templates/layout.html" postCtx
            >>= relativizeUrls

    match "mesclin-posts/*" $ do
        route $ setExtension "html"
        compile $ pandocCompiler
            >>= loadAndApplyTemplate "templates/post.html" postCtx
            >>= saveSnapshot "content"
            >>= loadAndApplyTemplate "templates/layout.html" postCtx
            >>= relativizeUrls

    create ["archive.html"] $ do
        route idRoute
        compile $ do
            posts <- recentFirst =<< loadAll "posts/*"
            let archiveCtx =
                    listField "posts" postCtx (return posts) `mappend`
                    constField "title" "Archives"            `mappend`
                    defaultContext

            makeItem ""
                >>= loadAndApplyTemplate "templates/archive.html" archiveCtx
                >>= loadAndApplyTemplate "templates/layout.html" archiveCtx
                >>= relativizeUrls

    create ["mesclin.html"] $ do
        route idRoute
        compile $ do
            posts <- recentFirst =<< loadAll "mesclin-posts/*"
            let archiveCtx =
                    listField "posts" postCtx (return posts) `mappend`
                    constField "title" "Mescl.in Archives"   `mappend`
                    defaultContext

            makeItem ""
                >>= loadAndApplyTemplate "templates/mesclin.html" archiveCtx
                >>= loadAndApplyTemplate "templates/layout.html" archiveCtx
                >>= relativizeUrls

    create ["atom.xml"] $ do
        route idRoute
        compile $ do
            let feedCtx = postCtx `mappend` bodyField "description"
            posts <- fmap (take 10) . recentFirst =<<
                loadAllSnapshots "posts/*" "content"
            renderAtom myFeedConfiguration feedCtx posts

    match "index.html" $ do
        route idRoute
        compile $ do
            posts <- recentFirst =<< loadAll "posts/*"
            let indexCtx =
                    listField "posts" postCtx (return posts) `mappend`
                    constField "title" "Home"                `mappend`
                    defaultContext

            getResourceBody
                >>= applyAsTemplate indexCtx
                >>= loadAndApplyTemplate "templates/layout.html" indexCtx
                >>= relativizeUrls

    match "templates/*" $ compile templateCompiler


--------------------------------------------------------------------------------
postCtx :: Context String
postCtx =
    dateField "date" "%B %e, %Y" `mappend`
    defaultContext
