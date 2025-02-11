{-# LANGUAGE OverloadedStrings #-}

import           Hakyll
import           Data.List (intersperse)
import           Data.Monoid ( mappend )
import           Data.Maybe ( fromMaybe )
import           Control.Monad ( forM, mplus )
import           Text.Blaze.Html                 (toHtml, toValue, (!))
import qualified Text.Blaze.Html5                as H
import qualified Text.Blaze.Html5.Attributes     as A


-- Atom feed configuration
myFeedConfiguration :: FeedConfiguration
myFeedConfiguration = FeedConfiguration
    { feedTitle       = "Lambdanaut: Gamedev, FOSS, and Lambdanaut's life"
    , feedDescription = ""
    , feedAuthorName  = "Lambdanaut"
    , feedAuthorEmail = "lambdanaut@Lambdanaut.com"
    , feedRoot        = "http://lambdanaut.com"
    }


----------------------------------------------------------------------
-- Custom build tags functionality -----------------------------------
----------------------------------------------------------------------
data TagMetadata = TagMetadata
                 { tagName :: String
                 , tagUrl :: String
                 , tagCount :: Int
                 }


tagsMetadata :: Tags -> Compiler [TagMetadata]
tagsMetadata tags = do
    let tagsList = map fst $ tagsMap tags
    forM (tagsMap tags) $ \(tag, ids) -> do
        route' <- getRoute $ tagsMakeId tags tag
        return $ TagMetadata tag (fromMaybe "/" route') (length ids)

tagsFieldCustom :: String     -- ^ Destination key
                -> Tags       -- ^ Tags
                -> Context a  -- ^ Context
tagsFieldCustom =
  tagsFieldWith getTags Main.simpleRenderLink (mconcat . intersperse " ")

-- | Render one tag link
simpleRenderLink :: String -> (Maybe FilePath) -> Maybe H.Html
simpleRenderLink _   Nothing         = Nothing
simpleRenderLink tag (Just filePath) = Just $
    H.a ! A.title (H.stringValue ("All pages tagged '"++tag++"'."))
        ! A.href (toValue $ toUrl filePath)
        ! A.class_ "tag"
        $ toHtml tag

postCtx :: Tags -> Context String
postCtx tags =
    tagsFieldCustom "tags" tags
        `mappend` dateField "date" "%B %e, %Y"
        `mappend` defaultContext

main :: IO ()
main = hakyll $ do

    -- Create a postCtxWithTags constant as a helper to pass along post tags
    tags <- buildTags "posts/*" (fromCapture "tags/*.html")
    let postCtxWithTags = postCtx tags

    -- Generate an html page for each tag
    tagsRules tags $ \tag pattern -> do
        route idRoute
        compile $ do
            posts <- recentFirst =<< loadAll pattern
            let ctx = constField "tag" tag
                    `mappend` listField "posts" postCtxWithTags (return posts) 
                    `mappend` defaultContext
            makeItem ""
                >>= loadAndApplyTemplate "templates/tag.html"     ctx
                >>= loadAndApplyTemplate "templates/layout.html" ctx
                >>= relativizeUrls

    -- Page with all tags listed
    create ["tags.html"] $ do
        route idRoute
        compile $ do
            tags' <- tagsMetadata tags
            let tagsCtx =
                        listField
                                "tags"
                                (field "name" (return . tagName . itemBody)
                             <> field "url" (return . tagUrl . itemBody)
                                <> field "count" (return . show . tagCount . itemBody)
                                )
                                (sequence $ map makeItem $ tags')
                            `mappend` defaultContext

            getResourceBody
                >>= applyAsTemplate tagsCtx
                >>= loadAndApplyTemplate "templates/layout.html" tagsCtx
                >>= relativizeUrls

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
            >>= loadAndApplyTemplate "templates/post.html" postCtxWithTags
            >>= saveSnapshot "content"
            >>= loadAndApplyTemplate "templates/layout.html" postCtxWithTags
            >>= relativizeUrls

    create ["archive.html"] $ do
        route idRoute
        compile $ do
            posts <- recentFirst =<< loadAll "posts/*"
            let archiveCtx =
                    listField "posts" postCtxWithTags (return posts) `mappend`
                    constField "title" "Archives"            `mappend`
                    defaultContext

            makeItem ""
                >>= loadAndApplyTemplate "templates/archive.html" archiveCtx
                >>= loadAndApplyTemplate "templates/layout.html" archiveCtx
                >>= relativizeUrls

    create ["atom.xml"] $ do
        route idRoute
        compile $ do
            let feedCtx = postCtxWithTags `mappend` bodyField "description"
            posts <- fmap (take 10) . recentFirst =<<
                loadAllSnapshots "posts/*" "content"
            renderAtom myFeedConfiguration feedCtx posts

    match "404.html" $ do
        route idRoute
        compile $ pandocCompiler
            >>= loadAndApplyTemplate "templates/layout.html" postCtxWithTags

    match "index.html" $ do
        route idRoute
        compile $ do
            posts <- fmap (take 15) . recentFirst =<< loadAll "posts/*"
            let indexCtx =
                    listField "posts" postCtxWithTags (return posts) `mappend`
                    constField "title" "Home"                `mappend`
                    defaultContext

            getResourceBody
                >>= applyAsTemplate indexCtx
                >>= loadAndApplyTemplate "templates/layout.html" indexCtx
                >>= relativizeUrls

    match "templates/*" $ compile templateCompiler

